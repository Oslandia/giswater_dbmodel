/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/


SET search_path = "SCHEMA_NAME", public, pg_catalog;


-- ----------------------------
-- Records of cat_feature
-- ----------------------------
INSERT INTO cat_feature VALUES ('WJOIN', 'WJOIN', 'CONNEC');
INSERT INTO cat_feature VALUES ('FOUNTAIN', 'FOUNTAIN', 'CONNEC');
INSERT INTO cat_feature VALUES ('TAP', 'TAP', 'CONNEC');
INSERT INTO cat_feature VALUES ('GREENTAP', 'GREENTAP', 'CONNEC');
INSERT INTO cat_feature VALUES ('WATERWELL', 'WATERWELL', 'NODE');
INSERT INTO cat_feature VALUES ('NETSAMPLEPOINT', 'NETSAMPLEPOINT', 'NODE');
INSERT INTO cat_feature VALUES ('NETELEMENT', 'NETELEMENT', 'NODE');
INSERT INTO cat_feature VALUES ('WTP', 'WTP', 'NODE');
INSERT INTO cat_feature VALUES ('PIPE', 'PIPE', 'ARC');
INSERT INTO cat_feature VALUES ('VARC', 'VARC', 'ARC');
INSERT INTO cat_feature VALUES ('CHECK-VALVE', 'VALVE', 'NODE');
INSERT INTO cat_feature VALUES ('PR-REDUC.VALVE', 'VALVE', 'NODE');
INSERT INTO cat_feature VALUES ('GREEN-VALVE', 'VALVE', 'NODE');
INSERT INTO cat_feature VALUES ('CURVE', 'JUNCTION', 'NODE');
INSERT INTO cat_feature VALUES ('FILTER', 'FILTER', 'NODE');
INSERT INTO cat_feature VALUES ('ENDLINE', 'JUNCTION', 'NODE');
INSERT INTO cat_feature VALUES ('FL-CONTR.VALVE', 'VALVE', 'NODE');
INSERT INTO cat_feature VALUES ('GEN-PURP.VALVE', 'VALVE', 'NODE');
INSERT INTO cat_feature VALUES ('HYDRANT', 'HYDRANT', 'NODE');
INSERT INTO cat_feature VALUES ('PR-BREAK.VALVE', 'VALVE', 'NODE');
INSERT INTO cat_feature VALUES ('OUTFALL-VALVE', 'VALVE', 'NODE');
INSERT INTO cat_feature VALUES ('JUNCTION', 'JUNCTION', 'NODE');
INSERT INTO cat_feature VALUES ('PR-SUSTA.VALVE', 'VALVE', 'NODE');
INSERT INTO cat_feature VALUES ('SHUTOFF-VALVE', 'VALVE', 'NODE');
INSERT INTO cat_feature VALUES ('REDUCTION', 'REDUCTION', 'NODE');
INSERT INTO cat_feature VALUES ('PUMP', 'PUMP', 'NODE');
INSERT INTO cat_feature VALUES ('TANK', 'TANK', 'NODE');
INSERT INTO cat_feature VALUES ('THROTTLE-VALVE', 'VALVE', 'NODE');
INSERT INTO cat_feature VALUES ('T', 'JUNCTION', 'NODE');
INSERT INTO cat_feature VALUES ('X', 'JUNCTION', 'NODE');
INSERT INTO cat_feature VALUES ('SOURCE', 'SOURCE', 'NODE');
INSERT INTO cat_feature VALUES ('MANHOLE', 'MANHOLE', 'NODE');
INSERT INTO cat_feature VALUES ('REGISTER', 'REGISTER', 'NODE');
INSERT INTO cat_feature VALUES ('CONTROL-REGISTER', 'REGISTER', 'NODE');
INSERT INTO cat_feature VALUES ('BYPASS-REGISTER', 'REGISTER', 'NODE');
INSERT INTO cat_feature VALUES ('VALVE-REGISTER', 'REGISTER', 'NODE');
INSERT INTO cat_feature VALUES ('WATER-CONNECTION', 'NETWJOIN', 'NODE');
INSERT INTO cat_feature VALUES ('FLEXUNION', 'FLEXUNION', 'NODE');
INSERT INTO cat_feature VALUES ('AIR-VALVE', 'VALVE', 'NODE');
INSERT INTO cat_feature VALUES ('FLOWMETER', 'METER', 'NODE');
INSERT INTO cat_feature VALUES ('EXPANTANK', 'EXPANSIONTANK', 'NODE');
INSERT INTO cat_feature VALUES ('PRESSURE-METER', 'METER', 'NODE');
INSERT INTO cat_feature VALUES ('ADAPTATION', 'JUNCTION', 'NODE');

-- ----------------------------
-- Records of node type system table
-- ----------------------------

INSERT INTO node_type VALUES ('ADAPTATION', 'JUNCTION', 'JUNCTION', 'man_junction', 'inp_junction');
INSERT INTO node_type VALUES ('CHECK-VALVE', 'VALVE', 'SHORTPIPE', 'man_valve', 'inp_shortpipe');
INSERT INTO node_type VALUES ('AIR-VALVE', 'VALVE', 'JUNCTION', 'man_valve', 'inp_junction');
INSERT INTO node_type VALUES ('PR-REDUC.VALVE', 'VALVE', 'VALVE', 'man_valve', 'inp_valve');
INSERT INTO node_type VALUES ('GREEN-VALVE', 'VALVE', 'JUNCTION', 'man_valve', 'inp_junction');
INSERT INTO node_type VALUES ('CURVE', 'JUNCTION', 'JUNCTION', 'man_junction', 'inp_junction');
INSERT INTO node_type VALUES ('FILTER', 'FILTER', 'SHORTPIPE', 'man_filter', 'inp_shortpipe');
INSERT INTO node_type VALUES ('ENDLINE', 'JUNCTION', 'JUNCTION', 'man_junction', 'inp_junction');
INSERT INTO node_type VALUES ('FL-CONTR.VALVE', 'VALVE', 'VALVE', 'man_valve', 'inp_valve');
INSERT INTO node_type VALUES ('GEN-PURP.VALVE', 'VALVE', 'VALVE', 'man_valve', 'inp_valve');
INSERT INTO node_type VALUES ('HYDRANT', 'HYDRANT', 'JUNCTION', 'man_hydrant', 'inp_junction');
INSERT INTO node_type VALUES ('PR-BREAK.VALVE', 'VALVE', 'VALVE', 'man_valve', 'inp_valve');
INSERT INTO node_type VALUES ('OUTFALL-VALVE', 'VALVE', 'JUNCTION', 'man_valve', 'inp_junction');
INSERT INTO node_type VALUES ('JUNCTION', 'JUNCTION', 'JUNCTION', 'man_junction', 'inp_junction');
INSERT INTO node_type VALUES ('PR-SUSTA.VALVE', 'VALVE', 'VALVE', 'man_valve', 'inp_valve');
INSERT INTO node_type VALUES ('SHUTOFF-VALVE', 'VALVE', 'SHORTPIPE', 'man_valve', 'inp_shortpipe');
INSERT INTO node_type VALUES ('REDUCTION', 'REDUCTION', 'JUNCTION', 'man_reduction', 'inp_junction');
INSERT INTO node_type VALUES ('PUMP', 'PUMP', 'PUMP', 'man_pump', 'inp_pump');
INSERT INTO node_type VALUES ('TANK', 'TANK', 'TANK', 'man_tank', 'inp_tank');
INSERT INTO node_type VALUES ('THROTTLE-VALVE', 'VALVE', 'VALVE', 'man_valve', 'inp_valve');
INSERT INTO node_type VALUES ('T', 'JUNCTION', 'JUNCTION', 'man_junction', 'inp_junction');
INSERT INTO node_type VALUES ('WATERWELL', 'JUNCTION', 'JUNCTION', 'man_waterwell', 'inp_junction');
INSERT INTO node_type VALUES ('TAP', 'JUNCTION', 'JUNCTION', 'man_junction', 'inp_junction,');
INSERT INTO node_type VALUES ('X', 'JUNCTION', 'JUNCTION', 'man_junction', 'inp_junction');
INSERT INTO node_type VALUES ('SOURCE', 'SOURCE', 'JUNCTION', 'man_source', 'inp_junction');
INSERT INTO node_type VALUES ('MANHOLE', 'MANHOLE', 'JUNCTION', 'man_manhole', 'inp_junction');
INSERT INTO node_type VALUES ('REGISTER', 'REGISTER', 'JUNCTION', 'man_register', 'inp_junction');
INSERT INTO node_type VALUES ('CONTROL-REGISTER', 'REGISTER', 'VALVE', 'man_register', 'inp_valve');
INSERT INTO node_type VALUES ('BYPASS-REGISTER', 'REGISTER', 'JUNCTION', 'man_register', 'inp_junction');
INSERT INTO node_type VALUES ('VALVE-REGISTER', 'REGISTER', 'JUNCTION', 'man_register', 'inp_junction');
INSERT INTO node_type VALUES ('WATER-CONNECTION', 'NETWJOIN', 'JUNCTION', 'man_netwjoin', 'inp_junction');
INSERT INTO node_type VALUES ('EXPANTANK', 'EXPANSIONTANK', 'JUNCTION', 'man_expansiontank', 'inp_junction');
INSERT INTO node_type VALUES ('FLEXUNION', 'FLEXUNION', 'JUNCTION', 'man_flexunion', 'inp_junction');
INSERT INTO node_type VALUES ('FLOWMETER', 'METER', 'JUNCTION', 'man_meter', 'inp_junction');
INSERT INTO node_type VALUES ('PRESSURE-METER', 'METER', 'JUNCTION', 'man_meter', 'inp_junction'););



-- ----------------------------
-- Records of arc type system table
-- ----------------------------
INSERT INTO arc_type VALUES ('PIPE', 'PIPE', 'PIPE', 'man_pipe', 'inp_pipe');
INSERT INTO arc_type VALUES ('VARC', 'VARC', 'PIPE', 'man_varc', 'inp_pipe');


-- ----------------------------
-- Records of connec_type system table
-- ----------------------------

INSERT INTO connec_type VALUES ('WJOIN', 'WJOIN', 'man_wjoin');
INSERT INTO connec_type VALUES ('FOUNTAIN', 'FOUNTAIN', 'man_fountain' );
INSERT INTO connec_type VALUES ('TAP', 'TAP', 'man_tap');
INSERT INTO connec_type VALUES ('GREENTAP', 'GREENTAP', 'man_greentap');



-- ----------------------------
-- Records of element type system table
-- ----------------------------

INSERT INTO element_type VALUES ('REGISTER');
INSERT INTO element_type VALUES ('MANHOLE');
INSERT INTO element_type VALUES ('COVER');
INSERT INTO element_type VALUES ('STEP');

