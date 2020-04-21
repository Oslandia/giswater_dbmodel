/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/


SET search_path = SCHEMA_NAME, public, pg_catalog;


ALTER TABLE IF EXISTS anl_mincut_arc_x_node RENAME to _anl_mincut_arc_x_node_ ;

ALTER TABLE inp_pattern DROP COLUMN pattern_type;

ALTER TABLE ext_rtc_dma_period DROP COLUMN m3_total_period;
ALTER TABLE ext_rtc_dma_period DROP COLUMN m3_total_period_hydro;