/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/



SET search_path = "SCHEMA_NAME", public, pg_catalog;


-- controls
INSERT INTO inp_controls_x_node (id, node_id, text) VALUES (1, '113766', 'RULE 1');
INSERT INTO inp_controls_x_node (id, node_id, text) VALUES (3, '113766', 'THEN PUMP 1105_n2a STATUS IS CLOSED');
INSERT INTO inp_controls_x_node (id, node_id, text) VALUES (4, '113766', 'RULE 2');
INSERT INTO inp_controls_x_arc (id, arc_id, text) VALUES (6, '113921', 'THEN PUMP 1105_n2a STATUS IS OPEN');
INSERT INTO inp_controls_x_arc (id, arc_id, text) VALUES (2, '113921', 'IF TANK 113766 LEVEL ABOVE 3');
INSERT INTO inp_controls_x_arc (id, arc_id, text) VALUES (5, '113921', 'IF TANK 113766 LEVEL BELOW 0.75');


-- emiteers
INSERT INTO inp_emitter (node_id, coef) VALUES ('1001', 0.5);
INSERT INTO inp_emitter (node_id, coef) VALUES ('1002', 0.1);
INSERT INTO inp_emitter (node_id, coef) VALUES ('1003', 0.2);
INSERT INTO inp_emitter (node_id, coef) VALUES ('1004', 0.4);


-- energy
INSERT INTO inp_energy (descript) VALUES ('GLOBAL PRICE 0.5');
INSERT INTO inp_energy (descript) VALUES ('GLOBAL PATTERN pattern_01');
INSERT INTO inp_energy (descript) VALUES ('GLOBAL EFFIC 0.8');

UPDATE inp_pump SET energyparam = '', energyvalue='';

UPDATE inp_pump_additional SET energyparam = '', energyvalue='' WHERE node_id='';



--quality
INSERT INTO inp_source (node_id, sourc_type, quality, pattern_id) VALUES ('1001', 'CONCEN', 1.200000, 'pattern_01');
INSERT INTO inp_source (node_id, sourc_type, quality, pattern_id) VALUES ('1002', 'MASS', 17.000000, 'pattern_02');
INSERT INTO inp_source (node_id, sourc_type, quality, pattern_id) VALUES ('1003', 'CONCEN', 1.500000, 'pattern_01');

INSERT INTO inp_quality (node_id, initqual) VALUES ('1001', 0.12);
INSERT INTO inp_quality (node_id, initqual) VALUES ('1002', 0.25);
INSERT INTO inp_quality (node_id, initqual) VALUES ('1003', 0.27);
INSERT INTO inp_quality (node_id, initqual) VALUES ('1004', 0.125);

INSERT INTO inp_mixing (node_id, mix_type, value) VALUES ('113766', '2COMP', 1);

INSERT INTO inp_reactions (descript) VALUES ('GLOBAL BULK -0.5');
INSERT INTO inp_reactions (descript) VALUES ('GLOBAL WALL -1.0');
INSERT INTO inp_reactions (descript) VALUES ('LIMITING POTENTIAL 1');
INSERT INTO inp_reactions (descript) VALUES ('ROUGHNESS CORRELATION 1.8');

UPDATE inp_pipe SET reactiontype='', reactionparam='', reactionvalue='';







