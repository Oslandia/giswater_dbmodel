/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/

--FUNCTION CODE: 2314

DROP FUNCTION IF EXISTS SCHEMA_NAME.gw_fct_pg2epa(character varying, boolean, boolean);
DROP FUNCTION IF EXISTS SCHEMA_NAME.gw_fct_pg2epa(character varying, boolean);
DROP FUNCTION IF EXISTS SCHEMA_NAME.gw_fct_pg2epa(json);
CREATE OR REPLACE FUNCTION SCHEMA_NAME.gw_fct_pg2epa_main(p_data json)  
RETURNS json AS 
$BODY$

/*EXAMPLE
SELECT SCHEMA_NAME.gw_fct_pg2epa_main($${"data":{ "resultId":"z1", "useNetworkGeom":"false"}}$$)

delete from SCHEMA_NAME.rpt_cat_result

--fid: 227

*/

DECLARE
v_networkmode integer = 1;
v_return json;
v_input json;
v_result text;
v_onlymandatory_nodarc boolean = false;
v_vnode_trimarcs boolean = false;
v_response integer;
v_message text;
v_setdemand boolean;
v_buildupmode integer;
v_usenetworkgeom boolean;
v_inpoptions json;
v_advancedsettings boolean;
v_file json;
v_body json;
v_onlyexport boolean;
v_checkdata boolean;
v_checknetwork boolean;
v_vdefault boolean;
v_delnetwork boolean;
v_removedemand boolean;
v_fid integer = 227;
	
BEGIN

	-- set search path
	SET search_path = "SCHEMA_NAME", public;
	
	-- get input data
	v_result = (p_data->>'data')::json->>'resultId';
	v_usenetworkgeom = (p_data->>'data')::json->>'useNetworkGeom';  -- use network previously defined

	-- get user parameteres
	v_networkmode = (SELECT value FROM config_param_user WHERE parameter='inp_options_networkmode' AND cur_user=current_user);
	v_buildupmode = (SELECT value FROM config_param_user WHERE parameter='inp_options_buildup_mode' AND cur_user=current_user);
	v_advancedsettings = (SELECT value::json->>'status' FROM config_param_user WHERE parameter='inp_options_advancedsettings' AND cur_user=current_user)::boolean;
	v_vdefault = (SELECT value::json->>'status' FROM config_param_user WHERE parameter='inp_options_vdefault' AND cur_user=current_user);

	-- get debug parameters (settings)
	v_onlyexport = (SELECT value::json->>'onlyExport' FROM config_param_user WHERE parameter='inp_options_debug' AND cur_user=current_user)::boolean;
	v_setdemand = (SELECT value::json->>'setDemand' FROM config_param_user WHERE parameter='inp_options_debug' AND cur_user=current_user)::boolean;
	v_checkdata = (SELECT value::json->>'checkData' FROM config_param_user WHERE parameter='inp_options_debug' AND cur_user=current_user)::boolean;
	v_checknetwork = (SELECT value::json->>'checkNetwork' FROM config_param_user WHERE parameter='inp_options_debug' AND cur_user=current_user)::boolean;
	v_delnetwork = (SELECT value::json->>'delDisconnNetwork' FROM config_param_user WHERE parameter='inp_options_debug' AND cur_user=current_user)::boolean;
	v_removedemand = (SELECT value::json->>'removeDemandOnDryNodes' FROM config_param_user WHERE parameter='inp_options_debug' AND cur_user=current_user)::boolean;

	-- delete audit table
	DELETE FROM audit_check_data WHERE fid = v_fid AND cur_user=current_user;
	DELETE FROM audit_log_data WHERE fid = v_fid AND cur_user=current_user;
	
	-- setting variables
	v_input = concat('{"data":{"parameters":{"resultId":"',v_result,'", "fid":227}}}')::json;
	
	IF v_networkmode = 1 OR v_networkmode = 3 THEN 
		v_onlymandatory_nodarc = TRUE;
	END IF;

	v_inpoptions = (SELECT (replace (replace (replace (array_to_json(array_agg(json_build_object((t.parameter),(t.value))))::text,'},{', ' , '),'[',''),']',''))::json 
				FROM (SELECT parameter, value FROM config_param_user 
				JOIN sys_param_user a ON a.id=parameter	WHERE cur_user=current_user AND formname='epaoptions')t);
		
	IF v_onlyexport THEN
		SELECT gw_fct_pg2epa_check_result(v_input) INTO v_return ;
		SELECT gw_fct_pg2epa_export_inp(v_result, null) INTO v_file;
		
		v_body = gw_fct_json_object_set_key((v_return->>'body')::json, 'file', v_file);
		v_return = gw_fct_json_object_set_key(v_return, 'body', v_body);
		v_return =  gw_fct_json_object_set_key (v_return, 'continue', false);                                
		v_return =  gw_fct_json_object_set_key (v_return, 'steps', 0);
		v_return = replace(v_return::text, '"message":{"priority":1, "text":"Data quality analysis done succesfully"}', 
		'"message":{"priority":1, "text":"Inp export done succesfully"}')::json;
		RETURN v_return;
	END IF;

	-- check consistency for user options 
	SELECT gw_fct_pg2epa_check_options(v_input)
		INTO v_return;
	IF v_return->>'status' = 'Failed' THEN
		--v_return = replace(v_return::text, 'Failed', 'Accepted');
		RETURN v_return;
	END IF;

	IF v_usenetworkgeom IS TRUE THEN

		-- delete rpt_* tables keeping rpt_inp_tables
		DELETE FROM rpt_arc WHERE result_id = v_result;
		DELETE FROM rpt_node WHERE result_id = v_result;
		DELETE FROM rpt_energy_usage WHERE result_id = v_result;
		DELETE FROM rpt_hydraulic_status WHERE result_id = v_result;
		DELETE FROM rpt_node WHERE result_id = v_result;	
		DELETE FROM rpt_inp_pattern_value WHERE result_id = v_result;
	ELSE 
	
		RAISE NOTICE '1 - check system data';
		IF v_checkdata THEN
			PERFORM gw_fct_pg2epa_check_data(v_input);
		END IF;
			
		RAISE NOTICE '2 - Upsert on rpt_cat_table and set selectors';
		DELETE FROM rpt_cat_result WHERE result_id=v_result;
		INSERT INTO rpt_cat_result (result_id, inpoptions) VALUES (v_result, v_inpoptions);
		DELETE FROM selector_inp_result WHERE cur_user=current_user;
		INSERT INTO selector_inp_result (result_id, cur_user) VALUES (v_result, current_user);

		RAISE NOTICE '3 - Fill inprpt tables';
		PERFORM gw_fct_pg2epa_fill_data(v_result);

		RAISE NOTICE '4 - Call gw_fct_pg2epa_nod2arc function';
		PERFORM gw_fct_pg2epa_nod2arc(v_result, v_onlymandatory_nodarc);

		RAISE NOTICE '5 - Call gw_fct_pg2epa_doublenod2arc';
		PERFORM gw_fct_pg2epa_nod2arc_double(v_result);
				
		RAISE NOTICE '6 - Call gw_fct_pg2epa_pump_additional function';
		PERFORM gw_fct_pg2epa_pump_additional(v_result);

		RAISE NOTICE '7 - manage varcs';
		PERFORM gw_fct_pg2epa_manage_varc(v_result);	

		RAISE NOTICE '8 - Try to trim arcs with vnode';
		IF v_networkmode = 3 OR v_networkmode = 4 THEN
			SELECT gw_fct_pg2epa_vnodetrimarcs(v_result) INTO v_response;
				
			-- setting first message again on user's pannel
			IF v_response = 0 THEN
				v_message = concat ('INFO: vnodes over nodarcs have been checked without any inconsistency. In terms of vnode/nodarc topological relation network is ok');
			ELSE
				v_message = concat ('WARNING: vnodes over nodarcs have been checked. In order to keep inlet flows from connecs using vnode_id, ' , 
				v_response, ' nodarc nodes have been renamed using vnode_id');
			END IF;
		ELSE
			-- setting first message on user's pannel
			v_message = concat ('INFO: The process to check vnodes over nodarcs is disabled because on this export mode arcs will not trimed using vnodes');
		END IF;

		RAISE NOTICE '9 - Execute buildup model';
		IF v_buildupmode = 1 THEN
			PERFORM gw_fct_pg2epa_buildup_supply(v_result);
			
		ELSIF v_buildupmode = 2 THEN
			PERFORM gw_fct_pg2epa_buildup_transport(v_result);
		END IF;

		RAISE NOTICE '10 - Set default values';
		IF v_vdefault THEN
			PERFORM gw_fct_pg2epa_vdefault(v_input);
		END IF;

		RAISE NOTICE '11 - Set ceros';
		UPDATE temp_node SET elevation = 0 WHERE elevation IS NULL;
		UPDATE temp_node SET addparam = replace (addparam, '""','null');
		
		RAISE NOTICE '12 - Set length > 0.05 when length is 0';
		UPDATE temp_arc SET length=0.05 WHERE length=0;
	END IF;

	RAISE NOTICE '13 - Try to set demands & patterns';
	IF v_setdemand THEN
		PERFORM gw_fct_pg2epa_demand(v_result);		
	END IF;

	RAISE NOTICE '14 - Setting dscenarios';
	PERFORM gw_fct_pg2epa_dscenario(v_result);
	
	RAISE NOTICE '15 - Setting valve status';
	PERFORM gw_fct_pg2epa_valve_status(v_result);
		
	RAISE NOTICE '16 - Advanced settings';
	IF v_advancedsettings THEN
		PERFORM gw_fct_pg2epa_advancedsettings(v_result);
	END IF;
	
	RAISE NOTICE '17 - Check result network';
	IF v_checknetwork THEN
		PERFORM gw_fct_pg2epa_check_network(v_input);	
	END IF;
		
	IF v_delnetwork THEN
		RAISE NOTICE '18 - Delete disconnected arcs with associated nodes';
		INSERT INTO audit_log_data (fid, feature_id, feature_type, log_message) SELECT v_fid, arc_id, arc_type, '18 - Delete disconnected arcs with associated nodes'
		FROM temp_arc WHERE arc_id IN (SELECT arc_id FROM anl_arc WHERE fid = 39 AND cur_user=current_user);
		DELETE FROM temp_arc WHERE arc_id IN (SELECT arc_id FROM anl_arc WHERE fid = 39 AND cur_user=current_user);
		
		INSERT INTO audit_log_data (fid, feature_id, feature_type, log_message) SELECT v_fid, node_id, node_type, '18 - Delete disconnected arcs with associated nodes'
		FROM temp_node WHERE node_id IN (SELECT node_id FROM anl_node WHERE fid = 39 AND cur_user=current_user);
		DELETE FROM temp_node WHERE node_id IN (SELECT node_id FROM anl_node WHERE fid = 39 AND cur_user=current_user);
			
		RAISE NOTICE '19 - Delete orphan nodes';
		INSERT INTO audit_log_data (fid, feature_id, feature_type, log_message) SELECT v_fid, node_id, node_type, '19 - Delete orphan nodes'
		FROM temp_node WHERE node_id IN (SELECT node_id FROM anl_node WHERE fid = 7 AND cur_user=current_user);
		DELETE FROM temp_node WHERE node_id IN (SELECT node_id FROM anl_node WHERE fid = 7 AND cur_user=current_user);

		RAISE NOTICE '20 - Delete arcs without extremal nodes';
		INSERT INTO audit_log_data (fid, feature_id, feature_type, log_message) SELECT v_fid, arc_id, arc_type, '20 - Delete arcs without extremal nodes'
		FROM temp_arc  WHERE arc_id IN (SELECT arc_id FROM anl_arc WHERE fid = 3 AND cur_user=current_user);
		DELETE FROM temp_arc WHERE arc_id IN (SELECT arc_id FROM anl_arc WHERE fid = 3 AND cur_user=current_user);
	END IF;

	IF v_removedemand THEN
		RAISE NOTICE '21 Set demand = 0 for dry nodes';
		UPDATE temp_node n SET demand = 0 FROM anl_node a WHERE fid = 132 AND cur_user = current_user AND a.node_id = t.node_id;
	END IF;

	RAISE NOTICE '22 - Check result previous exportation';
	SELECT gw_fct_pg2epa_check_result(v_input) INTO v_return ;

	RAISE NOTICE '23 - Profilactic last control';
	-- arcs without nodes
	INSERT INTO audit_log_data (fid, feature_id, feature_type, log_message) SELECT v_fid, arc_id, arc_type, '23 - Profilactic last delete'
	FROM temp_arc WHERE node_1 NOT IN (SELECT node_id FROM temp_node);
	INSERT INTO audit_log_data (fid, feature_id, feature_type, log_message) SELECT v_fid, arc_id, arc_type, '23 - Profilactic last delete'
	FROM temp_arc WHERE node_2 NOT IN (SELECT node_id FROM temp_node);
	DELETE FROM temp_arc WHERE node_1 NOT IN (SELECT node_id FROM temp_node);
	DELETE FROM temp_arc WHERE node_2 NOT IN (SELECT node_id FROM temp_node);

	-- nodes without arcs
	INSERT INTO audit_log_data (fid, feature_id, feature_type, log_message) SELECT v_fid, node_id, node_type, '23 - Profilactic last delete'
	FROM temp_node WHERE node_id NOT IN (SELECT node_1 FROM temp_arc UNION SELECT node_2 FROM temp_arc);
	DELETE FROM temp_node WHERE node_id NOT IN (SELECT node_1 FROM temp_arc UNION SELECT node_2 FROM temp_arc);

	-- values without value
	UPDATE temp_arc SET minorloss = 0 WHERE minorloss IS NULL;
	UPDATE temp_arc SET status = 'OPEN' WHERE status IS NULL OR status = '';

	RAISE NOTICE '24 - Move from temp tables to rpt_inp tables';
	UPDATE temp_arc SET result_id  = v_result;
	UPDATE temp_node SET result_id  = v_result;
	INSERT INTO rpt_inp_arc SELECT * FROM temp_arc;
	INSERT INTO rpt_inp_node SELECT * FROM temp_node;

	RAISE NOTICE '25 - Create the inp file structure';	
	SELECT gw_fct_pg2epa_export_inp(v_result, null) INTO v_file;
	
	-- manage return message
	v_body = gw_fct_json_object_set_key((v_return->>'body')::json, 'file', v_file);
	v_return = gw_fct_json_object_set_key(v_return, 'body', v_body);
	v_return =  gw_fct_json_object_set_key (v_return, 'continue', false);                                
	v_return =  gw_fct_json_object_set_key (v_return, 'steps', 0);
	v_return = replace(v_return::text, '"message":{"priority":1, "text":"Data quality analysis done succesfully"}', 
	'"message":{"priority":1, "text":"Inp export done succesfully"}')::json;


	RETURN v_return;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;