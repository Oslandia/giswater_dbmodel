/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/

SET search_path = "SCHEMA_NAME", public, pg_catalog;

INSERT INTO inp_connec SELECT connec_id FROM connec;

UPDATE inp_cat_mat_roughness SET roughness=0.014;

INSERT INTO inp_curve_id VALUES ('PUMP_01', 'PUMP');
INSERT INTO inp_curve_id VALUES ('PUMP_02', 'PUMP');

INSERT INTO inp_curve VALUES (1, 'PUMP_02', 3.3000, 15.0000);
INSERT INTO inp_curve VALUES (2, 'PUMP_01', 5.0000, 35.0000);

INSERT INTO inp_pattern VALUES ('pattern_01','Supossed pattern from literature', 'UNITARY', null , null);
INSERT INTO inp_pattern VALUES ('pattern_02','Supossed pattern from literature', 'UNITARY', null , null);
INSERT INTO inp_pattern VALUES ('pattern_03','Supossed pattern from literature', 'UNITARY', null , null);
INSERT INTO inp_pattern VALUES ('pattern_hydrant','Supossed pattern from literature', 'UNITARY', null , null);
INSERT INTO inp_pattern VALUES ('dma02_period05', NULL, 'VOLUME', null , null);
INSERT INTO inp_pattern VALUES ('dma02_period06', NULL, 'VOLUME', null , null);
INSERT INTO inp_pattern VALUES ('dma02_period07', NULL, 'VOLUME', null , null);
INSERT INTO inp_pattern VALUES ('dma03_period05', NULL, 'VOLUME', null , null);
INSERT INTO inp_pattern VALUES ('dma03_period06', NULL, 'VOLUME', null , null);
INSERT INTO inp_pattern VALUES ('dma03_period07', NULL, 'VOLUME', null , null);


INSERT INTO inp_pattern_value VALUES (1, 'pattern_01', 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000);
INSERT INTO inp_pattern_value VALUES (2, 'pattern_01', 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000);
INSERT INTO inp_pattern_value VALUES (3, 'pattern_02', 0.2000, 0.2000, 0.2500, 0.2600, 0.3000, 0.3000, 0.8000, 1.0000, 0.8000, 0.6500, 0.6000, 0.5000);
INSERT INTO inp_pattern_value VALUES (4, 'pattern_02', 0.5000, 0.8500, 1.0000, 0.8500, 0.6800, 0.5000, 0.8000, 0.9000, 0.7500, 0.6000, 0.5000, 0.4000);
INSERT INTO inp_pattern_value VALUES (5, 'pattern_03', 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000);
INSERT INTO inp_pattern_value VALUES (6, 'pattern_03', 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000);
INSERT INTO inp_pattern_value VALUES (7, 'pattern_hydrant', 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, 0.0000, 0.0000, 0.0000); 
INSERT INTO inp_pattern_value VALUES (8, 'pattern_hydrant', 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000);
INSERT INTO inp_pattern_value VALUES (9, 'dma02_period06', 1.3100, 1.3400, 1.3800, 1.3900, 1.4200, 2.0500, 2.1200, 2.0100, 1.9500, 1.8800, 1.7700, 1.6600);
INSERT INTO inp_pattern_value VALUES (10, 'dma02_period06', 1.8500, 1.9900, 2.1200, 1.9900, 1.8500, 1.7700, 1.9900, 2.0900, 1.9500, 1.7500, 1.6800, 1.6600);
INSERT INTO inp_pattern_value VALUES (11, 'dma03_period06', 1.4500, 1.3400, 1.4800, 1.4700, 1.5000, 1.5000, 2.0500, 2.4400, 2.0500, 1.9900, 1.8800, 1.7400);
INSERT INTO inp_pattern_value VALUES (12, 'dma03_period06', 1.8800, 2.1200, 2.4500, 2.2200, 1.9500, 1.8800, 2.0800, 2.2300, 2.0400, 1.8800, 1.7800, 1.6500);
INSERT INTO inp_pattern_value VALUES (13, 'dma02_period05', 1.5500, 1.4200, 1.4300, 1.4400, 1.4500, 1.5500, 1.5600, 2.0500, 2.0500, 1.8800, 1.8000, 1.6700);
INSERT INTO inp_pattern_value VALUES (14, 'dma02_period05', 1.4500, 1.6600, 2.0100, 2.1100, 1.8900, 1.6600, 1.9900, 2.0700, 1.9900, 1.8800, 1.6000, 1.5500);
INSERT INTO inp_pattern_value VALUES (15, 'dma03_period05', 1.4520, 1.4400, 1.4500, 1.5500, 1.5600, 1.5800, 1.5800, 1.9900, 2.2200, 1.8800, 1.8800, 1.7100);
INSERT INTO inp_pattern_value VALUES (16, 'dma03_period05', 1.4250, 1.8000, 2.1000, 2.2200, 2.0900, 1.9900, 1.8800, 2.1000, 2.1500, 1.9900, 1.9000, 1.7250);
INSERT INTO inp_pattern_value VALUES (17, 'dma02_period07', 1.3330, 1.3100, 1.4440, 1.4550, 1.4254, 1.4350, 2.0550, 2.2220, 1.9900, 1.8900, 1.7800, 1.6900);
INSERT INTO inp_pattern_value VALUES (18, 'dma02_period07', 1.6660, 2.0500, 2.2220, 2.0505, 1.8800, 1.6760, 2.0040, 1.9970, 1.9520, 1.7580, 1.6800, 1.5200);
INSERT INTO inp_pattern_value VALUES (19, 'dma03_period07', 1.4440, 1.5000, 1.4550, 1.5500, 1.5550, 1.5632, 2.1450, 2.3540, 2.2240, 1.8880, 1.9990, 1.6700);
INSERT INTO inp_pattern_value VALUES (20, 'dma03_period07', 1.7500, 2.1100, 2.3110, 2.2220, 1.9870, 1.7770, 2.1450, 2.1140, 1.9990, 1.9750, 1.7580, 1.8680);


INSERT INTO inp_demand VALUES (1, '1009', 8.000000, 'pattern_hydrant', NULL, 1);
INSERT INTO inp_demand VALUES (2, '1012', 8.000000, 'pattern_03', NULL, 1);
INSERT INTO inp_demand VALUES (3, '1054', 8.000000, 'pattern_hydrant', NULL, 1);
INSERT INTO inp_demand VALUES (4, '113959', 8.000000, 'pattern_hydrant', NULL, 1);
INSERT INTO inp_demand VALUES (5, '113961', 8.000000, 'pattern_03', NULL, 1);
INSERT INTO inp_demand VALUES (6, '113960', 8.000000, 'pattern_hydrant', NULL, 1);

INSERT INTO inp_junction VALUES ('10761', 0.068855, 'pattern_02');
INSERT INTO inp_junction VALUES ('1068', 0.047200, 'pattern_02');
INSERT INTO inp_junction VALUES ('1002', 0.014036, 'pattern_02');
INSERT INTO inp_junction VALUES ('1010', 0.042418, 'pattern_02');
INSERT INTO inp_junction VALUES ('1077', 0.038636, 'pattern_02');
INSERT INTO inp_junction VALUES ('1004', 0.048418, 'pattern_02');
INSERT INTO inp_junction VALUES ('1006', 0.004236, 'pattern_02');
INSERT INTO inp_junction VALUES ('1060', 0.035891, 'pattern_02');
INSERT INTO inp_junction VALUES ('1014', 0.031836, 'pattern_02');
INSERT INTO inp_junction VALUES ('1015', 0.022600, 'pattern_02');
INSERT INTO inp_junction VALUES ('1056', 0.016945, 'pattern_02');
INSERT INTO inp_junction VALUES ('1059', 0.030018, 'pattern_02');
INSERT INTO inp_junction VALUES ('1012', 16.000000, 'pattern_03');
INSERT INTO inp_junction VALUES ('1062', 0.034473, 'pattern_02');
INSERT INTO inp_junction VALUES ('1044', 0.068855, 'pattern_02');
INSERT INTO inp_junction VALUES ('1076', 0.068855, 'pattern_02');
INSERT INTO inp_junction VALUES ('1061', 0.011800, 'pattern_02');
INSERT INTO inp_junction VALUES ('1058', 0.032018, 'pattern_02');
INSERT INTO inp_junction VALUES ('1079', 0.003500, 'pattern_02');
INSERT INTO inp_junction VALUES ('1057', 0.016945, 'pattern_02');
INSERT INTO inp_junction VALUES ('1073', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('1084', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('1021', 0.037873, 'pattern_02');
INSERT INTO inp_junction VALUES ('1067', 0.045782, 'pattern_02');
INSERT INTO inp_junction VALUES ('1063', 0.010018, 'pattern_02');
INSERT INTO inp_junction VALUES ('1037', 0.055527, 'pattern_02');
INSERT INTO inp_junction VALUES ('1003', 0.143745, 'pattern_02');
INSERT INTO inp_junction VALUES ('1051', 0.165455, 'pattern_02');
INSERT INTO inp_junction VALUES ('1039', 0.065255, 'pattern_02');
INSERT INTO inp_junction VALUES ('1040', 0.075618, 'pattern_02');
INSERT INTO inp_junction VALUES ('1001', 0.029364, 'pattern_02');
INSERT INTO inp_junction VALUES ('1025', 0.029745, 'pattern_02');
INSERT INTO inp_junction VALUES ('1049', 0.066927, 'pattern_02');
INSERT INTO inp_junction VALUES ('1053', 0.027873, 'pattern_02');
INSERT INTO inp_junction VALUES ('1030', 0.018236, 'pattern_02');
INSERT INTO inp_junction VALUES ('1017', 0.082382, 'pattern_02');
INSERT INTO inp_junction VALUES ('1018', 0.098709, 'pattern_02');
INSERT INTO inp_junction VALUES ('1019', 0.011455, 'pattern_02');
INSERT INTO inp_junction VALUES ('1032', 0.013855, 'pattern_02');
INSERT INTO inp_junction VALUES ('1008', 0.009109, 'pattern_02');
INSERT INTO inp_junction VALUES ('1011', 0.068255, 'pattern_02');
INSERT INTO inp_junction VALUES ('1043', 0.037255, 'pattern_02');
INSERT INTO inp_junction VALUES ('1046', 0.029673, 'pattern_02');
INSERT INTO inp_junction VALUES ('1047', 0.033945, 'pattern_02');
INSERT INTO inp_junction VALUES ('1055', 0.021018, 'pattern_02');
INSERT INTO inp_junction VALUES ('1069', 0.046345, 'pattern_02');
INSERT INTO inp_junction VALUES ('1016', 0.049782, 'pattern_02');
INSERT INTO inp_junction VALUES ('1031', 0.036091, 'pattern_02');
INSERT INTO inp_junction VALUES ('1042', 0.027945, 'pattern_02');
INSERT INTO inp_junction VALUES ('1007', 0.029709, 'pattern_02');
INSERT INTO inp_junction VALUES ('1035', 0.070782, 'pattern_02');
INSERT INTO inp_junction VALUES ('1038', 0.041073, 'pattern_02');
INSERT INTO inp_junction VALUES ('1041', 0.060909, 'pattern_02');
INSERT INTO inp_junction VALUES ('1028', 0.005745, 'pattern_02');
INSERT INTO inp_junction VALUES ('1020', 0.037873, 'pattern_02');
INSERT INTO inp_junction VALUES ('1013', 0.021455, 'pattern_02');
INSERT INTO inp_junction VALUES ('1026', 0.055527, 'pattern_02');
INSERT INTO inp_junction VALUES ('1071', 0.029873, 'pattern_02');
INSERT INTO inp_junction VALUES ('1075', 0.022673, 'pattern_02');
INSERT INTO inp_junction VALUES ('1065', 0.001327, 'pattern_02');
INSERT INTO inp_junction VALUES ('1064', 0.010018, 'pattern_02');
INSERT INTO inp_junction VALUES ('1066', 0.000564, 'pattern_02');
INSERT INTO inp_junction VALUES ('1033', 0.030164, 'pattern_02');
INSERT INTO inp_junction VALUES ('1048', 0.098673, 'pattern_02');
INSERT INTO inp_junction VALUES ('1072', 0.065382, 'pattern_02');
INSERT INTO inp_junction VALUES ('1045', 0.047891, 'pattern_02');
INSERT INTO inp_junction VALUES ('1029', 0.091691, 'pattern_02');
INSERT INTO inp_junction VALUES ('1034', 0.103345, 'pattern_02');
INSERT INTO inp_junction VALUES ('1023', 0.139855, 'pattern_02');
INSERT INTO inp_junction VALUES ('1027', 0.023273, 'pattern_02');
INSERT INTO inp_junction VALUES ('1024', 0.094200, 'pattern_02');
INSERT INTO inp_junction VALUES ('1050', 0.094764, 'pattern_02');
INSERT INTO inp_junction VALUES ('1074', 0.026891, 'pattern_02');
INSERT INTO inp_junction VALUES ('1070', 0.005491, 'pattern_02');
INSERT INTO inp_junction VALUES ('1036', 0.002582, 'pattern_02');
INSERT INTO inp_junction VALUES ('1052', 0.085764, 'pattern_02');
INSERT INTO inp_junction VALUES ('1005', 0.031890, 'pattern_02');
INSERT INTO inp_junction VALUES ('1022', 0.022455, 'pattern_02');
INSERT INTO inp_junction VALUES ('1103', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('1106', 0.075000, 'pattern_02');
INSERT INTO inp_junction VALUES ('1054', 16.000000, 'pattern_hydrant');
INSERT INTO inp_junction VALUES ('1009', 16.000000, 'pattern_hydrant');
INSERT INTO inp_junction VALUES ('138', 0.055501, 'pattern_02');
INSERT INTO inp_junction VALUES ('113959', 16.000000, 'pattern_hydrant');
INSERT INTO inp_junction VALUES ('113960', 16.000000, 'pattern_hydrant');
INSERT INTO inp_junction VALUES ('113961', 16.000000, 'pattern_03');
INSERT INTO inp_junction VALUES ('128', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('42', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('134', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('41', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('113873', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('113883', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('113880', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('131', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('113852', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('113908', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('113962', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('113963', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('113964', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('113967', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('113968', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('113969', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('113970', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('113971', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('113975', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('113976', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('113977', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('113978', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('113979', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('113980', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('113981', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('113982', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('113997', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('113998', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('113999', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('114001', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('114004', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('114015', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('114017', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('114018', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('114102', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('114108', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('114109', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('114110', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('114123', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('114128', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('114132', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('114227', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('114230', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('114233', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('114236', 0.030950, 'pattern_02');
INSERT INTO inp_junction VALUES ('113966', 0.016130, 'pattern_02');
INSERT INTO inp_junction VALUES ('113965', 0.031010, 'pattern_02');
INSERT INTO inp_junction VALUES ('113974', 0.035260, 'pattern_02');
INSERT INTO inp_junction VALUES ('114010', 0.003760, 'pattern_02');
INSERT INTO inp_junction VALUES ('114016', 0.009410, 'pattern_02');
INSERT INTO inp_junction VALUES ('113973', 0.003050, 'pattern_02');
INSERT INTO inp_junction VALUES ('114242', 0.009200, 'pattern_02');
INSERT INTO inp_junction VALUES ('114007', 0.005160, 'pattern_02');
INSERT INTO inp_junction VALUES ('114008', 0.005740, 'pattern_02');
INSERT INTO inp_junction VALUES ('114006', 0.005990, 'pattern_02');
INSERT INTO inp_junction VALUES ('114005', 0.005890, 'pattern_02');
INSERT INTO inp_junction VALUES ('114003', 0.019510, 'pattern_02');
INSERT INTO inp_junction VALUES ('114002', 0.043420, 'pattern_02');
INSERT INTO inp_junction VALUES ('114000', 0.049130, 'pattern_02');
INSERT INTO inp_junction VALUES ('114133', 0.048980, 'pattern_02');
INSERT INTO inp_junction VALUES ('114248', 0.066180, 'pattern_02');
INSERT INTO inp_junction VALUES ('114251', 0.040440, 'pattern_02');
INSERT INTO inp_junction VALUES ('113954', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('113955', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('113957', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('113958', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('113983', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('113984', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('113989', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('113991', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('113992', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('114107', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('113972', 0.005710, 'pattern_02');
INSERT INTO inp_junction VALUES ('114239', 0.001280, 'pattern_02');
INSERT INTO inp_junction VALUES ('113988', 0.004890, 'pattern_02');
INSERT INTO inp_junction VALUES ('113993', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('113994', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('114009', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('114013', 0.005070, 'pattern_02');
INSERT INTO inp_junction VALUES ('114012', 0.003600, 'pattern_02');
INSERT INTO inp_junction VALUES ('114014', 0.013450, 'pattern_02');
INSERT INTO inp_junction VALUES ('114011', 0.003750, 'pattern_02');
INSERT INTO inp_junction VALUES ('114245', 0.006550, 'pattern_02');
INSERT INTO inp_junction VALUES ('113987', 0.000000, 'pattern_02');
INSERT INTO inp_junction VALUES ('113986', 0.007170, 'pattern_02');
INSERT INTO inp_junction VALUES ('113996', 0.022890, 'pattern_02');
INSERT INTO inp_junction VALUES ('113990', 0.016440, 'pattern_02');
INSERT INTO inp_junction VALUES ('113995', 0.015210, 'pattern_02');
INSERT INTO inp_junction VALUES ('114223', 0.020040, 'pattern_02');
INSERT INTO inp_junction VALUES ('113985', 0.004090, 'pattern_02');




INSERT INTO inp_pipe VALUES ('2012', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2073', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2041', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2018', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2027', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2107', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2208', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2009', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2048', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2066', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2082', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2026', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2056', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2062', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2043', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2028', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2054', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2055', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2019', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2020', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2031', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2060', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2083', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2010', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2047', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2061', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2030', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2011', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2202', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2084', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2078', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('20651', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2007', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2071', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2087', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2067', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('20851', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('20861', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2005', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2065', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2086', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2006', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2064', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2040', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2034', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2070', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2096', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2025', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2039', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2207', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2038', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2004', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2042', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2017', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2014', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2003', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2080', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2106', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2105', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2037', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2032', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2023', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2001', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2002', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2063', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2072', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2024', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2008', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2059', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2081', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2015', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2089', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2022', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2104', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2021', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2093', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2016', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2052', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2013', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2092', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2103', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2053', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2045', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2076', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2097', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2213', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2074', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2215', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2216', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2214', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2217', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2219', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2218', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2085', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2102', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2046', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2220', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2095', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2088', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2098', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2099', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2094', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114460', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2205', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2100', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2068', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2101', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2069', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2035', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2108', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2051', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('2079', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('135', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('136', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('139', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('140', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('113875', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('113909', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('113910', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('113881', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('113884', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('130', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('129', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('132', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('133', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('113854', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('113857', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('113913', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('113921', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('113922', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('113935', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('113936', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114025', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114026', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114027', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114028', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114030', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114032', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114034', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114045', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114046', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114050', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114051', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114052', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114053', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114054', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114056', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114057', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114059', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114061', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114064', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114065', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114066', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114067', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114069', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114071', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114072', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114073', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114076', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114077', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114079', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114082', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114083', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114084', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114085', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114088', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114091', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114092', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114093', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114094', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114095', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114098', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114099', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114101', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114103', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114104', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114106', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114111', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114112', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114116', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114117', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114118', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114119', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114121', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114126', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114127', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114130', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114131', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114134', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114136', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114137', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114138', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114140', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114141', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114145', NULL, 'CLOSED', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114146', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114159', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114160', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114161', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114162', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114163', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114164', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114165', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114166', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114167', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114168', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114169', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114170', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114171', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114172', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114174', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114175', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114176', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114177', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114178', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114179', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114180', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114181', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114182', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114194', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114195', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114196', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114197', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114201', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114202', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114203', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114204', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114205', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114206', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114207', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114208', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114209', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114210', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114212', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114213', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114215', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114216', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114217', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114218', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114219', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114221', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114222', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114224', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114229', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114231', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114232', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114234', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114235', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114237', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114238', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114240', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114241', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114243', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114244', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114246', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114247', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114249', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114250', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114252', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114253', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114255', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('114256', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('113907', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('113905', NULL, 'OPEN', NULL, NULL);
INSERT INTO inp_pipe VALUES ('113906', NULL, 'OPEN', NULL, NULL);

INSERT INTO inp_pump VALUES ('1105', NULL, 'PUMP_02', NULL, NULL, 'CLOSED', 113881);
INSERT INTO inp_pump VALUES ('113951', NULL, 'PUMP_01', NULL, NULL, 'CLOSED', 114026);

INSERT INTO inp_pump_additional VALUES (1,'1105',1, NULL, 'PUMP_02', NULL, NULL, 'CLOSED');

INSERT INTO inp_reservoir VALUES (1097);
INSERT INTO inp_reservoir VALUES (1101);
INSERT INTO inp_reservoir VALUES (111111);


INSERT INTO inp_rules_x_node VALUES (1, '113766', 
'RULE 1
IF TANK 113766 LEVEL ABOVE 3
THEN PUMP 1105_n2a STATUS IS CLOSED'
, FALSE);

INSERT INTO inp_rules_x_node VALUES (2, '113766', 
'RULE 2
IF TANK 113766 LEVEL BELOW 0.75
THEN PUMP 1105_n2a STATUS IS OPEN'
, FALSE);


INSERT INTO inp_shortpipe VALUES ('1088', NULL, NULL, 'OPEN');
INSERT INTO inp_shortpipe VALUES ('1089', NULL, NULL, 'OPEN');
INSERT INTO inp_shortpipe VALUES ('1096', NULL, NULL, 'OPEN');
INSERT INTO inp_shortpipe VALUES ('1090', NULL, NULL, 'OPEN');
INSERT INTO inp_shortpipe VALUES ('1091', NULL, NULL, 'OPEN');
INSERT INTO inp_shortpipe VALUES ('1093', NULL, NULL, 'OPEN');
INSERT INTO inp_shortpipe VALUES ('1094', NULL, NULL, 'OPEN');
INSERT INTO inp_shortpipe VALUES ('1092', NULL, NULL, 'OPEN');
INSERT INTO inp_shortpipe VALUES ('1095', NULL, NULL, 'OPEN');
INSERT INTO inp_shortpipe VALUES ('1086', NULL, NULL, 'OPEN');
INSERT INTO inp_shortpipe VALUES ('1087', NULL, NULL, 'OPEN');
INSERT INTO inp_shortpipe VALUES ('1081', NULL, NULL, 'OPEN');
INSERT INTO inp_shortpipe VALUES ('1080', NULL, NULL, 'OPEN');
INSERT INTO inp_shortpipe VALUES ('1082', NULL, NULL, 'OPEN');
INSERT INTO inp_shortpipe VALUES ('1108', NULL, NULL, 'OPEN');
INSERT INTO inp_shortpipe VALUES ('1109', NULL, NULL, 'OPEN');
INSERT INTO inp_shortpipe VALUES ('1110', NULL, NULL, 'OPEN');
INSERT INTO inp_shortpipe VALUES ('1111', NULL, NULL, 'OPEN');
INSERT INTO inp_shortpipe VALUES ('1112', NULL, NULL, 'OPEN');
INSERT INTO inp_shortpipe VALUES ('1113', NULL, NULL, 'OPEN');
INSERT INTO inp_shortpipe VALUES ('1114', NULL, NULL, 'OPEN');
INSERT INTO inp_shortpipe VALUES ('1115', NULL, NULL, 'OPEN');
INSERT INTO inp_shortpipe VALUES ('113956', NULL, NULL, 'OPEN');
INSERT INTO inp_shortpipe VALUES ('114044', NULL, NULL, 'OPEN');
INSERT INTO inp_shortpipe VALUES ('114139', NULL, NULL, 'OPEN');
INSERT INTO inp_shortpipe VALUES ('114147', NULL, NULL, 'OPEN');
INSERT INTO inp_shortpipe VALUES ('114148', NULL, NULL, 'OPEN');
INSERT INTO inp_shortpipe VALUES ('114149', NULL, NULL, 'OPEN');
INSERT INTO inp_shortpipe VALUES ('114150', NULL, NULL, 'OPEN');
INSERT INTO inp_shortpipe VALUES ('114151', NULL, NULL, 'OPEN');
INSERT INTO inp_shortpipe VALUES ('114152', NULL, NULL, 'OPEN');
INSERT INTO inp_shortpipe VALUES ('114153', NULL, NULL, 'OPEN');
INSERT INTO inp_shortpipe VALUES ('114154', NULL, NULL, 'OPEN');
INSERT INTO inp_shortpipe VALUES ('114155', NULL, NULL, 'OPEN');
INSERT INTO inp_shortpipe VALUES ('114156', NULL, NULL, 'OPEN');
INSERT INTO inp_shortpipe VALUES ('114157', NULL, NULL, 'OPEN');
INSERT INTO inp_shortpipe VALUES ('114158', NULL, NULL, 'OPEN');
INSERT INTO inp_shortpipe VALUES ('114183', NULL, NULL, 'OPEN');
INSERT INTO inp_shortpipe VALUES ('114184', NULL, NULL, 'OPEN');
INSERT INTO inp_shortpipe VALUES ('114185', NULL, NULL, 'OPEN');
INSERT INTO inp_shortpipe VALUES ('114186', NULL, NULL, 'OPEN');
INSERT INTO inp_shortpipe VALUES ('114187', NULL, NULL, 'OPEN');
INSERT INTO inp_shortpipe VALUES ('114189', NULL, NULL, 'OPEN');
INSERT INTO inp_shortpipe VALUES ('114190', NULL, NULL, 'OPEN');
INSERT INTO inp_shortpipe VALUES ('114191', NULL, NULL, 'OPEN');
INSERT INTO inp_shortpipe VALUES ('114192', NULL, NULL, 'OPEN');
INSERT INTO inp_shortpipe VALUES ('114193', NULL, NULL, 'OPEN');
INSERT INTO inp_shortpipe VALUES ('114214', NULL, NULL, 'OPEN');
INSERT INTO inp_shortpipe VALUES ('114220', NULL, NULL, 'OPEN');
INSERT INTO inp_shortpipe VALUES ('114254', NULL, '114256', 'OPEN');

INSERT INTO inp_inlet VALUES ('113766', 1.0000, 0.0000, 3.5000, 12.0000, 0.0000, NULL, NULL, '113906');

INSERT INTO inp_valve VALUES (1083, 'PRV', 30.0000, NULL, NULL, NULL, NULL, NULL, 'ACTIVE', 2095);
INSERT INTO inp_valve VALUES (1107, 'FCV', NULL, NULL, 3.0000, NULL, NULL, NULL, 'ACTIVE', 113884);

