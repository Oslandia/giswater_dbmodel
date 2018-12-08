﻿CREATE OR REPLACE FUNCTION ws_sample.gw_api_get_formfields(
    p_formname character varying,
    p_formtype character varying,
    p_tabname character varying,
    p_tablename character varying,
    p_idname character varying,
    p_id character varying,
    p_columntype character varying,
    p_tgop character varying,
    p_filterfield character varying,
    p_device integer)
  RETURNS text[] AS
$BODY$

/*EXAMPLE
SELECT ws_sample.gw_api_get_formfields('go2epa', 'form', 'data', null, null, null, null, null, null,null)
SELECT ws_sample.gw_api_get_formfields('ve_arc_pipe', 'feature', 'data', NULL, NULL, NULL, NULL, 'INSERT', null, 3)
SELECT ws_sample.gw_api_get_formfields('visit_arc_leak', 'visit', 'data', NULL, NULL, NULL, NULL, 'INSERT', null, 3)

*/


DECLARE
--    Variables
    fields json;
    fields_array json[];
    aux_json json;    
    aux_json_child json;    
    combo_json json;
    combo_json_child json;
    schemas_array name[];
    array_index integer DEFAULT 0;
    field_value character varying;
    field_value_parent text;
    api_version json;
    v_selected_id text;
    query_text text;
    v_vdefault text;
    v_query_text text;
    v_id int8;
    v_project_type varchar;
    v_return json;
    v_como_id json;
    v_orderby_child text;
    v_orderby text;
    v_dv_querytext_child text;
    v_dv_querytext text;
    v_image json;
    v_bmapsclient boolean;
    
BEGIN

--   Set search path to local schema
     SET search_path = "ws_sample", public;

--   Get schema name
     schemas_array := current_schemas(FALSE);

--   get api version
     EXECUTE 'SELECT row_to_json(row) FROM (SELECT value FROM config_param_system WHERE parameter=''ApiVersion'') row'
	INTO api_version;

-- Get project type
    SELECT wsoftware INTO v_project_type FROM version LIMIT 1;
    SELECT value INTO v_bmapsclient FROM config_param_system WHERE parameter = 'api_bmaps_client';

-- Get fields	
	IF p_formname!='infoplan' THEN 
		IF v_bmapsclient is true THEN
			EXECUTE 'SELECT array_agg(row_to_json(a)) FROM (SELECT label, column_id, concat('||quote_literal(p_tabname)||',''_'',column_id) AS name, widgettype as type,
				widgetdim, datatype AS "dataType" , tooltip, placeholder, iseditable, row_number()over(ORDER BY layout_id, layout_order) AS orderby, layout_id, 
				concat('||quote_literal(p_tabname)||',''_'',layout_id) as layoutname, layout_order, dv_parent_id, isparent, widgetfunction as "changeAction", dv_querytext, dv_querytext_filterc, 
				action_function, isautoupdate, dv_orderby_id, dv_isnullvalue, isreload, stylesheet FROM config_api_form_fields WHERE formname = $1 AND formtype= $2 ORDER BY orderby) a'
					INTO fields_array
					USING p_formname, p_formtype;	
		ELSE
			EXECUTE 'SELECT array_agg(row_to_json(a)) FROM (SELECT label, column_id, concat('||quote_literal(p_tabname)||',''_'',column_id) AS widgetname, widgettype,
				widgetdim, datatype , tooltip, placeholder, iseditable, row_number()over(ORDER BY layout_id, layout_order) AS orderby, layout_id, 
				concat('||quote_literal(p_tabname)||',''_'',layout_id) as layoutname, layout_order, dv_parent_id, isparent, widgetfunction, dv_querytext, dv_querytext_filterc, 
				action_function, isautoupdate, dv_orderby_id, dv_isnullvalue, isreload, stylesheet FROM config_api_form_fields WHERE formname = $1 AND formtype= $2 ORDER BY orderby) a'
					INTO fields_array
					USING p_formname, p_formtype;
		END IF;
	ELSE
		EXECUTE 'SELECT array_agg(row_to_json(b)) FROM (
			SELECT (row_number()over(ORDER BY 1)) AS layout_order, (row_number()over(ORDER BY 1)) AS orderby,* FROM 
			(SELECT ''individual'' as widtget_context, concat(unit, ''. '', descript) AS label, identif AS column_id, ''label'' AS widgettype, concat ('||quote_literal(p_tabname)||',''_'',identif) AS widgetname, ''string'' AS datatype, 
			NULL AS tooltip, NULL AS placeholder, FALSE AS iseditable, orderby as ordby, 1 AS layout_id,  NULL AS dv_parent_id, NULL AS isparent, NULL AS button_function, NULL AS dv_querytext, 
			NULL AS dv_querytext_filterc, NULL AS action_function, NULL AS isautoupdate, concat (measurement,'' '',unit,'' x '', cost , '' €/'',unit,'' = '', total_cost::numeric(12,2), '' €'') as value, stylesheet
			FROM ' ||p_tablename|| ' WHERE ' ||p_idname|| ' = $2
			UNION
			SELECT ''resumen'' as widtget_context, label AS form_label, column_id, widgettype, concat ('||quote_literal(p_tabname)||',''_'',column_id) AS widgetname, datatype, 
			tooltip, placeholder, iseditable, layout_order AS ordby, layout_id,  NULL AS dv_parent_id, NULL AS isparent, NULL AS widgetfunction, NULL AS dv_querytext, 
			NULL AS dv_querytext_filterc, NULL AS action_function, NULL AS isautoupdate, null as value
			FROM config_api_form_fields WHERE formname  = ''infoplan'' ORDER BY 1,ordby) a
			ORDER BY 1) b'
				INTO fields_array
				USING p_formname, p_id ;
	END IF;

	raise notice 'fields_array %', fields_array;

	fields_array := COALESCE(fields_array, '{}');  
	FOREACH aux_json IN ARRAY fields_array
	LOOP
		-- for image widgets
		IF (aux_json->>'widgettype')='image' THEN
		      	EXECUTE (aux_json->>'dv_querytext') INTO v_image; 
			fields_array[(aux_json->>'orderby')::INT] := gw_fct_json_object_set_key(fields_array[(aux_json->>'orderby')::INT], 'imageVal:', COALESCE(v_image, '[]'));
		END IF;
	
		-- for (combo/combotext not child) and (parent) widgets
		IF (aux_json->>'isparent')::boolean IS TRUE OR ((aux_json->>'widgettype') = 'combo' AND (aux_json->>'dv_parent_id') IS NULL) THEN

			-- Define the order by column
			IF (aux_json->>'dv_orderby_id')::boolean IS TRUE THEN
				v_orderby='id';
			ELSE 
				v_orderby='idval';
			END IF;

			-- Enable null values
			IF (aux_json->>'dv_isnullvalue')::boolean IS TRUE THEN
				v_dv_querytext = concat ('SELECT id, idval FROM value_type WHERE typevalue=''nullvalue'' UNION ',(aux_json->>'dv_querytext'));
			ELSE 
				v_dv_querytext=(aux_json->>'dv_querytext');
			END IF;

			IF (aux_json->>'widgettype') = 'combo' THEN
			  -- Get combo id's
			  EXECUTE 'SELECT array_to_json(array_agg(id)) FROM ('||v_dv_querytext||' ORDER BY '||v_orderby||' )a'
				INTO combo_json;
				v_como_id = combo_json;
			  fields_array[(aux_json->>'orderby')::INT] := gw_fct_json_object_set_key(fields_array[(aux_json->>'orderby')::INT], 'comboIds', COALESCE(combo_json, '[]'));

			  -- Get combo values
			  EXECUTE 'SELECT array_to_json(array_agg(idval)) FROM ('||v_dv_querytext||' ORDER BY '||v_orderby||' )a'
				INTO combo_json; 
			  fields_array[(aux_json->>'orderby')::INT] := gw_fct_json_object_set_key(fields_array[(aux_json->>'orderby')::INT], 'comboNames', COALESCE(combo_json, '[]'));


			  -- Get selected value
			  IF p_tgop ='INSERT' THEN
				v_vdefault:=quote_ident(aux_json->>'column_id');
				EXECUTE 'SELECT value::text FROM audit_cat_param_user JOIN config_param_user ON audit_cat_param_user.id=parameter WHERE cur_user=current_user AND feature_field_id='||quote_literal(v_vdefault)
					INTO field_value_parent;
			  ELSE 
				EXECUTE 'SELECT ' || quote_ident(aux_json->>'column_id') || ' FROM ' || quote_ident(p_tablename) || ' WHERE ' || quote_ident(p_idname) || ' = CAST(' || quote_literal(p_id) || ' AS ' || p_columntype || ')' 
					INTO field_value_parent; 
			  END IF;
			  IF v_vdefault IS NULL THEN
				IF p_filterfield is not null THEN
					fields_array[(aux_json->>'orderby')::INT] := gw_fct_json_object_set_key(fields_array[(aux_json->>'orderby')::INT], 'selectedId', p_filterfield);
				ELSE	
					fields_array[(aux_json->>'orderby')::INT] := gw_fct_json_object_set_key(fields_array[(aux_json->>'orderby')::INT], 'selectedId', v_como_id->0);
				END IF;
			  ELSE
				fields_array[(aux_json->>'orderby')::INT] := gw_fct_json_object_set_key(fields_array[(aux_json->>'orderby')::INT], 'selectedId', v_vdefault);
			  END IF;

			END IF;
			
			IF field_value_parent IS NULL THEN
				IF p_filterfield is not null THEN
					fields_array[(aux_json->>'orderby')::INT] := gw_fct_json_object_set_key(fields_array[(aux_json->>'orderby')::INT], 'selectedId', p_filterfield);
				ELSE
					fields_array[(aux_json->>'orderby')::INT] := gw_fct_json_object_set_key(fields_array[(aux_json->>'orderby')::INT], 'selectedId', v_como_id->0);
				END IF;
			ELSE
				fields_array[(aux_json->>'orderby')::INT] := gw_fct_json_object_set_key(fields_array[(aux_json->>'orderby')::INT], 'selectedId', field_value_parent);
			END IF;

			-- for chids of that parents
			IF (aux_json->>'isparent')::boolean IS TRUE THEN
			
				FOREACH aux_json_child IN ARRAY fields_array
				LOOP	
					IF (aux_json_child->>'dv_parent_id') = (aux_json->>'column_id') THEN

					   IF (aux_json_child->>'widgettype') = 'combo' THEN

						SELECT (json_array_elements(array_to_json(fields_array[(aux_json->> 'orderby')::INT:(aux_json->> 'orderby')::INT])))->>'selectedId' INTO v_selected_id;	

						-- Define the order by column
						IF (aux_json_child->>'dv_orderby_id')::boolean IS TRUE THEN
							v_orderby_child='id';
						ELSE 
							v_orderby_child='idval';
						END IF;	
								
						-- Enable null values
						IF (aux_json_child->>'dv_isnullvalue')::boolean IS TRUE THEN
							v_dv_querytext_child = concat ('SELECT id, idval FROM value_type WHERE typevalue=''nullvalue'' UNION ',(aux_json_child->>'dv_querytext'));
						ELSE 
							v_dv_querytext_child=(aux_json_child->>'dv_querytext');
						END IF;
						
						-- Get combo id's
						IF (aux_json_child->>'dv_querytext_filterc') IS NOT NULL AND v_selected_id IS NOT NULL THEN		
							query_text= 'SELECT array_to_json(array_agg(id)) FROM ('|| v_dv_querytext_child || (aux_json_child->>'dv_querytext_filterc')||' '||quote_literal(v_selected_id)||' ORDER BY idval) a';
							execute query_text INTO combo_json_child;
							
						ELSE 	
							EXECUTE 'SELECT array_to_json(array_agg(id)) FROM ('||(aux_json_child->>'dv_querytext')||' ORDER BY '||v_orderby_child||')a' INTO combo_json_child;
							
						END IF;
						
						fields_array[(aux_json_child->>'orderby')::INT] := gw_fct_json_object_set_key(fields_array[(aux_json_child->>'orderby')::INT], 'comboIds', COALESCE(combo_json_child, '[]'));
						
						-- Get combo values
						IF (aux_json_child->>'dv_querytext_filterc') IS NOT NULL THEN
							query_text= 'SELECT array_to_json(array_agg(idval)) FROM ('|| v_dv_querytext_child ||(aux_json_child->>'dv_querytext_filterc')||' '||quote_literal(v_selected_id)||' ORDER BY idval) a';
							execute query_text INTO combo_json_child;
						ELSE 	
							EXECUTE 'SELECT array_to_json(array_agg(idval)) FROM ('||(aux_json_child->>'dv_querytext')||' ORDER BY '||v_orderby_child||')a'
								INTO combo_json_child;
						END IF;
		
						combo_json_child := COALESCE(combo_json_child, '[]');
						fields_array[(aux_json_child->>'orderby')::INT] := gw_fct_json_object_set_key(fields_array[(aux_json_child->>'orderby')::INT], 'comboNames', combo_json_child);		
					  END IF;
				END IF;
			END LOOP;
		    END IF;	
		END IF;	
	END LOOP;

--    Convert to json
    fields := array_to_json(fields_array);


--    Control NULL's
      api_version := COALESCE(api_version, '[]');
      fields := COALESCE(fields, '[]');    
    
--   WARNING: In spite this function allows to the API, due it's a intermediate function, never will be called on directy and due this don't returns JSON and dont' have the control json format
	
--    Return
      RETURN (fields_array);

--    Exception handling
 --   EXCEPTION WHEN OTHERS THEN 
   --     RETURN ('{"status":"Failed","SQLERR":' || to_json(SQLERRM) || ', "apiVersion":'|| api_version ||',"SQLSTATE":' || to_json(SQLSTATE) || '}')::json;


END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION ws_sample.gw_api_get_formfields(character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, integer)
  OWNER TO postgres;
