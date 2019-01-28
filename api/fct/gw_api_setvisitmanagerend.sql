﻿/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/

--FUNCTION CODE: 2640

CREATE OR REPLACE FUNCTION ws_sample.gw_api_setvisitmanagerend(p_data json)
  RETURNS json AS
$BODY$

/*EXAMPLE:
--new call
SELECT ws_sample.gw_api_setvisitmanagerend($${
"client":{"device":3,"infoType":100,"lang":"es"},
"form":{},
"data":{}}$$)
*/

DECLARE


BEGIN

  
	-- Return
	RETURN gw_api_getvisitmanager($${"client":{"device":3,"infoType":100,"lang":"es"},"form":{},"data":{}}$$);

END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;



