/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/


--UTILS
--gw_01_krn

ALTER TABLE arc_type ALTER COLUMN type DROP NOT NULL;
ALTER TABLE arc_type ALTER COLUMN epa_default DROP NOT NULL;
ALTER TABLE arc_type ALTER COLUMN man_table DROP NOT NULL;
ALTER TABLE arc_type ALTER COLUMN epa_table DROP NOT NULL;

ALTER TABLE node_type ALTER COLUMN type DROP NOT NULL;
ALTER TABLE node_type ALTER COLUMN epa_default DROP NOT NULL;
ALTER TABLE node_type ALTER COLUMN man_table DROP NOT NULL;
ALTER TABLE node_type ALTER COLUMN epa_table DROP NOT NULL;

ALTER TABLE connec_type ALTER COLUMN type DROP NOT NULL;
ALTER TABLE connec_type ALTER COLUMN man_table DROP NOT NULL;

ALTER TABLE man_type_function ALTER COLUMN function_type DROP NOT NULL;
ALTER TABLE man_type_category ALTER COLUMN category_type DROP NOT NULL;
ALTER TABLE man_type_fluid ALTER COLUMN fluid_type DROP NOT NULL;
ALTER TABLE man_type_location ALTER COLUMN location_type DROP NOT NULL;

ALTER TABLE exploitation ALTER COLUMN name DROP NOT NULL;

ALTER TABLE element ALTER COLUMN expl_id DROP NOT NULL;
ALTER TABLE element ALTER COLUMN "state" DROP NOT NULL;
ALTER TABLE element ALTER COLUMN elementcat_id DROP NOT NULL;

ALTER TABLE element_x_arc ALTER COLUMN element_id DROP NOT NULL;
ALTER TABLE element_x_arc ALTER COLUMN arc_id DROP NOT NULL;

ALTER TABLE element_x_node ALTER COLUMN element_id DROP NOT NULL;
ALTER TABLE element_x_node ALTER COLUMN node_id DROP NOT NULL;

ALTER TABLE element_x_connec ALTER COLUMN element_id DROP NOT NULL;
ALTER TABLE element_x_connec ALTER COLUMN node_id DROP NOT NULL;

ALTER TABLE value_state ALTER COLUMN name DROP NOT NULL;
ALTER TABLE value_state_type ALTER COLUMN name DROP NOT NULL;

ALTER TABLE vnode ALTER COLUMN sector_id DROP NOT NULL;
ALTER TABLE vnode ALTER COLUMN dma_id DROP NOT NULL;
ALTER TABLE vnode ALTER COLUMN expl_id DROP NOT NULL;
ALTER TABLE vnode ALTER COLUMN "state" DROP NOT NULL;

ALTER TABLE link ALTER COLUMN expl_id DROP NOT NULL;
ALTER TABLE link ALTER COLUMN "state" DROP NOT NULL;

ALTER TABLE samplepoint ALTER COLUMN expl_id DROP NOT NULL;
ALTER TABLE samplepoint ALTER COLUMN "state" DROP NOT NULL;

--WS
--ws_01_krn_ddl

ALTER TABLE macrodma ALTER COLUMN name DROP NOT NULL;
ALTER TABLE macrodma ALTER COLUMN expl_id DROP NOT NULL;

ALTER TABLE dma ALTER COLUMN name DROP NOT NULL;
ALTER TABLE dma ALTER COLUMN expl_id DROP NOT NULL;

ALTER TABLE sector ALTER COLUMN name DROP NOT NULL;

ALTER TABLE cat_arc ALTER COLUMN arctype_id DROP NOT NULL;
ALTER TABLE cat_node ALTER COLUMN nodetype_id DROP NOT NULL;
ALTER TABLE cat_connec ALTER COLUMN connectype_id DROP NOT NULL;


ALTER TABLE node ALTER COLUMN code DROP NOT NULL;
ALTER TABLE node ALTER COLUMN nodecat_id DROP NOT NULL;
ALTER TABLE node ALTER COLUMN epa_type DROP NOT NULL;
ALTER TABLE node ALTER COLUMN sector_id DROP NOT NULL;
ALTER TABLE node ALTER COLUMN "state" DROP NOT NULL;
ALTER TABLE node ALTER COLUMN dma_id DROP NOT NULL;
--ALTER TABLE node ALTER COLUMN the_geom DROP NOT NULL;
ALTER TABLE node ALTER COLUMN expl_id DROP NOT NULL;

ALTER TABLE arc ALTER COLUMN code DROP NOT NULL;
--ALTER TABLE arc ALTER COLUMN node_1 DROP NOT NULL;
--ALTER TABLE arc ALTER COLUMN node_2 DROP NOT NULL;
ALTER TABLE arc ALTER COLUMN arccat_id DROP NOT NULL;
ALTER TABLE arc ALTER COLUMN epa_type DROP NOT NULL;
ALTER TABLE arc ALTER COLUMN sector_id DROP NOT NULL;
ALTER TABLE arc ALTER COLUMN "state" DROP NOT NULL;
ALTER TABLE arc ALTER COLUMN dma_id DROP NOT NULL;
--ALTER TABLE arc ALTER COLUMN the_geom DROP NOT NULL;
ALTER TABLE arc ALTER COLUMN expl_id DROP NOT NULL;

ALTER TABLE connec ALTER COLUMN code DROP NOT NULL;
ALTER TABLE connec ALTER COLUMN connecat_id DROP NOT NULL;
ALTER TABLE connec ALTER COLUMN epa_type DROP NOT NULL;
ALTER TABLE connec ALTER COLUMN sector_id DROP NOT NULL;
ALTER TABLE connec ALTER COLUMN "state" DROP NOT NULL;
ALTER TABLE connec ALTER COLUMN dma_id DROP NOT NULL;
ALTER TABLE connec ALTER COLUMN expl_id DROP NOT NULL;

ALTER TABLE pond ALTER COLUMN connecat_id DROP NOT NULL;
ALTER TABLE pond ALTER COLUMN "state" DROP NOT NULL;
ALTER TABLE pond ALTER COLUMN dma_id DROP NOT NULL;
ALTER TABLE pond ALTER COLUMN expl_id DROP NOT NULL;

ALTER TABLE pool ALTER COLUMN connecat_id DROP NOT NULL;
ALTER TABLE pool ALTER COLUMN "state" DROP NOT NULL;
ALTER TABLE pool ALTER COLUMN dma_id DROP NOT NULL;
ALTER TABLE pool ALTER COLUMN expl_id DROP NOT NULL;

--ALTER TABLE man_hydrant ALTER COLUMN fire_code DROP NOT NULL;



--UD

ALTER TABLE macrodma ALTER COLUMN name DROP NOT NULL;
ALTER TABLE dma ALTER COLUMN name DROP NOT NULL;
ALTER TABLE macrosector ALTER COLUMN name DROP NOT NULL;
ALTER TABLE sector ALTER COLUMN name DROP NOT NULL;

ALTER TABLE node ALTER COLUMN code DROP NOT NULL;
ALTER TABLE node ALTER COLUMN nodecat_id DROP NOT NULL;
--ALTER TABLE node ALTER COLUMN epa_type DROP NOT NULL; - in ws not null
ALTER TABLE node ALTER COLUMN sector_id DROP NOT NULL;
ALTER TABLE node ALTER COLUMN "state" DROP NOT NULL;
ALTER TABLE node ALTER COLUMN dma_id DROP NOT NULL;
--ALTER TABLE node ALTER COLUMN the_geom DROP NOT NULL; - in ws not null
ALTER TABLE node ALTER COLUMN expl_id DROP NOT NULL;

ALTER TABLE arc ALTER COLUMN code DROP NOT NULL;
--ALTER TABLE arc ALTER COLUMN node_1 DROP NOT NULL;- in ws not null
--ALTER TABLE arc ALTER COLUMN node_2 DROP NOT NULL;- in ws not null
ALTER TABLE arc ALTER COLUMN arccat_id DROP NOT NULL; 
ALTER TABLE arc ALTER COLUMN arc_type DROP NOT NULL; 
ALTER TABLE arc ALTER COLUMN epa_type DROP NOT NULL;
ALTER TABLE arc ALTER COLUMN sector_id DROP NOT NULL;
ALTER TABLE arc ALTER COLUMN "state" DROP NOT NULL;
ALTER TABLE arc ALTER COLUMN dma_id DROP NOT NULL;
--ALTER TABLE arc ALTER COLUMN the_geom DROP NOT NULL;
ALTER TABLE arc ALTER COLUMN expl_id DROP NOT NULL;

ALTER TABLE node ALTER COLUMN code DROP NOT NULL;
ALTER TABLE node ALTER COLUMN node_type DROP NOT NULL;
ALTER TABLE node ALTER COLUMN nodecat_id DROP NOT NULL;
ALTER TABLE node ALTER COLUMN epa_type DROP NOT NULL;
ALTER TABLE node ALTER COLUMN sector_id DROP NOT NULL;
ALTER TABLE node ALTER COLUMN "state" DROP NOT NULL;
ALTER TABLE node ALTER COLUMN dma_id DROP NOT NULL;
--ALTER TABLE node ALTER COLUMN the_geom DROP NOT NULL;
ALTER TABLE node ALTER COLUMN expl_id DROP NOT NULL;

ALTER TABLE connec ALTER COLUMN code DROP NOT NULL;
ALTER TABLE connec ALTER COLUMN connec_type DROP NOT NULL;
ALTER TABLE connec ALTER COLUMN connecat_id DROP NOT NULL;
ALTER TABLE connec ALTER COLUMN sector_id DROP NOT NULL;
ALTER TABLE connec ALTER COLUMN "state" DROP NOT NULL;
ALTER TABLE connec ALTER COLUMN dma_id DROP NOT NULL;
ALTER TABLE connec ALTER COLUMN expl_id DROP NOT NULL;

ALTER TABLE gully ALTER COLUMN code DROP NOT NULL;
ALTER TABLE gully ALTER COLUMN gully_type DROP NOT NULL;
ALTER TABLE gully ALTER COLUMN sector_id DROP NOT NULL;
ALTER TABLE gully ALTER COLUMN "state" DROP NOT NULL;
ALTER TABLE gully ALTER COLUMN dma_id DROP NOT NULL;
ALTER TABLE gully ALTER COLUMN expl_id DROP NOT NULL;




















