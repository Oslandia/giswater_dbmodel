/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/

SET search_path = SCHEMA_NAME, public, pg_catalog;


DELETE FROM config_api_form_fields where id IN (10002, 10004, 10006, 10008);

INSERT INTO config_api_form_fields VALUES (10002, 'printGeneric', 'utils', 'composer', 1, 1, true, NULL, 'combo', 'Composer:', NULL, NULL, NULL, NULL, NULL, false, NULL, true, NULL, 'SELECT 1 as id, ''1'' as idval FROM arc WHERE arc_id=''''', NULL, NULL, NULL, NULL, 'gw_api_setprint', NULL, NULL, NULL, NULL, NULL);
INSERT INTO config_api_form_fields VALUES (10008, 'printGeneric', 'utils', 'title', 2, 1, true, 'string', 'text', 'Title:', NULL, NULL, NULL, NULL, NULL, false, NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, 'gw_api_setprint', NULL, NULL, NULL, NULL, NULL);
INSERT INTO config_api_form_fields VALUES (10004, 'printGeneric', 'utils', 'scale', 1, 2, true, 'double', 'text', 'Escale:', NULL, NULL, NULL, NULL, NULL, false, NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, 'gw_api_setprint', NULL, NULL, NULL, NULL, NULL);
INSERT INTO config_api_form_fields VALUES (10006, 'printGeneric', 'utils', 'rotation', 1, 3, true, 'double', 'text', 'Rotation:', NULL, NULL, NULL, NULL, NULL, false, NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, 'gw_api_setprint', NULL, NULL, NULL, NULL, NULL);
