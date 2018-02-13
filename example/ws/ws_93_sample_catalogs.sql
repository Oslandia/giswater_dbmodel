/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/

SET search_path = "SCHEMA_NAME", public, pg_catalog;

INSERT INTO cat_mat_arc VALUES ('N/I', NULL, NULL);
INSERT INTO cat_mat_arc VALUES ('PVC', 'PVC', 'c:\\users\users\catalog.pdf');
INSERT INTO cat_mat_arc VALUES ('FD', 'Iron', 'c:\\users\users\catalog.pdf');
INSERT INTO cat_mat_arc VALUES ('FC', 'Fiberconcret', 'c:\\users\users\catalog.pdf');
INSERT INTO cat_mat_arc VALUES ('PE-HD', 'PE high density', 'c:\\users\users\catalog.pdf');
INSERT INTO cat_mat_arc VALUES ('PE-LD', 'PE low density', 'c:\\users\users\catalog.pdf');

INSERT INTO cat_mat_element VALUES ('N/I', NULL, NULL);
INSERT INTO cat_mat_element VALUES ('FD', 'c:\\users\users\catalog.pdf', 'http://url.info');
INSERT INTO cat_mat_element VALUES ('CONCRET', NULL, NULL);
INSERT INTO cat_mat_element VALUES ('BRICK+IRON', NULL, NULL);

INSERT INTO cat_mat_node VALUES ('N/I', NULL, NULL);
INSERT INTO cat_mat_node VALUES ('PVC', 'PVC', 'c:\\users\users\catalog.pdf');
INSERT INTO cat_mat_node VALUES ('FD', 'Iron', 'c:\\users\users\catalog.pdf');
INSERT INTO cat_mat_node VALUES ('CC', 'Concret', 'c:\\users\users\catalog.pdf');
INSERT INTO cat_mat_node VALUES ('FC-FC-FC', 'Fiberconcret', 'c:\\users\users\catalog.pdf');
INSERT INTO cat_mat_node VALUES ('FC', 'Fiberconcret', 'c:\\users\users\catalog.pdf');
INSERT INTO cat_mat_node VALUES ('FD-FD-PVC', 'Iron-Iron-PVC', 'c:\\users\users\catalog.pdf');


INSERT INTO cat_arc VALUES ('PVC63-PN10', 'PIPE', 'PVC', '10 atm', '63 mm', 56.70000, 63.00000, 'PVC pipe', 'c:\\users\users\catalog.pdf', NULL, NULL, 'pvc63_pn10.svg', 0.10, 0.10, 0.06, 0.0031, 0.86, 3.15, 'm', 'A_PVC63_PN10', 'S_REP', 'S_NULL', NULL);
INSERT INTO cat_arc VALUES ('PVC110-PN16', 'PIPE', 'PVC', '16 atm', '110 mm', 99.00000, 110.00000, 'PVC pipe', 'c:\\users\users\catalog.pdf', NULL, NULL, 'pvc110_pn16.svg', 0.10, 0.10, 0.11, 0.0095, 0.91, 5.50, 'm', 'A_PVC110_PN16', 'S_REP', 'S_NULL', NULL);
INSERT INTO cat_arc VALUES ('PVC200-PN16', 'PIPE', 'PVC', '16 atm', '200 mm', 180.00000, 200.00000, 'PVC pipe', 'c:\\users\users\catalog.pdf', NULL, NULL, 'pvc200_pn16.svg', 0.10, 0.10, 0.20, 0.0314, 1.00, 10.00, 'm', 'A_PVC200_PN16', 'S_REP', 'S_NULL', NULL);
INSERT INTO cat_arc VALUES ('FD150', 'PIPE', 'FD', NULL, '150 mm', 153.00000, 170.00000, 'FD pipe', 'c:\\users\users\catalog.pdf', NULL, NULL, 'fd150.svg', 0.10, 0.10, 0.17, 0.0227, 0.97, 8.50, 'm', 'A_FD150', 'S_REP', 'S_NULL', NULL);
INSERT INTO cat_arc VALUES ('FD200', 'PIPE', 'FD', NULL, '200 mm', 199.80000, 222.00000, 'FD pipe', 'c:\\users\users\catalog.pdf', NULL, NULL, 'fd200.svg', 0.10, 0.10, 0.22, 0.0387, 1.02, 11.10, 'm', 'A_FD200', 'S_REP', 'S_NULL', NULL);
INSERT INTO cat_arc VALUES ('PEHD110-PN16', 'PIPE', 'PE-HD', '16 atm', '110 mm', 99.00000, 110.00000, 'PEHD pipe', 'c:\\users\users\catalog.pdf', NULL, NULL, 'pehd110_pn16.svg', 0.10, 0.10, 0.11, 0.0095, 0.91, 5.50, 'm', 'A_PEHD110_PN16', 'S_REP', 'S_NULL', NULL);
INSERT INTO cat_arc VALUES ('PELD110-PN10', 'PIPE', 'PE-LD', '10 atm', '110 mm', 99.00000, 110.00000, 'PELD pipe', 'c:\\users\users\catalog.pdf', NULL, NULL, 'peld110_pn10.svg', 0.10, 0.10, 0.11, 0.0095, 0.91, 5.50, 'm', 'A_PELD110_PN10', 'S_REP', 'S_NULL', NULL);
INSERT INTO cat_arc VALUES ('PVC160-PN16', 'PIPE', 'PVC', '16 atm', '160 mm', 144.00000, 160.00000, 'PVC pipe', 'c:\\users\users\catalog.pdf', NULL, NULL, 'pvc160_pn16.svg', 0.10, 0.10, 0.16, 0.0201, 0.96, 8.00, 'm', 'A_PVC160_PN16', 'S_REP', 'S_NULL', NULL);
INSERT INTO cat_arc VALUES ('FC63-PN10', 'PIPE', 'FC', '10 atm', '63 mm', 56.70000, 63.00000, 'FC pipe', 'c:\\users\users\catalog.pdf', NULL, NULL, 'fc63_pn10.svg', 0.10, 0.10, 0.06, 0.0031, 0.86, 3.15, 'm', 'A_FC63_PN10', 'S_REP', 'S_NULL', NULL);
INSERT INTO cat_arc VALUES ('FC110-PN10', 'PIPE', 'FC', '10 atm', '110 mm', 99.00000, 110.00000, 'FC pipe', 'c:\\users\users\catalog.pdf', NULL, NULL, 'fc110_pn10.svg', 0.10, 0.10, 0.11, 0.0095, 0.91, 5.50, 'm', 'A_FC110_PN10', 'S_REP', 'S_NULL', NULL);
INSERT INTO cat_arc VALUES ('FC160-PN10', 'PIPE', 'FC', '10 atm', '160 mm', 144.00000, 160.00000, 'FC pipe', 'c:\\users\users\catalog.pdf', NULL, NULL, 'fc160_pn10.svg', 0.10, 0.10, 0.16, 0.0201, 0.96, 8.00, 'm', 'A_FC160_PN10', 'S_REP', 'S_NULL', NULL);
INSERT INTO cat_arc VALUES ('VFC110-PN10', 'VARC', 'FC', '10 atm', '110 mm', 99.00000, 110.00000, 'FC pipe', 'c:\\users\users\catalog.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO cat_arc VALUES ('PVC90-PN16', 'PIPE', 'PVC', '16 atm', '90', 82.00000, 90.00000, 'PVC pipe', 'c:\\users\users\catalog.pdf', NULL, NULL, 'pvc90_pn10.svg', 0.10, 0.10, 0.09, 0.0064, 0.95, 4.50, 'm', 'A_PVC90_PN16', 'S_REP', 'S_NULL', NULL);
INSERT INTO cat_arc VALUES ('VFD150-PN16', 'VARC', 'FD', '16 atm', '150 mm', 153.00000, 170.00000, 'FD pipe', 'c:\\users\users\catalog.pdf', NULL, NULL, 'fd150.svg', 0.10, 0.10, 0.17, 0.0227, 0.97, 8.50, 'm', 'A_FD150', 'S_REP', 'S_NULL', NULL);

INSERT INTO cat_brand VALUES ('brand1');
INSERT INTO cat_brand VALUES ('brand2');
INSERT INTO cat_brand VALUES ('brand3');

INSERT INTO cat_brand_model VALUES ('model1', 'brand1');
INSERT INTO cat_brand_model VALUES ('model2', 'brand1');
INSERT INTO cat_brand_model VALUES ('model3', 'brand2');
INSERT INTO cat_brand_model VALUES ('model4', 'brand2');
INSERT INTO cat_brand_model VALUES ('model5', 'brand3');
INSERT INTO cat_brand_model VALUES ('model6', 'brand3');

INSERT INTO cat_builder VALUES ('builder1');
INSERT INTO cat_builder VALUES ('builder2');
INSERT INTO cat_builder VALUES ('builder3');

INSERT INTO cat_connec VALUES ('PVC25-PN16-DOM', 'WJOIN', 'PVC', '16 atm', '25 mm', NULL, NULL, 'PVC connec', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO cat_connec VALUES ('PVC32-PN16-DOM', 'WJOIN', 'PVC', '16 atm', '32 mm', NULL, NULL, 'PVC connec', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO cat_connec VALUES ('PVC32-PN16-TRA', 'WJOIN', 'PVC', '16 atm', '32 mm', NULL, NULL, 'PVC connec', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO cat_connec VALUES ('PVC50-PN16-IND', 'WJOIN', 'PVC', '16 atm', '50 mm', NULL, NULL, 'PVC connec', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO cat_connec VALUES ('PVC63-PN16-FOU', 'FOUNTAIN', 'PVC', '16 atm', '63 mm', NULL, NULL, 'PVC connec', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO cat_connec VALUES ('PVC25-PN16-TAP', 'TAP', 'PVC', '16 atm', '25 mm', NULL, NULL, 'PVC connec', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO cat_connec VALUES ('PVC50-PN16-GRE', 'GREENTAP', 'PVC', '16 atm', '50 mm', NULL, NULL, 'PVC connec ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO cat_dscenario VALUES (1, 'Hydrants_50%');

INSERT INTO cat_element VALUES ('COVER', 'COVER', 'FD', '60 cm', 'Cover fd', 'c:\\users\users\catalog.pdf', NULL, NULL, NULL, 'Cover_fd.svg', NULL);
INSERT INTO cat_element VALUES ('COVER40X40', 'COVER', 'FD', '40x40 cm', 'Cover fd', 'c:\\users\users\catalog.pdf', NULL, NULL, NULL, 'Cover_40x40.svg', NULL);
INSERT INTO cat_element VALUES ('VREGISTER200X200', 'REGISTER', 'BRICK+IRON', '200x200 cm', 'Vertical register concret/Iron', 'c:\\users\users\catalog.pdf', NULL, NULL, NULL, 'V_register.svg', NULL);
INSERT INTO cat_element VALUES ('REGISTER40X40', 'REGISTER', 'CONCRET', '40x40 cm', 'Register concret 40x40', 'c:\\users\users\catalog.pdf', NULL, NULL, NULL, 'Register_40x40.svg', NULL);
INSERT INTO cat_element VALUES ('REGISTER60X60', 'REGISTER', 'CONCRET', '60x60 cm', 'Register concret 60x60', 'c:\\users\users\catalog.pdf', NULL, NULL, NULL, 'Register_60x60.svg', NULL);

INSERT INTO cat_node VALUES ('FILTER-01-DN200', 'FILTER', 'FD', '16 atm', '200 mm', 186.00000, NULL, NULL, 'Filter 200 mm', 'c:\users\users\catalog.pdf', NULL, NULL, NULL, 1.00, NULL, 'N_FILTER-01', NULL);
INSERT INTO cat_node VALUES ('PRV-VALVE100-PN6/16', 'PR-REDUC.VALVE', 'FD', '6-16 atm', '100 mm', 86.00000, NULL, NULL, 'Pressure reduction valve', 'c:\users\users\catalog.pdf', NULL, NULL, NULL, 1.00, NULL, 'N_PRVAL100_6/16', NULL);
INSERT INTO cat_node VALUES ('TANK_01', 'TANK', 'FD', NULL, NULL, NULL, NULL, NULL, 'Tank', 'c:\users\users\catalog.pdf', NULL, NULL, NULL, 1.00, 'm3', 'N_TANK_30x10x3', NULL);
INSERT INTO cat_node VALUES ('HYDRANT 1X110', 'HYDRANT', 'FD', '16 atm', '110 mm', NULL, NULL, NULL, 'Green valve 110mm', 'c:\users\users\catalog.pdf', NULL, NULL, NULL, 1.00, NULL, 'N_HYD_1x100', NULL);
INSERT INTO cat_node VALUES ('TDN110-63 PN16', 'T', 'PVC', '16 atm', '110-110-63 mm', NULL, NULL, NULL, 'PVC T', 'c:\users\users\catalog.pdf', NULL, NULL, NULL, 1.00, NULL, 'N_T110-63_PN16', NULL);
INSERT INTO cat_node VALUES ('TDN160-63 PN16', 'T', 'FD', '16 atm', '160-160-63 mm', NULL, NULL, NULL, 'FD T', 'c:\users\users\catalog.pdf', NULL, NULL, NULL, 1.00, NULL, 'N_T160-63_PN16', NULL);
INSERT INTO cat_node VALUES ('TDN200-160 PN16', 'T', 'FD', '16 atm', '200-160-160 mm', NULL, NULL, NULL, 'FD T', 'c:\users\users\catalog.pdf', NULL, NULL, NULL, 1.00, NULL, 'N_T200-160_PN16', NULL);
INSERT INTO cat_node VALUES ('PUMP-01', 'PUMP', 'FD', '16 atm', '110 mm', 100.00000, NULL, NULL, 'Pump station', 'c:\users\users\catalog.pdf', NULL, NULL, NULL, 1.00, NULL, 'N_PUMP-01', NULL);
INSERT INTO cat_node VALUES ('HYDRANT 1X110-2X63', 'HYDRANT', 'FD', '16 atm', '110 mm', NULL, NULL, NULL, 'Green valve 110mm', 'c:\users\users\catalog.pdf', NULL, NULL, NULL, 1.00, NULL, 'N_HYD_1x110-2x63', NULL);
INSERT INTO cat_node VALUES ('TDN160-110 PN16', 'T', 'FD', '16 atm', '110-160-160 mm', NULL, NULL, NULL, 'FD T', 'c:\users\users\catalog.pdf', NULL, NULL, NULL, 1.00, NULL, 'N_T160-110_PN16', NULL);
INSERT INTO cat_node VALUES ('PRV-VALVE200-PN6/16', 'PR-REDUC.VALVE', 'FD', '6-16 atm', '200 mm', 186.00000, NULL, NULL, 'Pressure reduction valve', 'c:\users\users\catalog.pdf', NULL, NULL, NULL, 1.00, NULL, 'N_PRVAL200_6/16', NULL);
INSERT INTO cat_node VALUES ('TDN63-63 PN16', 'T', 'PVC', '16 atm', '63-63-63 mm', NULL, NULL, NULL, 'PVC T', 'c:\users\users\catalog.pdf', NULL, NULL, NULL, 1.00, NULL, 'N_T63-63_PN16', NULL);
INSERT INTO cat_node VALUES ('TDN110-110 PN16', 'T', 'FD', '16 atm', '110-110-110 mm', NULL, NULL, NULL, 'FD T', 'c:\users\users\catalog.pdf', NULL, NULL, NULL, 1.00, NULL, 'N_T110-110_PN16', NULL);
INSERT INTO cat_node VALUES ('PRV-VALVE150-PN6/16', 'PR-REDUC.VALVE', 'FD', '6-16 atm', '150 mm', 148.00000, NULL, NULL, 'Pressure reduction valve', 'c:\users\users\catalog.pdf', NULL, NULL, NULL, 1.00, NULL, 'N_PRVAL150_6/16', NULL);
INSERT INTO cat_node VALUES ('TDN160-160 PN16', 'T', 'FD', '16 atm', '160-160-160 mm', NULL, NULL, NULL, 'FD T', 'c:\users\users\catalog.pdf', NULL, NULL, NULL, 1.00, NULL, 'N_T160-160_PN16', NULL);
INSERT INTO cat_node VALUES ('CURVE30DN110 PVCPN16', 'CURVE', 'PVC', '16 atm', '100 mm', 100.00000, NULL, NULL, 'PVC curve', 'c:\users\users\catalog.pdf', NULL, NULL, NULL, 1.00, NULL, 'N_CUR30_PVC110', NULL);
INSERT INTO cat_node VALUES ('TDN160-110-63 PN16', 'T', 'FD', '16 atm', '160-110-63 mm', NULL, NULL, NULL, 'FD T', 'c:\users\users\catalog.pdf', NULL, NULL, NULL, 1.00, NULL, 'N_T160-110-63', NULL);
INSERT INTO cat_node VALUES ('CURVE45DN110 PVCPN16', 'CURVE', 'PVC', '16 atm', '100 mm', 100.00000, NULL, NULL, 'PVC curve', 'c:\users\users\catalog.pdf', NULL, NULL, NULL, 1.00, NULL, 'N_CUR45_PVC110', NULL);
INSERT INTO cat_node VALUES ('WATERWELL-01', 'WATERWELL', 'FD', NULL, NULL, NULL, NULL, NULL, 'Waterwell', 'c:\users\users\catalog.pdf', NULL, NULL, NULL, 1.00, NULL, 'N_WATERWELL-01', NULL);
INSERT INTO cat_node VALUES ('OUTFALL VALVE-DN150', 'OUTFALL-VALVE', 'FD', '16 atm', '150mm', NULL, NULL, NULL, 'Outfall valve ', 'c:\users\users\catalog.pdf', NULL, NULL, NULL, 1.00, NULL, 'N_OUTVAL-01', NULL);
INSERT INTO cat_node VALUES ('FLOWMETER-01-DN200', 'FLOWMETER', 'FD', '16 atm', '200 mm', 186.00000, NULL, NULL, 'Flow meter 200 mm', 'c:\users\users\catalog.pdf', NULL, NULL, NULL, 1.00, NULL, 'N_FLOWMETER110', NULL);
INSERT INTO cat_node VALUES ('FLOWMETER-02-DN110', 'FLOWMETER', 'FD', '16 atm', '110 mm', 100.00000, NULL, NULL, 'Flow meter 110 mm', 'c:\users\users\catalog.pdf', NULL, NULL, NULL, 1.00, NULL, 'N_FLOWMETER200', NULL);
INSERT INTO cat_node VALUES ('GREENVALVEDN63 PN16', 'GREEN-VALVE', 'FD', '16 atm', '63 mm', NULL, NULL, NULL, 'Green valve 63mm', 'c:\users\users\catalog.pdf', NULL, NULL, NULL, 1.00, NULL, 'N_GREVAL63_PN16', NULL);
INSERT INTO cat_node VALUES ('GREENVALVEDN110 PN16', 'GREEN-VALVE', 'FD', '16 atm', '110 mm', NULL, NULL, NULL, 'Green valve 110mm', 'c:\users\users\catalog.pdf', NULL, NULL, NULL, 1.00, NULL, 'N_GREVAL110_PN16', NULL);
INSERT INTO cat_node VALUES ('GREENVALVEDN50 PN16', 'GREEN-VALVE', 'FD', '16 atm', '50 mm', NULL, NULL, NULL, 'Green valve 110mm', 'c:\users\users\catalog.pdf', NULL, NULL, NULL, 1.00, NULL, 'N_GREVAL50_PN16', NULL);
INSERT INTO cat_node VALUES ('AIR VALVE DN50', 'AIR-VALVE', 'FD', '16 atm', '50 mm', NULL, NULL, NULL, 'Air valve 50mm', 'c:\users\users\catalog.pdf', NULL, NULL, NULL, 1.00, NULL, 'N_AIRVAL_DN50', NULL);
INSERT INTO cat_node VALUES ('TDN63-63-110 PN16', 'T', 'PVC', '16 atm', '63-63-110 mm', NULL, NULL, NULL, 'PVC T', 'c:\users\users\catalog.pdf', NULL, NULL, NULL, 1.00, NULL, 'N_T63-63-110', NULL);
INSERT INTO cat_node VALUES ('SOURCE-01', 'SOURCE', NULL, NULL, NULL, NULL, NULL, NULL, 'Source', 'c:\users\users\catalog.pdf', NULL, NULL, NULL, 1.00, NULL, 'N_SOURCE-01', NULL);
INSERT INTO cat_node VALUES ('PUMP-02', 'PUMP', 'FD', NULL, NULL, 100.00000, NULL, NULL, 'Pump tank', 'c:\users\users\catalog.pdf', NULL, NULL, NULL, 1.00, NULL, 'N_PUMP-01', NULL);
INSERT INTO cat_node VALUES ('NETSAMPLEPOINT', 'NETSAMPLEPOINT', NULL, NULL, NULL, NULL, NULL, NULL, 'Netsamplepoint', NULL, NULL, NULL, NULL, 1.00, NULL, NULL, NULL);
INSERT INTO cat_node VALUES ('NETELEMENT', 'NETELEMENT', NULL, NULL, NULL, NULL, NULL, NULL, 'Netelement', NULL, NULL, NULL, NULL, 1.00, NULL, NULL, NULL);
INSERT INTO cat_node VALUES ('FLEXUNION', 'FLEXUNION', NULL, NULL, NULL, NULL, NULL, NULL, 'Flexunion', NULL, NULL, NULL, NULL, 1.00, NULL, NULL, NULL);
INSERT INTO cat_node VALUES ('EXPANTANK', 'EXPANTANK', NULL, NULL, NULL, NULL, NULL, NULL, 'Expansiontank', NULL, NULL, NULL, NULL, 1.00, NULL, NULL, NULL);
INSERT INTO cat_node VALUES ('REGISTER', 'REGISTER', NULL, NULL, NULL, NULL, NULL, NULL, 'Register', NULL, NULL, NULL, NULL, 1.00, NULL, NULL, NULL);
INSERT INTO cat_node VALUES ('WATER-CONNECTION', 'WATER-CONNECTION', NULL, NULL, NULL, NULL, NULL, NULL, 'Netwjoin', NULL, NULL, NULL, NULL, 1.00, NULL, NULL, NULL);
INSERT INTO cat_node VALUES ('TDN110-90 PN16', 'T', 'FD', '16 atm', '110-110-90 mm', NULL, NULL, NULL, 'FD T', 'c:\users\users\catalog.pdf', NULL, NULL, NULL, 1.00, NULL, 'N_T110-63_PN16', NULL);
INSERT INTO cat_node VALUES ('JUNCTION DN63', 'JUNCTION', 'FD', '16 atm', '63 mm', NULL, NULL, NULL, 'Juntion 63mm', 'c:\users\users\catalog.pdf', NULL, NULL, NULL, 1.00, NULL, 'N_JUN63', NULL);
INSERT INTO cat_node VALUES ('JUNCTION DN110', 'JUNCTION', 'FD', '16 atm', '110 mm', NULL, NULL, NULL, 'Juntion 110mm', 'c:\users\users\catalog.pdf', NULL, NULL, NULL, 1.00, NULL, 'N_JUN110', NULL);
INSERT INTO cat_node VALUES ('JUNCTION DN160', 'JUNCTION', 'FD', '16 atm', '16 0mm', NULL, NULL, NULL, 'Juntion 160mm', 'c:\users\users\catalog.pdf', NULL, NULL, NULL, 1.00, NULL, 'N_JUN160', NULL);
INSERT INTO cat_node VALUES ('JUNCTION DN200', 'JUNCTION', 'FD', '16 atm', '200 mm', NULL, NULL, NULL, 'Juntion 200mm', 'c:\users\users\catalog.pdf', NULL, NULL, NULL, 1.00, NULL, 'N_JUN200', NULL);
INSERT INTO cat_node VALUES ('JUNCTION DN90', 'JUNCTION', 'FD', '16 atm', '90 mm', NULL, NULL, NULL, 'Juntion 90mm', 'c:\users\users\catalog.pdf', NULL, NULL, NULL, 1.00, NULL, 'N_JUN110', NULL);
INSERT INTO cat_node VALUES ('ENDLINE DN63', 'ENDLINE', 'PVC', '16 atm', '63 mm', 63.00000, NULL, NULL, 'End line', 'c:\users\users\catalog.pdf', NULL, NULL, NULL, 1.00, NULL, 'N_ENDLINE', NULL);
INSERT INTO cat_node VALUES ('ENDLINE DN150', 'ENDLINE', 'FD', '16 atm', '150 mm', 150.00000, NULL, NULL, 'End line', 'c:\users\users\catalog.pdf', NULL, NULL, NULL, 1.00, NULL, 'N_ENDLINE', NULL);
INSERT INTO cat_node VALUES ('ETAP', 'WTP', NULL, NULL, NULL, NULL, NULL, NULL, 'Wtp', NULL, NULL, NULL, NULL, 1.00, NULL, NULL, NULL);
INSERT INTO cat_node VALUES ('ENDLINE DN90', 'ENDLINE', 'PVC', '16 atm', '90 mm', 90.00000, NULL, NULL, 'End line', 'c:\users\users\catalog.pdf', NULL, NULL, NULL, 1.00, NULL, 'N_ENDLINE', NULL);
INSERT INTO cat_node VALUES ('TDN110-90-63 PN16', 'T', 'FD', '16 atm', '110-90-63 mm', NULL, NULL, NULL, 'FD T', 'c:\users\users\catalog.pdf', NULL, NULL, NULL, 1.00, NULL, 'N_T110-63_PN16', NULL);
INSERT INTO cat_node VALUES ('REDUC_110-90 PN16', 'REDUCTION', 'PVC', '16 atm', NULL, 90.00000, NULL, NULL, 'Reduction', NULL, NULL, NULL, NULL, 1.00, NULL, NULL, NULL);
INSERT INTO cat_node VALUES ('XDN110 PN16', 'X', 'FD', '16 atm', '110 mm', NULL, NULL, NULL, 'X', NULL, NULL, NULL, NULL, 1.00, NULL, NULL, NULL);
INSERT INTO cat_node VALUES ('XDN110-90 PN16', 'X', 'FD', '16 atm', '110-90 mm', NULL, NULL, NULL, 'X', NULL, NULL, NULL, NULL, 1.00, NULL, NULL, NULL);
INSERT INTO cat_node VALUES ('REDUC_160-90 PN16', 'REDUCTION', 'PVC', '16 atm', NULL, 90.00000, NULL, NULL, 'Reduction', NULL, NULL, NULL, NULL, 1.00, NULL, NULL, NULL);
INSERT INTO cat_node VALUES ('CHK-VALVE63-PN16', 'CHECK-VALVE', 'FD', '16 atm', '63 mm', 55.00000, NULL, NULL, 'Check valve 63mm', 'c:\users\users\catalog.pdf', NULL, NULL, NULL, 1.00, NULL, 'N_CHKVAL63_PN10', NULL);
INSERT INTO cat_node VALUES ('CHK-VALVE150-PN16', 'CHECK-VALVE', 'FD', '16 atm', '150 mm', 140.00000, NULL, NULL, 'Check valve 150mm', 'c:\users\users\catalog.pdf', NULL, NULL, NULL, 1.00, NULL, 'N_CHKVAL150_PN10', NULL);
INSERT INTO cat_node VALUES ('CHK-VALVE100-PN16', 'CHECK-VALVE', 'FD', '16 atm', '100 mm', 95.00000, NULL, NULL, 'Check valve 110mm', 'c:\users\users\catalog.pdf', NULL, NULL, NULL, 1.00, NULL, 'N_CHKVAL100_PN10', NULL);
INSERT INTO cat_node VALUES ('CHK-VALVE200-PN16', 'CHECK-VALVE', 'FD', '16 atm', '200 mm', 186.00000, NULL, NULL, 'Check valve 200mm', 'c:\users\users\catalog.pdf', NULL, NULL, NULL, 1.00, NULL, 'N_CHKVAL200_PN10', NULL);
INSERT INTO cat_node VALUES ('CHK-VALVE300-PN16', 'CHECK-VALVE', 'FD', '16 atm', '300 mm', 282.00000, NULL, NULL, 'Check valve 300mm', 'c:\users\users\catalog.pdf', NULL, NULL, NULL, 1.00, NULL, 'N_CHKVAL300_PN10', NULL);
INSERT INTO cat_node VALUES ('PRESMETER-63-PN16', 'PRESSURE-METER', 'FD', '16 atm', '63 mm', NULL, NULL, NULL, 'Pressure meter 63 mm', 'c:\users\users\catalog.pdf', NULL, NULL, 'pressuremeter.svg', 1.00, NULL, 'N_PRESME200_PN16', NULL);
INSERT INTO cat_node VALUES ('PRESMETER-110-PN16', 'PRESSURE-METER', 'FD', '16 atm', '110 mm', NULL, NULL, NULL, 'Pressure meter 110 mm', 'c:\users\users\catalog.pdf', NULL, NULL, 'pressuremeter.svg', 1.00, NULL, 'N_PRESME110_PN16', NULL);
INSERT INTO cat_node VALUES ('PRESMETER', 'PRESSURE-METER', 'FD', NULL, NULL, NULL, NULL, NULL, 'Pressure meter', NULL, NULL, NULL, 'pressuremeter.svg', 1.00, NULL, 'N_PRESME200_PN16', NULL);
INSERT INTO cat_node VALUES ('FILTER-02-DN150', 'FILTER', 'FD', '16 atm', '150 mm', 145.00000, NULL, NULL, 'Filter 150 mm', NULL, NULL, NULL, NULL, 1.00, NULL, 'N_FILTER-01', NULL);
INSERT INTO cat_node VALUES ('CHK-VALVE90-PN16', 'CHECK-VALVE', 'FD', '16 atm', '90 mm', 82.00000, NULL, NULL, 'Check valve 90mm', 'c:\users\users\catalog.pdf', NULL, NULL, NULL, 1.00, NULL, 'N_CHKVAL100_PN10', NULL);
INSERT INTO cat_node VALUES ('SHTFF-VALVE160-PN16', 'SHUTOFF-VALVE', 'FD', '16 atm', '160 mm', 148.00000, NULL, NULL, 'Shutoff valve 160 mm', 'c:\users\users\catalog.pdf', NULL, NULL, NULL, 1.00, NULL, 'N_SHTVAL160_PN16', NULL);
INSERT INTO cat_node VALUES ('SHTFF-VALVE110-PN16', 'SHUTOFF-VALVE', 'FD', '16 atm', '110 mm', 100.00000, NULL, NULL, 'Shutoff valve 110 mm', 'c:\users\users\catalog.pdf', NULL, NULL, NULL, 1.00, NULL, 'N_SHTVAL110_PN16', NULL);
INSERT INTO cat_node VALUES ('SHTFF-VALVEN63 PN16', 'SHUTOFF-VALVE', 'FD', '16 atm', '63 mm', 55.00000, NULL, NULL, 'Shutoff valve 63 mm', 'c:\users\users\catalog.pdf', NULL, NULL, NULL, 1.00, NULL, 'N_SHTVAL63_PN16', NULL);


INSERT INTO cat_owner VALUES ('owner1');
INSERT INTO cat_owner VALUES ('owner2');
INSERT INTO cat_owner VALUES ('owner3');


INSERT INTO cat_pavement VALUES ('Asphalt', NULL,NULL,'0.10','P_ASPHALT-10');
INSERT INTO cat_pavement VALUES ('pavement1');
INSERT INTO cat_pavement VALUES ('pavement2');

INSERT INTO cat_presszone VALUES ('High-Expl_01', NULL, '1');
INSERT INTO cat_presszone VALUES ('Medium-Expl_01', NULL, '1');
INSERT INTO cat_presszone VALUES ('Low-Expl_01', NULL, '1');
INSERT INTO cat_presszone VALUES ('High-Expl_02', NULL, '2');
INSERT INTO cat_presszone VALUES ('Medium-Expl_02', NULL, '2');
INSERT INTO cat_presszone VALUES ('Low-Expl_02', NULL, '2');

INSERT INTO cat_soil VALUES ('Standard soil', 'Sòl estandard de plana dinundació', NULL, '5.00', '0.20', '0','S_EXC','S_REB','S_TRANS','S_TRENCH'); 
INSERT INTO cat_soil VALUES ('soil1');
INSERT INTO cat_soil VALUES ('soil2');

INSERT INTO cat_work VALUES ('work1');
INSERT INTO cat_work VALUES ('work2');
INSERT INTO cat_work VALUES ('work3');