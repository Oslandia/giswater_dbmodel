/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/


SET search_path = SCHEMA_NAME, public, pg_catalog;


--22/11/2019
SELECT gw_fct_admin_manage_fields($${"data":{"action":"ADD","table":"inp_curve_id", "column":"isdoublen2a", "dataType":"boolean"}}$$);

