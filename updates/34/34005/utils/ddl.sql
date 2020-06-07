/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/


SET search_path = SCHEMA_NAME, public, pg_catalog;


ALTER TABLE ext_rtc_scada_dma_period RENAME TO ext_rtc_dma_period;


--2020/03/13
CREATE INDEX node_sector ON node USING btree (sector_id);
CREATE INDEX node_nodecat ON node USING btree (nodecat_id);
CREATE INDEX node_exploitation ON node USING btree (expl_id);
CREATE INDEX node_dma ON node USING btree (dma_id);
CREATE INDEX node_street1 ON node USING btree (streetaxis_id);
CREATE INDEX node_street2 ON node USING btree (streetaxis2_id);


CREATE INDEX arc_sector ON arc USING btree (sector_id);
CREATE INDEX arc_arccat ON arc USING btree (arccat_id);
CREATE INDEX arc_exploitation ON arc USING btree (expl_id);
CREATE INDEX arc_dma ON arc USING btree (dma_id);
CREATE INDEX arc_street1 ON arc USING btree (streetaxis_id);
CREATE INDEX arc_street2 ON arc USING btree (streetaxis2_id);


CREATE INDEX connec_sector ON connec USING btree (sector_id);
CREATE INDEX connec_connecat ON connec USING btree (connecat_id);
CREATE INDEX connec_exploitation ON connec USING btree (expl_id);
CREATE INDEX connec_dma ON connec USING btree (dma_id);
CREATE INDEX connec_street1 ON connec USING btree (streetaxis_id);
CREATE INDEX connec_street2 ON connec USING btree (streetaxis2_id);



--2020/06/04
SELECT gw_fct_admin_manage_fields($${"data":{"action":"ADD","table":"arc", "column":"district_id", "dataType":"integer", "isUtils":"False"}}$$);
SELECT gw_fct_admin_manage_fields($${"data":{"action":"ADD","table":"node", "column":"district_id", "dataType":"integer", "isUtils":"False"}}$$);
SELECT gw_fct_admin_manage_fields($${"data":{"action":"ADD","table":"connec", "column":"district_id", "dataType":"integer", "isUtils":"False"}}$$);
SELECT gw_fct_admin_manage_fields($${"data":{"action":"ADD","table":"samplepoint", "column":"district_id", "dataType":"integer", "isUtils":"False"}}$$);
