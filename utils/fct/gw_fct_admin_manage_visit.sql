/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/

--FUNCTION CODE: 2746

drop function if exists SCHEMA_NAME.gw_fct_admin_manage_visit(json);
CREATE OR REPLACE FUNCTION SCHEMA_NAME.gw_fct_admin_manage_visit(p_data json)
  RETURNS json AS
$BODY$

/*EXAMPLE

SINGLE EVENT
SELECT SCHEMA_NAME.gw_fct_admin_manage_visit($${"client":{"lang":"ES"}, "feature":{"feature_type":"NODE"},
"data":{"action":"CREATE", "action_type":"class", "parameters":{"class_name":"LEAK_NODE67","parameter_id":"param_leak_node67", "active":"True","ismultifeature":"false","ismultievent":"False",
"visit_type":1,  "parameter_type":"INSPECTION", "data_type":"text", "code":"123", 
"v_param_options":null, "form_type":"event_standard","vdefault":null, "short_descript":null, "viewname":"aaa_ve_node_leak67"}}}$$);

		SELECT SCHEMA_NAME.gw_fct_admin_manage_visit($${"client":{"lang":"ES"}, "feature":{"feature_type":"NODE"},
		"data":{"action":"CREATE", "action_type":"parameter", "parameters":{"class_name":"LEAK_NODE67","parameter_id":"param_leak_node67", "active":"True","ismultifeature":"false","ismultievent":"False",
		"visit_type":1,  "parameter_type":"INSPECTION", "data_type":"integer", "code":"123", 
		"v_param_options":null, "form_type":"event_standard","vdefault":1, "short_descript":null, "viewname":"aaa_ve_node_leak67","isenabled":"True",
		"widgettype":"text", "isenabled":"True", "iseditable":"True", "ismandatory":"True", "dv_querytext":null}}}$$);

-------------


SELECT SCHEMA_NAME.gw_fct_admin_manage_visit($${"client":{"lang":"ES"}, "feature":{"feature_type":"NODE"},
"data":{"action":"CREATE", "action_type":"class", "parameters":{"class_name":"LEAK_NODE","parameter_id":"param_leak_node", "active":"True","ismultifeature":"false","ismultievent":"True",
"visit_type":1,  "parameter_type":"INSPECTION", "data_type":"text", "code":"123", 
"v_param_options":null, "form_type":"event_standard","vdefault":null, "short_descript":null, "viewname":"aaa_ve_node_leak"}}}$$);

		SELECT SCHEMA_NAME.gw_fct_admin_manage_visit($${"client":{"lang":"ES"}, "feature":{"feature_type":"NODE"},
		"data":{"action":"CREATE", "action_type":"parameter", "parameters":{"class_name":"LEAK_NODE","parameter_id":"param_leak_node28", "active":"True","ismultifeature":"false","ismultievent":"True",
		"visit_type":1,  "parameter_type":"INSPECTION", "data_type":"text", "code":"123", 
		"v_param_options":null, "form_type":"event_standard","vdefault":1, "short_descript":null, "viewname":"aaa_ve_node_leak","isenabled":"True",
		"widgettype":"text", "isenabled":"True", "iseditable":"True", "ismandatory":"True", "dv_querytext":null}}}$$);

SELECT SCHEMA_NAME.gw_fct_admin_manage_visit($${"client":{"lang":"ES"}, "feature":{"feature_type":"NODE"},
"data":{"action":"UPDATE", "action_type":"parameter", "parameters":{"class_name":"LEAK_NODE","parameter_id":"param_leak_node3", "active":"True","ismultifeature":"false","ismultievent":"True",
"visit_type":1,  "parameter_type":"INSPECTION", "data_type":"text", "code":"aaa", 
"v_param_options":null, "form_type":"event_standard","vdefault":null, "short_descript":"true", "viewname":"aaa_ve_node_leak","widgettype":"combo",
"isenabled":"True", "iseditable":"True", "ismandatory":"True", "dv_querytext":"SELECT muni_id as id, name as idval FROM ext_municipality"}}}$$);


SELECT SCHEMA_NAME.gw_fct_admin_manage_visit($${"client":{"lang":"ES"}, "feature":{"feature_type":"NODE"},
"data":{"action":"UPDATE", "action_type":"class", "parameters":{"class_id":"20","class_name":"LEAK_NODE","parameter_id":"param_leak_node", "active":"True","ismultifeature":"false","ismultievent":"True",
"visit_type":1,  "parameter_type":"INSPECTION", "data_type":"text", "code":"777", 
"v_param_options":null, "form_type":"event_standard","vdefault":null, "short_descript":"true", "viewname":"aaa_ve_node_leak","widgettype":"combo",
"isenabled":"True", "iseditable":"True", "ismandatory":"True", "dv_querytext":"SELECT muni_id as id, name as idval FROM ext_municipality"}}}$$);


SELECT SCHEMA_NAME.gw_fct_admin_manage_visit($${"client":{"lang":"ES"}, "feature":{"feature_type":"NODE"},
"data":{"action":"DELETE", "action_type":"class", "parameters":{"class_id":"9"}}}$$);

SELECT SCHEMA_NAME.gw_fct_admin_manage_visit($${"client":{"lang":"ES"}, "feature":{"feature_type":"NODE"},
"data":{"action":"DELETE", "action_type":"parameter","parameters":{"class_id":"9","class_name":"LEAK_NODE","parameter_id":"param_leak_node4",
"viewname":"aaa_ve_node_leak","ismultievent":"true"}}}$$);


SELECT SCHEMA_NAME.gw_fct_admin_manage_visit($${"client":{"lang":"ES"}, "feature":{"feature_type":"NODE"},
"data":{"action":"CONFIGURATION", "action_type":"null","parameters":{"class_id":"16", "viewname":"ve_visit_node_test"}}}$$);

-- fid: 219

*/

DECLARE 

v_schemaname text;
v_project_type text;

v_feature_system_id text;
v_class_name text;
v_active boolean;
v_visit_type integer;
v_ismultievent boolean;
v_ismultifeature boolean;
v_data_type text;
v_config_data_type text;
v_parameter_type text;
v_descript text;
v_form_type text;
v_vdefault text;
v_short_descript text;
v_action text;
v_param_options json;
v_class_id integer;
v_action_type text;
v_param_name text;
v_code text;
v_widgettype text;
v_data_view json;
	
v_om_visit_x_feature_fields text;
v_om_visit_fields text;
v_old_parameters record;
v_new_parameters record;
v_viewname text;
v_definition text;
v_old_viewname text;
v_config_fields text;
rec record;
v_layout_order integer;
v_isenabled boolean;
v_dv_querytext text;
v_ismandatory boolean;
v_iseditable boolean;

v_result text;
v_result_info text;
v_result_point text;
v_result_line text;
v_result_polygon text;
v_error_context text;
v_audit_result text;
v_level integer;
v_status text;
v_message text;
v_hide_form boolean;	
v_version text;		
v_layoutorder integer;

BEGIN
	
	-- search path
	SET search_path = "SCHEMA_NAME", public;

 	SELECT project_type, giswater INTO v_project_type,v_version FROM sys_version LIMIT 1;

 	--set current process as users parameter
    DELETE FROM config_param_user  WHERE  parameter = 'utils_cur_trans' AND cur_user =current_user;

    INSERT INTO config_param_user (value, parameter, cur_user)
    VALUES (txid_current(),'utils_cur_trans',current_user );
    
	SELECT value::boolean INTO v_hide_form FROM config_param_user where parameter='qgis_form_log_hidden' AND cur_user=current_user;

	-- get input parameters -,man_addfields
	v_schemaname = 'SCHEMA_NAME';
	--v_id = (SELECT nextval('config_addfields_parameter_id_seq') +1);

	v_action = ((p_data ->>'data')::json->>'action')::text;
	v_action_type = ((p_data ->>'data')::json->>'action_type')::text;

	v_viewname = (((p_data ->>'data')::json->>'parameters')::json->>'viewname')::text; 
	v_class_id = (((p_data ->>'data')::json->>'parameters')::json->>'class_id')::integer; 
	v_class_name = (((p_data ->>'data')::json->>'parameters')::json->>'class_name')::text; 
	v_feature_system_id = lower(((p_data ->>'feature')::json->>'feature_type')::text);
	v_active = (((p_data ->>'data')::json->>'parameters')::json->>'active')::text;
	v_visit_type = (((p_data ->>'data')::json->>'parameters')::json->>'visit_type')::text;
	v_ismultievent = (((p_data ->>'data')::json->>'parameters')::json->>'ismultievent')::boolean;
	v_ismultifeature = (((p_data ->>'data')::json->>'parameters')::json->>'ismultifeature')::text;
	v_param_name = (((p_data ->>'data')::json->>'parameters')::json->>'parameter_id')::text; 

	v_data_type = (((p_data ->>'data')::json->>'parameters')::json->>'data_type')::text; 
	v_parameter_type = (((p_data ->>'data')::json->>'parameters')::json->>'parameter_type')::text;
	v_code = (((p_data ->>'data')::json->>'parameters')::json->>'code')::text;
	v_descript = (((p_data ->>'data')::json->>'parameters')::json->>'descript')::text;
	v_form_type = (((p_data ->>'data')::json->>'parameters')::json->>'form_type')::text;
	v_vdefault = (((p_data ->>'data')::json->>'parameters')::json->>'default')::text;
	v_short_descript = (((p_data ->>'data')::json->>'parameters')::json->>'short_descript')::text;
	v_param_options = (((p_data ->>'data')::json->>'parameters')::json->>'v_param_options')::json;
	v_widgettype = (((p_data ->>'data')::json->>'parameters')::json->>'widgettype')::text;
	v_isenabled = (((p_data ->>'data')::json->>'parameters')::json->>'isenabled')::boolean;

	v_ismandatory = (((p_data ->>'data')::json->>'parameters')::json->>'ismandatory')::boolean;
	v_iseditable = (((p_data ->>'data')::json->>'parameters')::json->>'iseditable')::text;
	v_dv_querytext = (((p_data ->>'data')::json->>'parameters')::json->>'dv_querytext')::text;

	IF v_data_type = 'text' THEN 
		v_config_data_type = 'string';
	END IF;

	-- delete old values on result table
	DELETE FROM audit_check_data WHERE fid = 219 AND cur_user=current_user;
	
	-- Starting process
	INSERT INTO audit_check_data (fid, result_id, criticity, error_message) VALUES (219, null, 4, 'CREATE VISIT');
	INSERT INTO audit_check_data (fid, result_id, criticity, error_message) VALUES (219, null, 4, '-------------------------------------------------------------');

	--capture the id of the class
	IF v_class_id IS NULL AND  v_action_type = 'parameter' THEN
		SELECT id INTO v_class_id FROM config_visit_class WHERE idval = v_class_name;

		INSERT INTO audit_check_data (fid, result_id, criticity, error_message)
		VALUES (219, null, 4, concat('Update class ', v_class_id,' - ',v_class_name,'.'));
	END IF;
	
	--capture current parameters related to the class
	SELECT string_agg(concat('a.',config_visit_parameter.id),',' order by config_visit_parameter.id) as a_param,
	string_agg(concat('ct.',config_visit_parameter.id),',' order by config_visit_parameter.id) as ct_param,
	string_agg(concat('(''''',config_visit_parameter.id,''''')'),',' order by config_visit_parameter.id) as id_param,
	string_agg(concat(config_visit_parameter.id,' ', lower(config_visit_parameter.data_type)),', ' order by config_visit_parameter.id) as datatype
	INTO v_old_parameters
	FROM config_visit_parameter JOIN config_visit_class_x_parameter ON config_visit_parameter.id=config_visit_class_x_parameter.parameter_id
	WHERE class_id=v_class_id AND config_visit_parameter.active IS TRUE AND config_visit_class_x_parameter.active IS TRUE;

	raise notice 'v_old_parameters,%,%',v_old_parameters,v_class_id;

	--reset the value of sequence for tables where data will be inserted
	PERFORM setval('SCHEMA_NAME.om_visit_class_id_seq', (SELECT max(id) FROM config_visit_class), true);

	IF v_action = 'CREATE' THEN
		--insert new class and parameter
		IF v_action_type = 'class' THEN
			INSERT INTO config_visit_class (idval, descript, active, ismultifeature, ismultievent, feature_type, sys_role, visit_type, param_options)
			VALUES (v_class_name, v_descript, v_active, v_ismultifeature, v_ismultievent,upper(v_feature_system_id), 'role_om', v_visit_type, v_param_options::json)
			RETURNING id INTO v_class_id;

			INSERT INTO audit_check_data (fid, result_id, criticity, error_message)
			VALUES (219, null, 4, concat('Create new class ', v_class_id,' - ',v_class_name,'.'));

			--insert values into api config
			IF (SELECT visitclass_id FROM config_api_visit WHERE visitclass_id = v_class_id) IS NULL THEN
				IF v_ismultievent = TRUE THEN
					INSERT INTO config_api_visit (visitclass_id, formname, tablename) VALUES (v_class_id, v_viewname, v_viewname);
				ELSE
					INSERT INTO config_api_visit (visitclass_id, formname, tablename) 
					VALUES (v_class_id, v_viewname, concat('ve_visit_',v_feature_system_id,'_singlevent'));
				END IF;

				INSERT INTO audit_check_data (fid, result_id, criticity, error_message)
				VALUES (219, null, 4, concat('Insert values into config_api_visit.'));
			END IF;
			
			IF (SELECT visitclass_id FROM config_visit_class_x_feature WHERE visitclass_id = v_class_id AND active IS TRUE) IS NULL THEN
				INSERT INTO config_visit_class_x_feature (visitclass_id, tablename, active) VALUES (v_class_id, concat('v_edit_',v_feature_system_id), TRUE);	

				INSERT INTO audit_check_data (fid, result_id, criticity, error_message)
				VALUES (219, null, 4, concat('Insert values into config_visit_class_x_feature.'));
			END IF;
			
			IF (SELECT formname FROM config_form_fields WHERE formname = v_viewname) IS NULL THEN
				
				--capture common fields names that need to be copied for the specific visit form
				EXECUTE 'SELECT DISTINCT string_agg(column_name::text,'' ,'')
				FROM information_schema.columns WHERE table_name=''config_form_fields'' and table_schema='''||v_schemaname||'''
				AND column_name!=''formname'';'
				INTO v_config_fields;
				
				RAISE NOTICE 'v_config_fields,%',v_config_fields;

				--insert common fields for the new formname (view)
				IF v_ismultievent = TRUE THEN
					FOR rec IN (SELECT * FROM config_form_fields WHERE formname='visit_multievent')
					LOOP
						EXECUTE 'INSERT INTO config_form_fields(formname,'||v_config_fields||')
						SELECT '''||v_viewname||''','||v_config_fields||' FROM config_form_fields
						WHERE columnname='''||rec.columnname||''';';
					END LOOP;
				ELSE
					FOR rec IN (SELECT * FROM config_form_fields WHERE formname='visit_singlevent')
					LOOP
						EXECUTE 'INSERT INTO config_form_fields(formname,'||v_config_fields||')
						SELECT '''||v_viewname||''','||v_config_fields||' FROM config_form_fields
						WHERE columnname='''||rec.columnname||''';';
					END LOOP;
				END IF;

				UPDATE config_form_fields SET columnname = concat(v_feature_system_id,'_id'), label = concat(initcap(v_feature_system_id),'_id')
				WHERE columnname = 'feature_id' and formname = v_viewname;

				INSERT INTO audit_check_data (fid, result_id, criticity, error_message)
				VALUES (219, null, 4, concat('Insert definition of common visit fields into config_form_fields.'));

				--rename dv_querytext for class_id in order to look for defined feature_type
				IF v_feature_system_id = 'connec' THEN
					UPDATE config_form_fields SET dv_querytext= 'SELECT id, idval FROM config_visit_class WHERE feature_type=''CONNEC'' AND 
					active IS TRUE AND sys_role IN (SELECT rolname FROM pg_roles WHERE  pg_has_role( current_user, oid, ''member''))'
					WHERE formname=v_viewname AND columnname='class_id';
				ELSIF v_feature_system_id = 'node' THEN
					UPDATE config_form_fields SET dv_querytext= 'SELECT id, idval FROM config_visit_class WHERE feature_type=''NODE'' AND 
					active IS TRUE AND sys_role IN (SELECT rolname FROM pg_roles WHERE  pg_has_role( current_user, oid, ''member''))'
					WHERE formname=v_viewname AND columnname='class_id';
				ELSIF v_feature_system_id = 'gully' THEN
					UPDATE config_form_fields SET dv_querytext= 'SELECT id, idval FROM config_visit_class WHERE feature_type=''GULLY'' AND 
					active IS TRUE AND sys_role IN (SELECT rolname FROM pg_roles WHERE  pg_has_role( current_user, oid, ''member''))'
					WHERE formname=v_viewname AND columnname='class_id';
				END IF;
			END IF;
			
		ELSIF v_action_type = 'parameter' THEN
			
			IF v_viewname NOT IN (SELECT id FROM sys_table) AND v_ismultievent iS TRUE THEN
				INSERT INTO sys_table (id, description, sys_role, sys_criticity, qgis_criticity)
				VALUES (v_viewname, 'Editable view that saves visits', 'role_om', 0, 0);

				INSERT INTO audit_check_data (fid, result_id, criticity, error_message)
				VALUES (219, null, 4, concat('Insert view name into sys_table.'));
			END IF;

			--insert new parameter
			INSERT INTO config_visit_parameter(id, code, parameter_type, feature_type, data_type, descript, form_type, vdefault, 
			ismultifeature, short_descript, active)
			VALUES (v_param_name, v_code, v_parameter_type, upper(v_feature_system_id),v_data_type, v_descript, v_form_type, v_vdefault,
			v_ismultifeature, v_short_descript, TRUE);

			--relate new parameters with new class
			INSERT INTO config_visit_class_x_parameter (class_id, parameter_id, active)
			VALUES (v_class_id, v_param_name, TRUE);

			INSERT INTO audit_check_data (fid, result_id, criticity, error_message)
			VALUES (219, null, 4, concat('Insert parameter ',v_param_name,' into config_visit_parameter and relate it with class ',v_class_id,' in config_visit_class_x_parameter.'));

			--add configuration of new parameters to config_form_fields
			IF v_ismultievent = TRUE THEN
				EXECUTE 'SELECT max(layoutorder) + 1 FROM config_form_fields WHERE formname='''||v_viewname||'''
				AND layout_name = ''data_1'';'
				INTO v_layoutorder;

				INSERT INTO config_form_fields (formname, formtype, columnname, layout_id, layoutorder, isenabled, datatype, widgettype, label, layout_name,
				iseditable, ismandatory, dv_querytext)
				VALUES (v_viewname, 'visit', v_param_name,1,v_layoutorder, true, v_data_type, v_widgettype, v_param_name, 'data_1',
				v_iseditable, v_ismandatory, v_dv_querytext);

				INSERT INTO audit_check_data (fid, result_id, criticity, error_message)
				VALUES (219, null, 4, concat('Insert new parameter definition into config_form_fields.'));
			END IF;

		END IF;	

		--check if th visit is multievent
		IF v_ismultievent = TRUE and v_action_type = 'parameter' THEN

				--check if the view for this visit already exists if not create one
			
				IF (SELECT EXISTS ( SELECT 1 FROM   information_schema.tables WHERE  table_schema = v_schemaname AND table_name = v_viewname)) IS FALSE THEN
					v_data_view = '{"schema":"'||v_schemaname ||'","body":{"viewname":"'||v_viewname||'",
					"feature_system_id":"'||v_feature_system_id||'","class_id":"'||v_class_id||'","old_a_param":"null", "old_ct_param":"null",
					"old_id_param":"null","old_datatype":"null"}}';
					raise notice 'v_data_view,%',v_data_view;
					PERFORM gw_fct_admin_manage_visit_view(v_data_view);			


					INSERT INTO audit_check_data (fid, result_id, criticity, error_message)
					VALUES (219, null, 4, concat('Create view ',v_viewname,' for class ',v_class_id,'.'));

				ELSE

					--if the view doesn't exist and there are parameters defined for the class or add new parameter to the class
					v_data_view = '{"schema":"'||v_schemaname ||'","body":{"viewname":"'||v_viewname||'",
					"feature_system_id":"'||v_feature_system_id||'","class_id":"'||v_class_id||'","old_a_param":"'||v_old_parameters.a_param||'", 
					"old_ct_param":"'||v_old_parameters.ct_param||'", "old_id_param":"'||v_old_parameters.id_param||'","old_datatype":"'||v_old_parameters.datatype||'"}}';

					PERFORM gw_fct_admin_manage_visit_view(v_data_view);	

					INSERT INTO audit_check_data (fid, result_id, criticity, error_message)
					VALUES (219, null, 4, concat('Recreate view ',v_viewname,' for class ',v_class_id,'.'));
				END IF;
		END IF;
	END IF;

	PERFORM gw_fct_admin_role_permissions();

	INSERT INTO audit_check_data (fid, result_id, criticity, error_message)
	VALUES (118, null, 4, 'Set role permissions.');

	-- get results
	-- info
	SELECT array_to_json(array_agg(row_to_json(row))) INTO v_result
	FROM (SELECT id, error_message as message FROM audit_check_data 
	WHERE cur_user="current_user"() AND fid=219 ORDER BY criticity desc, id asc) row;
	
	IF v_audit_result is null THEN
        v_status = 'Accepted';
        v_level = 3;
        v_message = 'Process done successfully';
    ELSE
        SELECT ((((v_audit_result::json ->> 'body')::json ->> 'data')::json ->> 'info')::json ->> 'status')::text INTO v_status; 
        SELECT ((((v_audit_result::json ->> 'body')::json ->> 'data')::json ->> 'info')::json ->> 'level')::integer INTO v_level;
        SELECT ((((v_audit_result::json ->> 'body')::json ->> 'data')::json ->> 'info')::json ->> 'message')::text INTO v_message;
    END IF;

	v_result_info := COALESCE(v_result, '{}'); 
	v_result_info = concat ('{"geometryType":"", "values":',v_result_info, '}');

	v_result_point = '{"geometryType":"", "features":[]}';
	v_result_line = '{"geometryType":"", "features":[]}';
	v_result_polygon = '{"geometryType":"", "features":[]}';

	--  Return
     RETURN ('{"status":"'||v_status||'", "message":{"level":'||v_level||', "text":"'||v_message||'"}, "version":"'||v_version||'"'||
             ',"body":{"form":{}'||
		     ',"data":{ "info":'||v_result_info||','||
		     	'"setVisibleLayers":[]'||','||
				'"point":'||v_result_point||','||
				'"line":'||v_result_line||','||
				'"polygon":'||v_result_polygon||'}'||
				', "actions":{"hideForm":' || v_hide_form || '}'||
		       '}'||
	    '}')::json;

	--EXCEPTION WHEN OTHERS THEN
	GET STACKED DIAGNOSTICS v_error_context = PG_EXCEPTION_CONTEXT;
	RETURN ('{"status":"Failed","NOSQLERR":' || to_json(SQLERRM) || ',"SQLSTATE":' || to_json(SQLSTATE) ||',"SQLCONTEXT":' || to_json(v_error_context) || '}')::json;

END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;