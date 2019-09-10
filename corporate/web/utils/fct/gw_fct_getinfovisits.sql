/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/

DROP FUNCTION IF EXISTS "SCHEMA_NAME"."gw_fct_getinfovisits"(varchar, varchar, int4, timestamp, timestamp, varchar, varchar, int8);
CREATE OR REPLACE FUNCTION "SCHEMA_NAME"."gw_fct_getinfovisits"(p_element_type varchar, id varchar, device int4, visit_start text, visit_end text, p_parameter_type varchar, p_parameter_id varchar, visit_id int8) RETURNS pg_catalog.json AS 
$BODY$

/*
SELECT SCHEMA_NAME.gw_fct_getinfovisits('arc', '2078', 3,'2014-03-26T00:00:00.000Z','2019-03-27T00:00:00.000Z','INSPECTION','desperfectes_arc',NULL) AS result
SELECT SCHEMA_NAME.gw_fct_getinfovisits('arc', '139', 3,'2014-05-24T00:00:00.000Z','',NULL,'10',NULL) AS result
SELECT SCHEMA_NAME.gw_fct_getinfovisits('node', '1111', 3,'2014-10-00:00.000Z','',NULL,NULL,NULL) AS result
SELECT SCHEMA_NAME.gw_fct_getinfovisits('node', '1111', 3,'','',NULL,NULL,NULL) AS result
*/

DECLARE

--    Variables
    query_result character varying;
    query_result_dates character varying;
    query_result_visits json;
    query_result_visits_dates json;    
    parameter_type_options json;
    parameter_id_options json;
    api_version json;

BEGIN

--    Set search path to local schema
    SET search_path = "SCHEMA_NAME", public;
    
--  get api version
    EXECUTE 'SELECT row_to_json(row) FROM (SELECT value FROM config_param_system WHERE parameter=''ApiVersion'') row'
        INTO api_version;

-- fix diferent ways to say null on client
	visit_start = REPLACE (visit_start::text, '''''', null);
	visit_end = REPLACE (visit_end::text, '''''', null);

	IF visit_end IS NULL THEN visit_end=now(); END IF;
	RAISE NOTICE ' visit_end %', visit_end;
        
--  Harmonize element_type
    p_element_type := lower (p_element_type);
    IF RIGHT (p_element_type,1)=':' THEN
        p_element_type := reverse(substring(reverse(p_element_type) from 2 for 99));
    END IF;

--    Get query for visits
    EXECUTE 'SELECT query_text FROM config_web_forms WHERE table_id = concat($1,''_x_visit'') AND device = $2'
        INTO query_result
        USING p_element_type, device;

--    Add id filter
    query_result := query_result || ' WHERE ' || quote_ident( p_element_type || '_id') || ' = ' || quote_literal(id);

--    Add visit_start filter
    IF visit_start IS NOT NULL THEN
        query_result := query_result || ' AND visit_start > ' || quote_literal(visit_start);
    END IF;

--    Add visit_end filter
   IF visit_end IS NOT NULL THEN
        query_result := query_result || ' AND visit_end < ' || quote_literal(visit_end);
    END IF;

--    Query with dates filter
    query_result_dates := query_result;

--    Add parameter_type filter
    IF p_parameter_type IS NOT NULL THEN
        query_result := query_result || ' AND parameter_type = ' || quote_literal(p_parameter_type);
    END IF;


--    Make consistency against parameter_type and parameter_id
   IF p_parameter_type IS NOT NULL AND p_parameter_id IS NOT NULL AND 
	(SELECT om_visit_parameter.id FROM om_visit_parameter WHERE parameter_type=p_parameter_type AND om_visit_parameter.id=p_parameter_id) IS NULL THEN
	p_parameter_id=null;
   ELSIF p_parameter_type is null  then 
	p_parameter_id=null;
   END IF;

--    Add parameter_id filter
    IF p_parameter_id IS NOT NULL THEN
        query_result := query_result || ' AND parameter_id = ' || quote_literal(p_parameter_id);
    END IF;

--    Add visit_id filter
    IF visit_id IS NOT NULL THEN
        query_result := query_result || ' AND sys_visit_id = ' || visit_id;
    END IF;

raise notice 'applied filters p_parameter_type % p_parameter_id %', p_parameter_type, p_parameter_id;


--    Get visits with all the filters
   IF query_result IS NOT NULL THEN
    EXECUTE ('SELECT array_to_json(array_agg(row_to_json(a))) FROM ( ' || (query_result) || ' ORDER by sys_date desc) a')
        INTO query_result_visits
        USING id;

--    Get visits with just date filters
    EXECUTE fORMAT ('SELECT array_to_json(array_agg(row_to_json(a))) FROM ( ' || (query_result) || ' ORDER by sys_date desc) a')
        INTO query_result_visits_dates
        USING id;
    END IF;


--    Get parameter_type_options
    IF query_result_visits_dates ISNULL THEN
        EXECUTE 'SELECT array_to_json(array_agg(row_to_json(a))) FROM ( SELECT '''' as id,'''' as name) a'      
            INTO parameter_type_options;
   ELSE
        EXECUTE ('SELECT array_to_json(array_agg(row_to_json(a))) FROM 
		( SELECT '''' as id ,'''' as name UNION SELECT sys_parameter_type AS "id", sys_parameter_type AS "name" FROM 
			(SELECT DISTINCT sys_parameter_type FROM ( ' || (query_result_dates) || ' ) c ) b ORDER BY name) a')
            INTO parameter_type_options
                    USING p_parameter_type;
                    
    END IF;
    
--    Get query_result_parameter_id_options
    IF query_result_visits_dates ISNULL THEN
   
        EXECUTE 'SELECT array_to_json(array_agg(json_data)) FROM (SELECT row_to_json(t) AS json_data FROM 
       (SELECT '' '' as id, '' '' as name FROM om_visit_parameter UNION SELECT id, descript AS "name" FROM om_visit_parameter 
            WHERE  feature_type = UPPER($1) AND parameter_type = $2 order by name) t  ) r'  
            INTO parameter_id_options
            USING p_element_type, p_parameter_type;
    ELSE    
        EXECUTE ('SELECT array_to_json(array_agg(row_to_json(a))) FROM (SELECT '' '' as id, '' '' as name FROM om_visit_parameter UNION 
        SELECT DISTINCT sys_parameter_id AS "id", sys_parameter_name AS "name" FROM ( ' || (query_result_dates) || ' )b WHERE sys_parameter_type=$1 order by name asc) a')
        INTO parameter_id_options
        USING p_parameter_type;
    END IF;

--    Control NULL's
    query_result_visits := COALESCE(query_result_visits, '{}');
    parameter_type_options := COALESCE(parameter_type_options, '{}');
    parameter_id_options := COALESCE(parameter_id_options, '{}');

--    Return
    RETURN ('{"status":"Accepted"' ||
        ', "apiVersion":'|| api_version ||
        ', "events":' || query_result_visits || 
        ', "parameter_type_options":' || parameter_type_options ||
        ', "parameter_id_options":' || parameter_id_options ||
        '}')::json;    


--    Exception handling
   -- EXCEPTION WHEN OTHERS THEN 
     --   RETURN ('{"status":"Failed","SQLERR":' || to_json(SQLERRM) || ', "apiVersion":'|| api_version ||',"SQLSTATE":' || to_json(SQLSTATE) || '}')::json;
        
END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE COST 100;

