/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/


SET search_path = SCHEMA_NAME, public, pg_catalog;

-- 2020/05/25

DELETE FROM sys_function WHERE id = 2128;


INSERT INTO sys_foreignkey(typevalue_table, typevalue_name, target_table, target_field)
VALUES ('plan_typevalue', 'result_type', 'plan_result_cat', 'result_type');