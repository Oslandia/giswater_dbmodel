/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/

--FUNCTION CODE: 2794

DROP FUNCTION IF EXISTS SCHEMA_NAME.gw_fct_audit_check_project(INTEGER);
CREATE OR REPLACE FUNCTION SCHEMA_NAME.gw_fct_audit_check_project(p_data json)
  RETURNS json AS
$BODY$

/*
SELECT SCHEMA_NAME.gw_fct_audit_check_project($${"client":{"device":9, "infoType":100, "lang":"ES"}, "form":{}, 
"feature":{}, "data":{"filterFields":{}, "qgisVersion":"3.10.003.1", "initProject":"false", "pageInfo":{}, "version":"3.3.019", "fprocesscat_id":1}}$$);
*/

DECLARE 
v_querytext text;
v_sys_rows text;
v_parameter text;
v_audit_rows integer;
v_compare_sign text;
v_isenabled boolean;
v_diference integer;
v_error integer;
v_count integer;
v_table_host text;
v_table_dbname text;
v_table_schema text;
v_query_string text;
v_max_seq_id int8;
v_project_type text;
v_psector_vdef integer;
v_errortext text;
v_result_id text;
v_rectable record;
v_version text;
v_srid integer;
v_result_layers_criticity3 json;
v_result_layers_criticity2 json;
v_return json;
v_missing_layers json;
v_schema text;
v_layer_list text;
v_result_point json;
v_result_line json;
v_result_polygon json;
v_result json;
v_result_info json;
v_fprocesscat_id_aux integer;
v_qgis_version text;
v_qmlpointpath text = '';
v_qmllinepath text = '';
v_qmlpolpath text = '';
v_user_control boolean = false;
v_layer_log boolean = false;
v_error_context text;
v_hidden_form boolean;
v_init_project boolean;
v_qgisversion text;
v_osversion text;
v_qgis_init_guide_map boolean;

BEGIN 

	-- search path
	SET search_path = "SCHEMA_NAME", public;
	v_schema = 'SCHEMA_NAME';

	SELECT wsoftware, giswater, epsg INTO v_project_type, v_version, v_srid FROM version order by id desc limit 1;
	
	-- Get input parameters
	v_fprocesscat_id_aux := (p_data ->> 'data')::json->> 'fprocesscat_id';
	v_qgis_version := (p_data ->> 'data')::json->> 'version';
	v_init_project := (p_data ->> 'data')::json->> 'initProject';
	v_qgisversion := (p_data ->> 'data')::json->> 'qgisVersion';
	v_osversion := (p_data ->> 'data')::json->> 'osVersion';

	
	-- get user parameters
	SELECT value INTO v_qmlpointpath FROM config_param_user WHERE parameter='qgis_qml_pointlayer_path' AND cur_user=current_user;
	SELECT value INTO v_qmllinepath FROM config_param_user WHERE parameter='qgis_qml_linelayer_path' AND cur_user=current_user;
	SELECT value INTO v_qmlpolpath FROM config_param_user WHERE parameter='qgis_qml_pollayer_path' AND cur_user=current_user;
	SELECT value INTO v_user_control FROM config_param_user where parameter='audit_project_user_control' AND cur_user=current_user;
	SELECT value INTO v_layer_log FROM config_param_user where parameter='audit_project_layer_log' AND cur_user=current_user;
	SELECT value INTO v_hidden_form FROM config_param_user where parameter='qgis_form_initproject_hidden' AND cur_user=current_user;
	SELECT value INTO v_qgis_init_guide_map FROM config_param_user where parameter='qgis_init_guide_map' AND cur_user=current_user;

	-- when funcion gw_fct_audit_check_project is called by click on utils button, force to show user dialog and user control
	IF v_init_project IS FALSE THEN
		v_user_control = TRUE;
		v_hidden_form = FALSE;
	END IF;
	
	-- init process
	v_isenabled:=FALSE;
	v_count=0;

	-- delete old values on result table
	DELETE FROM audit_check_data WHERE fprocesscat_id=101 AND cur_user=current_user;
	DELETE FROM audit_check_data WHERE fprocesscat_id IN (14,15,25,95) AND cur_user=current_user;

	
	-- Starting process
	INSERT INTO audit_check_data (fprocesscat_id, result_id, criticity, error_message) VALUES (101, null, 4, 'AUDIT CHECK PROJECT');
	INSERT INTO audit_check_data (fprocesscat_id, result_id, criticity, error_message) VALUES (101, null, 4, '-------------------------------------------------------------');

	INSERT INTO audit_check_data (fprocesscat_id, result_id, criticity, error_message) VALUES (101, null, 3, 'CRITICAL ERRORS');	
	INSERT INTO audit_check_data (fprocesscat_id, result_id, criticity, error_message) VALUES (101, null, 3, '----------------------');	

	INSERT INTO audit_check_data (fprocesscat_id, result_id, criticity, error_message) VALUES (101, null, 2, 'WARNINGS');	
	INSERT INTO audit_check_data (fprocesscat_id, result_id, criticity, error_message) VALUES (101, null, 2, '--------------');	

	INSERT INTO audit_check_data (fprocesscat_id, result_id, criticity, error_message) VALUES (101, null, 1, 'INFO');
	INSERT INTO audit_check_data (fprocesscat_id, result_id, criticity, error_message) VALUES (101, null, 1, '-------');


	IF v_qgis_version = v_version THEN
		v_errortext=concat('Giswater version: ',v_version,'.');
		INSERT INTO audit_check_data (fprocesscat_id,  criticity, error_message) 
		VALUES (101, 4, v_errortext);
	ELSE
		v_errortext=concat('ERROR: Version of plugin is different than the database version. DB: ',v_version,', plugin: ',v_qgis_version,'.');
		INSERT INTO audit_check_data (fprocesscat_id,  criticity, error_message) 
		VALUES (101, 3, v_errortext);
	END IF;

	INSERT INTO audit_check_data (fprocesscat_id,  criticity, error_message) VALUES (101, 4, concat ('PostgreSQL versión: ',(SELECT version())));
	INSERT INTO audit_check_data (fprocesscat_id,  criticity, error_message) VALUES (101, 4, concat ('PostGIS versión: ',(SELECT postgis_version())));
	INSERT INTO audit_check_data (fprocesscat_id,  criticity, error_message) VALUES (101, 4, concat ('QGIS versión: ', v_qgisversion));
	INSERT INTO audit_check_data (fprocesscat_id,  criticity, error_message) VALUES (101, 4, concat ('O/S versión: ', v_osversion));
		
	
	-- Reset urn sequence
	IF v_project_type='WS' THEN
		SELECT GREATEST (
		(SELECT max(node_id::int8) FROM node WHERE node_id ~ '^\d+$'),
		(SELECT max(arc_id::int8) FROM arc WHERE arc_id ~ '^\d+$'),
		(SELECT max(connec_id::int8) FROM connec WHERE connec_id ~ '^\d+$'),
		(SELECT max(element_id::int8) FROM element WHERE element_id ~ '^\d+$'),
		(SELECT max(pol_id::int8) FROM polygon WHERE pol_id ~ '^\d+$')
		) INTO v_max_seq_id;
	ELSIF v_project_type='UD' THEN
		SELECT GREATEST (
		(SELECT max(node_id::int8) FROM node WHERE node_id ~ '^\d+$'),
		(SELECT max(arc_id::int8) FROM arc WHERE arc_id ~ '^\d+$'),
		(SELECT max(connec_id::int8) FROM connec WHERE connec_id ~ '^\d+$'),
		(SELECT max(gully_id::int8) FROM gully WHERE gully_id ~ '^\d+$'),
		(SELECT max(element_id::int8) FROM element WHERE element_id ~ '^\d+$'),
		(SELECT max(pol_id::int8) FROM polygon WHERE pol_id ~ '^\d+$')
		) INTO v_max_seq_id;
	END IF;	

	v_errortext=concat('Logged as ', current_user,' on ', now());
	
	INSERT INTO audit_check_data (fprocesscat_id,  criticity, error_message) VALUES (101, 4, v_errortext);

	IF v_max_seq_id IS NOT null THEN
		EXECUTE 'SELECT setval(''SCHEMA_NAME.urn_id_seq'','||v_max_seq_id||', true)';
	END IF;
	
	-- Special cases (doc_seq. inp_vertice_seq)
	SELECT max(id::integer) FROM doc WHERE id ~ '^\d+$' into v_max_seq_id;
	IF v_max_seq_id IS NOT null THEN
		EXECUTE 'SELECT setval(''SCHEMA_NAME.doc_seq'','||v_max_seq_id||', true)';
	END IF;
	
	IF v_project_type='WS' THEN 
		PERFORM setval('SCHEMA_NAME.inp_vertice_id_seq', 1, true);
	ELSE 
		PERFORM setval('SCHEMA_NAME.inp_vertice_seq', 1, true);
	END IF;
	
	--Set hydrology_selector when null values from user
	IF v_project_type='UD' THEN
		IF (SELECT hydrology_id FROM selector_inp_hydrology WHERE cur_user = current_user) IS NULL THEN
			INSERT INTO selector_inp_hydrology (hydrology_id, cur_user) VALUES (1, current_user);
		END IF;
	END IF;

	--Reset the rest of sequences
	FOR v_rectable IN SELECT * FROM sys_table WHERE sys_sequence IS NOT NULL AND sys_sequence_field IS NOT NULL AND sys_sequence!='urn_id_seq' AND sys_sequence!='doc_seq' AND isdeprecated IS NOT TRUE
	LOOP 
		v_query_string:= 'SELECT max('||v_rectable.sys_sequence_field||') FROM '||v_rectable.id||';' ;
		EXECUTE v_query_string INTO v_max_seq_id;	
		IF v_max_seq_id IS NOT NULL AND v_max_seq_id > 0 THEN 
			EXECUTE 'SELECT setval(''SCHEMA_NAME.'||v_rectable.sys_sequence||' '','||v_max_seq_id||', true)';			
		END IF;
	END LOOP;

	v_errortext=concat('Reset all sequences on project data schema.');
	INSERT INTO audit_check_data (fprocesscat_id,  criticity, error_message) VALUES (101, 4, v_errortext);

	-- set mandatory values of config_param_user in case of not exists (for new users or for updates)
	FOR v_rectable IN SELECT * FROM sys_param_user WHERE ismandatory IS TRUE AND sys_role_id IN (SELECT rolname FROM pg_roles WHERE pg_has_role(current_user, oid, 'member'))
	LOOP
		IF v_rectable.id NOT IN (SELECT parameter FROM config_param_user WHERE cur_user=current_user) THEN
			INSERT INTO config_param_user (parameter, value, cur_user) 
			SELECT sys_param_user.id, vdefault, current_user FROM sys_param_user WHERE sys_param_user.id = v_rectable.id;	

			v_errortext=concat('Set value for new variable in config param user: ',v_rectable.id,'.');

			INSERT INTO audit_check_data (fprocesscat_id,  criticity, error_message) VALUES (101, 4, v_errortext);
		END IF;
	END LOOP;

	-- set all exploitations when v_qgis_init_guide_map is true
	IF v_qgis_init_guide_map THEN
		INSERT INTO selector_expl (expl_id, cur_user) SELECT expl_id, current_user FROM exploitation
		ON CONFLICT (expl_id, cur_user) DO NOTHING;
	END IF;

	-- arrange vnode
	UPDATE vnode set state=0 FROM link WHERE link.exit_type ='VNODE' and exit_id = vnode_id::text AND link.state=0;
	UPDATE vnode set state=1 FROM link WHERE link.exit_type ='VNODE' and exit_id = vnode_id::text AND link.state=1;

	-- manage mandatory values of config_param_user where feature is deprecated
	IF 'role_admin' IN (SELECT rolname FROM pg_roles WHERE  pg_has_role( current_user, oid, 'member')) AND v_project_type='WS' THEN
	
		DELETE FROM sys_param_user WHERE id IN (SELECT sys_param_user.id FROM sys_param_user, node_type 
		WHERE active=false AND concat(lower(node_type.id),'_vdefault') = sys_param_user.id);

		DELETE FROM sys_param_user WHERE id IN (SELECT sys_param_user.id FROM sys_param_user, arc_type 
		WHERE active=false AND concat(lower(arc_type.id),'_vdefault') = sys_param_user.id);

		DELETE FROM sys_param_user WHERE id IN (SELECT sys_param_user.id FROM sys_param_user, connec_type 
		WHERE active=false AND concat(lower(connec_type.id),'_vdefault') = sys_param_user.id);

		v_errortext=concat('Inactive parameters have been deleted from sys_param_user.');
		INSERT INTO audit_check_data (fprocesscat_id,  criticity, error_message) VALUES (101, 4, v_errortext);
		
	END IF;

	-- delete on config_param_user fron updated values on sys_param_user
	DELETE FROM config_param_user WHERE parameter NOT IN (SELECT id FROM sys_param_user) AND cur_user = current_user;

	-- Force exploitation selector in case of null values
	IF (SELECT count(*) FROM selector_expl WHERE cur_user=current_user) < 1 THEN 
	  	INSERT INTO selector_expl (expl_id, cur_user) 
	  	SELECT expl_id, current_user FROM exploitation WHERE active IS NOT FALSE AND expl_id > 0 limit 1;
		v_errortext=concat('Set visible exploitation for user ',(SELECT expl_id FROM exploitation WHERE active IS NOT FALSE AND expl_id > 0 limit 1));
		INSERT INTO audit_check_data (fprocesscat_id,  criticity, error_message) VALUES (101, 4, v_errortext);
	END IF;

	-- Force state selector in case of null values
	IF (SELECT count(*) FROM selector_state WHERE cur_user=current_user) < 1 THEN 
	  	INSERT INTO selector_state (state_id, cur_user) VALUES (1, current_user);
		v_errortext=concat('Set feature state = 1 for user');
		INSERT INTO audit_check_data (fprocesscat_id,  criticity, error_message) VALUES (101, 4, v_errortext);
	END IF;
	
	-- Force hydrometer selector in case of null values
	IF (SELECT count(*) FROM selector_hydrometer WHERE cur_user=current_user) < 1 THEN 
	  	INSERT INTO selector_hydrometer (state_id, cur_user) VALUES (1, current_user);
		v_errortext=concat('Set hydrometer state = 1 for user');
		INSERT INTO audit_check_data (fprocesscat_id,  criticity, error_message) VALUES (101, 4, v_errortext);	
	END IF;
	
	-- Force psector vdefault visible to current_user (only to => role_master)
	IF 'role_master' IN (SELECT rolname FROM pg_roles WHERE  pg_has_role( current_user, oid, 'member')) THEN
	
		SELECT value::integer INTO v_psector_vdef FROM config_param_user WHERE parameter='psector_vdefault' AND cur_user=current_user;

		IF v_psector_vdef IS NULL THEN
			SELECT psector_id INTO v_psector_vdef FROM plan_psector WHERE status=2 LIMIT 1;
			IF v_psector_vdef IS NULL THEN
				v_errortext=concat('No current psector have been set. There are not psectors with status=2 on project');
				INSERT INTO audit_check_data (fprocesscat_id,  criticity, error_message) VALUES (101, 4, v_errortext);
			END IF;
		END IF;

		IF v_psector_vdef IS NOT NULL THEN
			INSERT INTO selector_psector (psector_id, cur_user) VALUES (v_psector_vdef, current_user) ON CONFLICT (psector_id, cur_user) DO NOTHING;
			v_errortext=concat('Current psector: ',v_psector_vdef);
			INSERT INTO audit_check_data (fprocesscat_id,  criticity, error_message) VALUES (101, 4, v_errortext);
		END IF;
	END IF;

	--If user has activated full project control, depending on user role - execute corresponding check function
	IF v_user_control THEN
		
		IF'role_om' IN (SELECT rolname FROM pg_roles WHERE  pg_has_role( current_user, oid, 'member')) THEN
			EXECUTE 'SELECT gw_fct_om_check_data($${
			"client":{"device":3, "infoType":100, "lang":"ES"},
			"feature":{},"data":{"parameters":{"selectionMode":"wholeSystem"}}}$$)';
			-- insert results 
			INSERT INTO audit_check_data  (fprocesscat_id, criticity, error_message) 
			SELECT 101, criticity, replace(error_message,':', ' (DB OM):') FROM audit_check_data 
			WHERE fprocesscat_id=25 AND criticity < 4 AND error_message !='' AND cur_user=current_user OFFSET 6 ;

			IF v_project_type = 'WS' THEN

				EXECUTE 'SELECT gw_fct_grafanalytics_check_data($${
				"client":{"device":3, "infoType":100, "lang":"ES"},
				"feature":{},"data":{"parameters":{"selectionMode":"wholeSystem", "grafClass":"ALL"}}}$$)';
				-- insert results 
				INSERT INTO audit_check_data  (fprocesscat_id, criticity, error_message) 
				SELECT 101, criticity, replace(error_message,':', ' (DB OM):') FROM audit_check_data 
				WHERE fprocesscat_id=111 AND criticity < 4 AND error_message !='' AND cur_user=current_user OFFSET 6 ;
			END IF;
		END IF;

		IF 'role_epa' IN (SELECT rolname FROM pg_roles WHERE  pg_has_role( current_user, oid, 'member')) THEN

				EXECUTE 'SELECT gw_fct_pg2epa_check_data($${
				"client":{"device":3, "infoType":100, "lang":"ES"},"feature":{},"data":{}}$$)';
				-- insert results 
				INSERT INTO audit_check_data  (fprocesscat_id, criticity, error_message) 
				SELECT 101, criticity, replace(error_message,':', ' (DB EPA):') FROM audit_check_data 
				WHERE fprocesscat_id=125 AND criticity < 4 AND error_message !='' AND cur_user=current_user OFFSET 6;		
		END IF;

		IF 'role_master' IN (SELECT rolname FROM pg_roles WHERE  pg_has_role( current_user, oid, 'member')) THEN

				EXECUTE 'SELECT gw_fct_plan_check_data($${
				"client":{"device":3, "infoType":100, "lang":"ES"},"feature":{},"data":{}}$$)';
				-- insert results 
				INSERT INTO audit_check_data  (fprocesscat_id, criticity, error_message) 
				SELECT 101, criticity, replace(error_message,':', ' (DB PLAN):') FROM audit_check_data 
				WHERE fprocesscat_id=15 AND criticity < 4 AND error_message !='' AND cur_user=current_user OFFSET 6;				
		END IF;

		IF 'role_admin' IN (SELECT rolname FROM pg_roles WHERE  pg_has_role( current_user, oid, 'member')) THEN
			EXECUTE 'SELECT gw_fct_admin_check_data($${"client":
			{"device":9, "infoType":100, "lang":"ES"}, "form":{}, "feature":{}, 
			"data":{"filterFields":{}, "pageInfo":{}, "parameters":{}}}$$)::text';
			-- insert results 
			INSERT INTO audit_check_data  (fprocesscat_id, criticity, error_message) 
			SELECT 101, criticity, replace(error_message,':', ' (DB ADMIN):') FROM audit_check_data 
			WHERE fprocesscat_id=95 AND criticity < 4 AND error_message !='' AND cur_user=current_user OFFSET 6;
			
		END IF;
	END IF;

	-- force hydrometer_selector
	IF (select cur_user FROM selector_hydrometer WHERE cur_user = current_user limit 1) IS NULL THEN
		INSERT INTO selector_hydrometer (state_id, cur_user) 
		SELECT id, current_user FROM ext_rtc_hydrometer_state ON CONFLICT (state_id, cur_user) DO NOTHING;
	END IF;

	-- show form

	IF v_hidden_form IS FALSE THEN

		-- check qgis project (1)
		IF v_fprocesscat_id_aux=1 THEN
		
			-- get values using v_edit_node as 'current'  (in case v_edit_node is wrong all will he wrong)
			SELECT table_host, table_dbname, table_schema INTO v_table_host, v_table_dbname, v_table_schema 
			FROM audit_check_project where table_id = 'v_edit_node' and cur_user=current_user;
			
			--check layers host
			SELECT count(*), string_agg(table_id,',') INTO v_count, v_layer_list 
			FROM audit_check_project WHERE table_host != v_table_host AND cur_user=current_user;
			
			IF v_count>0 THEN
				v_errortext = concat('ERROR( QGIS PROJ): There is/are ',v_count,' layers that come from differen host: ',v_layer_list,'.');
			
				INSERT INTO audit_check_data (fprocesscat_id,  criticity, error_message) 
				VALUES (101, 3,v_errortext );
			ELSE
				INSERT INTO audit_check_data (fprocesscat_id,  criticity, error_message) 
				VALUES (101, 1, 'INFO (QGIS PROJ): All layers come from current host');
			END IF;
			
			--check layers database
			SELECT count(*), string_agg(table_id,',') INTO v_count, v_layer_list 
			FROM audit_check_project WHERE table_dbname != v_table_dbname AND cur_user=current_user;
			
			IF v_count>0 THEN
				v_errortext = concat('ERROR (QGIS PROJ): There is/are ',v_count,' layers that come from different database: ',v_layer_list,'.');
			
				INSERT INTO audit_check_data (fprocesscat_id,  criticity, error_message) 
				VALUES (101, 3,v_errortext );
			ELSE
				INSERT INTO audit_check_data (fprocesscat_id,  criticity, error_message) 
				VALUES (101, 1, 'INFO (QGIS PROJ): All layers come from current database');
			END IF;

			--check layers database
			SELECT count(*), string_agg(table_id,',') INTO v_count, v_layer_list 
			FROM audit_check_project WHERE table_schema != v_table_schema AND cur_user=current_user;
			
			IF v_count>0 THEN
				v_errortext = concat('ERROR (QGIS PROJ): There is/are ',v_count,' layers that come from different schema: ',v_layer_list,'.');
			
				INSERT INTO audit_check_data (fprocesscat_id,  criticity, error_message) 
				VALUES (101, 3,v_errortext );
			ELSE
				INSERT INTO audit_check_data (fprocesscat_id,  criticity, error_message) 
				VALUES (101, 1, 'INFO (QGIS PROJ): All layers come from current schema');
			END IF;

			--check layers user
			SELECT count(*), string_agg(table_id,',') INTO v_count, v_layer_list 
			FROM audit_check_project WHERE cur_user != table_user AND table_user != 'None' AND cur_user=current_user;
			
			IF v_count>0 THEN
				v_errortext = concat('ERROR (QGIS PROJ): There is/are ',v_count,' layers that have been added by different user: ',v_layer_list,'.');
			
				INSERT INTO audit_check_data (fprocesscat_id,  criticity, error_message) 
				VALUES (101, 3,v_errortext );
			ELSE
				INSERT INTO audit_check_data (fprocesscat_id,  criticity, error_message) 
				VALUES (101, 1, 'INFO (QGIS PROJ): All layers have been added by current user');
			END IF;

			-- start process
			FOR v_rectable IN SELECT * FROM sys_table WHERE qgis_role_id IN 
			(SELECT rolname FROM pg_roles WHERE  pg_has_role( current_user, oid, 'member') AND isdeprecated IS FALSE)
			LOOP
			
				--RAISE NOTICE 'v_count % id % ', v_count, v_rectable.id;
				IF v_rectable.id NOT IN (SELECT table_id FROM audit_check_project WHERE cur_user=current_user AND fprocesscat_id=v_fprocesscat_id_aux) THEN
					INSERT INTO audit_check_project (table_id, fprocesscat_id, criticity, enabled, message) VALUES (v_rectable.id, 1, v_rectable.qgis_criticity, FALSE, v_rectable.qgis_message);
				--ELSE 
				--	UPDATE audit_check_project SET criticity=v_rectable.qgis_criticity, enabled=TRUE WHERE table_id=v_rectable.id;
				END IF;	
				v_count=v_count+1;
			END LOOP;
			
			--error 1 (criticity = 3 and false)
			SELECT count (*) INTO v_error FROM audit_check_project WHERE cur_user=current_user AND fprocesscat_id=1 AND criticity=3 AND enabled=FALSE;

			--list missing layers with criticity 3 and 2

			EXECUTE 'SELECT json_agg(row_to_json(a)) FROM (SELECT table_id as layer,columns.column_name as id,
			'''||v_srid||''' as srid,b.column_name as field_the_geom,''3'' as criticity, qgis_message
			FROM '||v_schema||'.audit_check_project 
			JOIN information_schema.columns ON table_name = table_id 
			AND columns.table_schema = '''||v_schema||''' and ordinal_position=1 
			LEFT JOIN '||v_schema||'.sys_table ON sys_table.id=audit_check_project.table_id
			INNER JOIN (SELECT column_name ,table_name FROM information_schema.columns
			WHERE table_schema = '''||v_schema||''' AND udt_name = ''geometry'')b ON b.table_name=sys_table.id
			WHERE criticity=3 and enabled IS NOT TRUE) a'
			INTO v_result_layers_criticity3;


			EXECUTE 'SELECT json_agg(row_to_json(a)) FROM (SELECT table_id as layer,columns.column_name as id,
			'''||v_srid||''' as srid,b.column_name as field_the_geom,''2'' as criticity, qgis_message
			FROM '||v_schema||'.audit_check_project 
			JOIN information_schema.columns ON table_name = table_id 
			AND columns.table_schema = '''||v_schema||''' and ordinal_position=1 
			LEFT JOIN '||v_schema||'.sys_table ON sys_table.id=audit_check_project.table_id
			INNER JOIN (SELECT column_name ,table_name FROM information_schema.columns
			WHERE table_schema = '''||v_schema||''' AND udt_name = ''geometry'')b ON b.table_name=sys_table.id
			WHERE criticity=2 and enabled IS NOT TRUE) a'
			INTO v_result_layers_criticity2;

			v_result_layers_criticity3 := COALESCE(v_result_layers_criticity3, '{}'); 
			v_result_layers_criticity2 := COALESCE(v_result_layers_criticity2, '{}'); 

			v_missing_layers = v_result_layers_criticity3::jsonb||v_result_layers_criticity2::jsonb;

		END IF;

		INSERT INTO audit_check_data (fprocesscat_id, result_id, criticity, error_message) VALUES (101, v_result_id, 4, NULL);	
		INSERT INTO audit_check_data (fprocesscat_id, result_id, criticity, error_message) VALUES (101, v_result_id, 3, NULL);	
		INSERT INTO audit_check_data (fprocesscat_id, result_id, criticity, error_message) VALUES (101, v_result_id, 2, NULL);	
		INSERT INTO audit_check_data (fprocesscat_id, result_id, criticity, error_message) VALUES (101, v_result_id, 1, NULL);

		-- get results
		-- info
		SELECT array_to_json(array_agg(row_to_json(row))) INTO v_result
		FROM (SELECT id, error_message as message FROM audit_check_data WHERE cur_user="current_user"() AND fprocesscat_id=101 order by criticity desc, id asc) row; 
		v_result := COALESCE(v_result, '{}'); 
		v_result_info = concat ('{"geometryType":"", "values":',v_result, '}');

		IF v_layer_log THEN
		
			--points
			v_result = null;
			SELECT jsonb_agg(features.feature) INTO v_result
			FROM (
			SELECT jsonb_build_object(
		     'type',       'Feature',
		    'geometry',   ST_AsGeoJSON(the_geom)::jsonb,
		    'properties', to_jsonb(row) - 'the_geom'
			) AS feature
			FROM (SELECT id, node_id, nodecat_id, state, expl_id, descript, fprocesscat_id, the_geom FROM anl_node WHERE cur_user="current_user"() AND fprocesscat_id IN (7,14,64,66,70,71,98) -- epa
			UNION
			SELECT id, node_id, nodecat_id, state, expl_id, descript, fprocesscat_id, the_geom FROM anl_node WHERE cur_user="current_user"() AND fprocesscat_id IN (4,76,79,80,81,82,87,96,97,102,103)  -- om
			UNION
			SELECT id, connec_id, connecat_id, state, expl_id, descript,fprocesscat_id, the_geom FROM anl_connec WHERE cur_user="current_user"() AND fprocesscat_id IN (101,102,104,105,106) -- om
			) row) features;

			v_result := COALESCE(v_result, '{}'); 
			v_result_point = concat ('{"geometryType":"Point", "qmlPath":"',v_qmlpointpath,'", "features":',v_result,',"category_field":"descript"}'); 

			--lines
			v_result = null;

			SELECT jsonb_agg(features.feature) INTO v_result
			FROM (
			SELECT jsonb_build_object(
		     'type',       'Feature',
		    'geometry',   ST_AsGeoJSON(the_geom)::jsonb,
		    'properties', to_jsonb(row) - 'the_geom'
			) AS feature
			FROM (SELECT id, arc_id, arccat_id, state, expl_id, descript, fprocesscat_id, the_geom FROM anl_arc WHERE cur_user="current_user"() AND fprocesscat_id IN (3, 14, 39)  -- epa
			UNION
			SELECT id, arc_id, arccat_id, state, expl_id, descript, fprocesscat_id, the_geom FROM anl_arc WHERE cur_user="current_user"() AND fprocesscat_id IN (4, 88, 102) -- om 
			) row) features;

			v_result := COALESCE(v_result, '{}'); 
			v_result_line = concat ('{"geometryType":"LineString", "qmlPath":"',v_qmllinepath,'", "features":',v_result, ',"category_field":"descript"}');

		END IF;

		--    Control null
		v_version:=COALESCE(v_version,'{}');
		v_result_info:=COALESCE(v_result_info,'{}');
		v_result_point:=COALESCE(v_result_point,'{}');
		v_result_line:=COALESCE(v_result_line,'{}');
		v_result_polygon:=COALESCE(v_result_polygon,'{}');
		v_missing_layers:=COALESCE(v_missing_layers,'{}');
		v_hidden_form:=COALESCE(v_hidden_form, true);

		--return definition for v_audit_check_result
		v_return= ('{"status":"Accepted", "message":{"level":1, "text":"Data quality analysis done succesfully"}, "version":"'||v_version||'" '||
			',"body":{"form":{}'||
				',"data":{ "info":'||v_result_info||','||
						'"point":'||v_result_point||','||
						'"line":'||v_result_line||','||
						'"polygon":'||v_result_polygon||','||
						'"missingLayers":'||v_missing_layers||'}'||
				', "actions":{"hideForm":' || v_hidden_form || ', "useGuideMap":'||v_qgis_init_guide_map||'}}}')::json;
	ELSE
		v_return= ('{"status":"Accepted", "message":{"level":1, "text":"Data quality analysis done succesfully"}, "version":"'||v_version||'" '||
			',"body":{"form":{}'||
				',"data":{ "info":{},'||
						'"point":{},'||
						'"line":{},'||
						'"polygon":{},'||
						'"missingLayers":{}}'||
				', "actions":{"hideForm":true, "useGuideMap":'||v_qgis_init_guide_map||'}}}')::json;
	END IF;
		
	--  Return	   
	RETURN v_return;
	
	--  Exception handling
	EXCEPTION WHEN OTHERS THEN
	GET STACKED DIAGNOSTICS v_error_context = pg_exception_context;  
	RETURN ('{"status":"Failed", "SQLERR":' || to_json(SQLERRM) || ',"SQLCONTEXT":' || to_json(v_error_context) || ',"SQLSTATE":' || to_json(SQLSTATE) || '}')::json;
	  
END;

$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;


