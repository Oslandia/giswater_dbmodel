/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/


SET search_path = SCHEMA_NAME, public, pg_catalog;

-- 2020/01/10
DROP VIEW IF EXISTS v_anl_arc_x_node;
ALTER TABLE sys_fprocess_cat DROP fprocess_i18n;
ALTER TABLE arc RENAME sys_length TO _sys_length;

ALTER TABLE rpt_cat_result ADD COLUMN inpoptions json;
ALTER TABLE rpt_cat_result ADD COLUMN stats json;
