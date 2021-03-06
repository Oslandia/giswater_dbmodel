/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/

--FUNCTION CODE: 2576

DROP FUNCTION IF EXISTS SCHEMA_NAME.gw_api_getgo2epa(p_data json);
CREATE OR REPLACE FUNCTION SCHEMA_NAME.gw_fct_getgo2epa(p_data json)
  RETURNS json AS
$BODY$

/*EXAMPLE:
SELECT SCHEMA_NAME.gw_fct_getgo2epa($${
"client":{"device":4, "infoType":1, "lang":"ES"},
"form":{"formName":"go2epa"},
"feature":{},"data":{}}$$)
*/

DECLARE

v_version json;
v_formname text;
v_fields  json[];
v_fields_json json;
v_formgroupbox json[];
v_formgroupbox_json json;
   
BEGIN

	-- Set search path to local schema
    SET search_path = "SCHEMA_NAME", public;

	-- get api version
    EXECUTE 'SELECT row_to_json(row) FROM (SELECT value FROM config_param_system WHERE parameter=''admin_version'') row'
        INTO v_version;

	-- get input parameters
	v_formname := (p_data ->> 'form')::json->> 'formName';

	-- getting the form widgets
	SELECT gw_fct_getformfields(v_formname, 'form_generic', 'data', null, null, null, null, null,null, null, null)
		INTO v_fields; 

	v_fields_json = array_to_json (v_fields);

	-- Construction of groupbox formlayouts
	EXECUTE 'SELECT (array_agg(row_to_json(a))) FROM (SELECT layout_id AS "layout", label FROM config_form_groupbox 
		WHERE formname=$1 ORDER BY layout_id) a'
			INTO v_formgroupbox
			USING v_formname;

	v_formgroupbox_json := array_to_json(v_formgroupbox);

	-- Control NULL's
	v_fields := COALESCE(v_fields, '{}');
	v_version := COALESCE(v_version, '{}');
	v_formgroupbox_json := COALESCE(v_formgroupbox_json, '{}');
		
	-- Return
    RETURN ('{"status":"Accepted", "version":'||v_version||
             ',"body":{"message":{"level":1, "text":"This is a test message"}'||
			',"form":{"formName":"", "formLabel":"", "formText":""'||
  				',"formGroupBox":'||v_formgroupbox_json||'}'||
			',"data":{"fields":' || v_fields_json ||
				'}'||
			'}'||
	    '}')::json;
       
	-- Exception handling
	EXCEPTION WHEN OTHERS THEN 
	RETURN ('{"status":"Failed","SQLERR":' || to_json(SQLERRM) || ', "version":'|| v_version || ',"SQLSTATE":' || to_json(SQLSTATE) || '}')::json;


END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;