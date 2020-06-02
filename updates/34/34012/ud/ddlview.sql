/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/


SET search_path = SCHEMA_NAME, public, pg_catalog;

-- 2020/05/31

DROP VIEW IF EXISTS v_ui_rpt_cat_result;
CREATE OR REPLACE VIEW v_ui_rpt_cat_result AS 
 SELECT rpt_cat_result.result_id,
    rpt_cat_result.flow_units,
    rpt_cat_result.rain_runof,
    rpt_cat_result.snowmelt,
    rpt_cat_result.groundw,
    rpt_cat_result.flow_rout,
    rpt_cat_result.pond_all,
    rpt_cat_result.water_q,
    rpt_cat_result.infil_m,
    rpt_cat_result.flowrout_m,
    rpt_cat_result.start_date,
    rpt_cat_result.end_date,
    rpt_cat_result.dry_days,
    rpt_cat_result.rep_tstep,
    rpt_cat_result.wet_tstep,
    rpt_cat_result.dry_tstep,
    rpt_cat_result.rout_tstep,
    rpt_cat_result.var_time_step,
    rpt_cat_result.max_trials,
    rpt_cat_result.head_tolerance,
    rpt_cat_result.exec_date
   FROM rpt_cat_result;


CREATE TRIGGER gw_trg_ui_rpt_cat_result  INSTEAD OF INSERT OR UPDATE OR DELETE
  ON v_ui_rpt_cat_result  FOR EACH ROW  EXECUTE PROCEDURE gw_trg_ui_rpt_cat_result();