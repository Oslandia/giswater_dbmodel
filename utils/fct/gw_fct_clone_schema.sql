/*
This file is part of Giswater
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/

--FUNCTION CODE: 2122

/*
SELECT SCHEMA_NAME.gw_fct_clone_schema($${
"client":{"device":9, "infoType":100, "lang":"ES"}, 
"form":{}, 
"data":{"parameters":{"source_schema":"SCHEMA_NAME","dest_schema":"SCHEMA_NAME_copy6"}}}$$);
*/

DROP FUNCTION IF EXISTS "SCHEMA_NAME".clone_schema(text, text);

CREATE OR REPLACE FUNCTION "SCHEMA_NAME".gw_fct_clone_schema(p_data json)
RETURNS json LANGUAGE plpgsql AS $$


DECLARE
    rec_view record;
    rec_fk record;
    rec_table text;
    v_tablename text;
    v_default text;
    v_column text;
    v_source_schema text; 
    v_dest_schema text;
    v_version text;
    v_error_context text;
    rec_fct record;
    v_fct_definition text;
    v_query_text text;
    v_id_field text;
    rec_seq  record;

    v_result json;
    v_result_info json;
    v_result_point json;
    v_result_polygon json;
    v_result_line json;

BEGIN

    -- Search path
    SET search_path = "SCHEMA_NAME", public;

    SELECT  giswater INTO  v_version FROM version order by id desc limit 1;

    -- get input data   
    v_source_schema := ((p_data ->>'data')::json->>'parameters')::json->>'source_schema'::text;
    v_dest_schema := ((p_data ->>'data')::json->>'parameters')::json->>'dest_schema'::text;

    -- Create destination schema
    EXECUTE 'CREATE SCHEMA ' || v_dest_schema ;
     
    -- Sequences
    FOR rec_table IN
        SELECT sequence_name FROM information_schema.SEQUENCES WHERE sequence_schema = v_source_schema
    LOOP
        EXECUTE 'CREATE SEQUENCE ' || v_dest_schema || '.' || rec_table;
    END LOOP;
     
    -- Tables
    FOR rec_table IN
        SELECT table_name FROM information_schema.TABLES WHERE table_schema = v_source_schema AND table_type = 'BASE TABLE' ORDER BY table_name
    LOOP
      
        -- Create table in destination schema
        v_tablename := v_dest_schema || '.' || rec_table;
        EXECUTE 'CREATE TABLE ' || v_tablename || ' (LIKE ' || v_source_schema || '.' || rec_table || ' INCLUDING CONSTRAINTS INCLUDING INDEXES INCLUDING DEFAULTS)';
        
        -- Set contraints
        FOR v_column, v_default IN
            SELECT column_name, REPLACE(column_default, v_source_schema, v_dest_schema) 
            FROM information_schema.COLUMNS 
            WHERE table_schema = v_dest_schema AND table_name = rec_table AND column_default LIKE 'nextval(%' || v_source_schema || '%::regclass)'
        LOOP
            EXECUTE 'ALTER TABLE ' || v_tablename || ' ALTER COLUMN ' || v_column || ' SET DEFAULT ' || v_default;
        END LOOP;
        
        -- Copy table contents to destination schema
        EXECUTE 'INSERT INTO ' || v_tablename || ' SELECT * FROM ' || v_source_schema || '.' || rec_table;  
        
    END LOOP;
        
    -- Views
    FOR rec_view IN
        SELECT table_name, REPLACE(view_definition, v_source_schema, v_dest_schema) as definition FROM information_schema.VIEWS WHERE table_schema = v_source_schema
    LOOP
        EXECUTE 'CREATE VIEW ' || v_dest_schema || '.' || rec_view.table_name || ' AS ' || rec_view.definition;
    END LOOP;


    --Functions
    FOR rec_fct IN 
        SELECT routine_name,concat(routine_name,'(',string_agg(parameters.data_type,', '),')') FROM information_schema.routines
       LEFT JOIN information_schema.parameters ON routines.specific_name=parameters.specific_name
        WHERE routines.specific_schema='SCHEMA_NAME' and routine_name!='audit_function'
        group by routine_name
    LOOP
        EXECUTE 'select * from pg_get_functiondef('''|| rec_fct.routine_name||'''::regproc)'
        INTO v_fct_definition;
        v_fct_definition = REPLACE (v_fct_definition,v_source_schema, v_dest_schema);
        EXECUTE v_fct_definition;

        RAISE NOTICE 'rec_fct,%',rec_fct;
    END LOOP;

    -- fk,check
    FOR rec_fk IN
        SELECT distinct on (conname) conrelid::regclass AS tablename, conname AS constraintname, pg_get_constraintdef(c.oid) AS definition
        FROM   pg_constraint c JOIN   pg_namespace n ON n.oid = c.connamespace
        join   information_schema.table_constraints tc ON conname=constraint_name WHERE contype IN ('f','c','u')
        AND nspname =v_source_schema
    LOOP
        v_query_text:=  'ALTER TABLE '||v_dest_schema || '.' || rec_fk.tablename||' DROP CONSTRAINT IF EXISTS '|| rec_fk.constraintname||';';
        EXECUTE v_query_text;
        v_query_text:=  'ALTER TABLE '||v_dest_schema || '.' || rec_fk.tablename||' ADD CONSTRAINT '|| rec_fk.constraintname|| ' '||rec_fk.definition||';';
        EXECUTE v_query_text;

    END LOOP;

    --reset sequences
    FOR rec_seq IN
        (SELECT seq_ns.nspname as sequence_schema, seq.relname as sequence_name, tab.relname as related_table
        FROM pg_class seq JOIN pg_namespace seq_ns on seq.relnamespace = seq_ns.oid
        JOIN pg_depend d ON d.objid = seq.oid AND d.deptype = 'a' 
        JOIN pg_class tab ON d.objid = seq.oid AND d.refobjid = tab.oid
        WHERE seq.relkind = 'S' AND seq_ns.nspname = v_source_schema)
    LOOP

        EXECUTE 'SELECT distinct on (conname) replace(replace(pg_get_constraintdef(c.oid), ''PRIMARY KEY ('',''''),'')'','''') 
        FROM   pg_constraint c JOIN   pg_namespace n ON n.oid = c.connamespace
        join   information_schema.table_constraints tc ON conname=constraint_name WHERE contype =''p'' 
        AND nspname = '''||v_source_schema||''' AND table_name = '''||rec_seq.related_table||''';'
        INTO v_id_field;
        
        EXECUTE 'SELECT setval('''||v_dest_schema||'.'||rec_seq.sequence_name||''', 
        (SELECT max('||v_id_field||')+1 FROM '||rec_seq.related_table||'), true);';

    END LOOP;
        
        EXECUTE 'SELECT setval('''||v_dest_schema||'.urn_id_seq'', gw_fct_setvalurn(),true);';

        PERFORM audit_function(0,2122);


    v_result_info := COALESCE(v_result, '{}'); 
    v_result_info = concat ('{"geometryType":"", "values":',v_result_info, '}');

    --geometry

    v_result_line = '{"geometryType":"", "values":[]}';
    v_result_polygon = '{"geometryType":"", "values":[]}';
    v_result_point = '{"geometryType":"", "values":[]}';

--  Return
    RETURN ('{"status":"Accepted", "message":{"priority":1, "text":"Copy schema done successfully"}, "version":"'||v_version||'"'||
             ',"body":{"form":{}'||
             ',"data":{ "info":'||v_result_info||','||
                '"setVisibleLayers":[]'||','||
                '"point":'||v_result_point||','||
                '"line":'||v_result_line||','||
                '"polygon":'||v_result_polygon||'}'||
               '}'||
        '}')::json;

    EXCEPTION WHEN OTHERS THEN
     GET STACKED DIAGNOSTICS v_error_context = PG_EXCEPTION_CONTEXT;
     RETURN ('{"status":"Failed","NOSQLERR":' || to_json(SQLERRM) || ',"SQLSTATE":' || to_json(SQLSTATE) ||',"SQLCONTEXT":' || to_json(v_error_context) || '}')::json;

 
END;
$$;   


/*select event_object_schema as table_schema,
       event_object_table as table_name,
       trigger_schema,
       trigger_name,
       string_agg(event_manipulation, ',') as event,
       action_timing as activation,
       action_condition as condition,
       action_statement as definition
from information_schema.triggers
where event_object_schema = 'SCHEMA_NAME'
group by 1,2,3,4,6,7,8
order by table_schema,
         table_name;
*/