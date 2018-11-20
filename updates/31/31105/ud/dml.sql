/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/


SET search_path = SCHEMA_NAME, public, pg_catalog;


-- 2018/11/20
SELECT setval('SCHEMA_NAME.config_param_system_id_seq', (SELECT max(id) FROM config_param_system), true);
INSERT INTO config_param_system (parameter, value, data_type, context, descript) VALUES ('code_vd', 'No code', 'Text', 'OM', 'UD');



-- ENABLED by using the AUTOMATIC update project data schema  (LOG)
INSERT INTO audit_log_project (fprocesscat_id, table_id, enabled, log_message) VALUES (33, 'config_param_system', TRUE, 'New parameter code_vd');
