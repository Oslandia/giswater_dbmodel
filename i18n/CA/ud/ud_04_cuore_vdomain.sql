/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/

-- ----------------------------
-- Records of value_state
-- ----------------------------
INSERT INTO "value_state" VALUES (0,'OBSOLET');
INSERT INTO "value_state" VALUES (1,'EN_SERVEI');
INSERT INTO "value_state" VALUES (2,'PLANIFICAT');


-- ----------------------------
-- Records of value_state_type
-- ----------------------------
INSERT INTO value_state_type VALUES (1, 0, 'OBSOLET', false, false);
INSERT INTO value_state_type VALUES (2, 1, 'EN_SERVEI', true, true);
INSERT INTO value_state_type VALUES (3, 2, 'PLANIFICAT', true, true);
INSERT INTO value_state_type VALUES (4, 2, 'RECONSTRUIR', true, false);
INSERT INTO value_state_type VALUES (5, 1, 'PROVISIONAL', false, true);

-- ----------------------------
-- Records of value_verified
-- ----------------------------
INSERT INTO "value_verified" VALUES ('PER REVISAR');
INSERT INTO "value_verified" VALUES ('VERIFICAT');


-- ----------------------------
-- Records of value_yesno
-- ----------------------------
INSERT INTO "value_yesno" VALUES ('NO');
INSERT INTO "value_yesno" VALUES ('SI');




-- ----------------------------
-- Records of man_type_category
-- ----------------------------
INSERT INTO man_type_category VALUES (1, 'Categoria Estàndard', 'NODE');
INSERT INTO man_type_category VALUES (2, 'Categoria Estàndard', 'ARC');
INSERT INTO man_type_category VALUES (3, 'Categoria Estàndard', 'CONNEC');
INSERT INTO man_type_category VALUES (4, 'Categoria Estàndard', 'ELEMENT');
INSERT INTO man_type_category VALUES (5, 'Categoria Estàndard', 'GULLY');


-- ----------------------------
-- Records of man_type_fluid
-- ----------------------------
INSERT INTO man_type_fluid VALUES (1, 'Fluid Estàndard', 'NODE');
INSERT INTO man_type_fluid VALUES (2, 'Fluid Estàndard', 'ARC');
INSERT INTO man_type_fluid VALUES (3, 'Fluid Estàndard', 'CONNEC');
INSERT INTO man_type_fluid VALUES (4, 'Fluid Estàndard', 'ELEMENT');
INSERT INTO man_type_fluid VALUES (5, 'Fluid Estàndard', 'GULLY');


-- ----------------------------
-- Records of man_type_location
-- ----------------------------
INSERT INTO man_type_location VALUES (1, 'Localització Estàndard', 'NODE');
INSERT INTO man_type_location VALUES (2, 'Localització Estàndard', 'ARC');
INSERT INTO man_type_location VALUES (3, 'Localització Estàndard', 'CONNEC');
INSERT INTO man_type_location VALUES (4, 'Localització Estàndard', 'ELEMENT');
INSERT INTO man_type_location VALUES (5, 'Localització Estàndard', 'GULLY');

