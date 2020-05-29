/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/

SET search_path = "SCHEMA_NAME", public, pg_catalog;

INSERT INTO plan_price_cat VALUES ('PRICES DB-2018');

INSERT INTO plan_price VALUES ('S_EXC', 'm3', 'Excavation of trench up to 2 m in width and up to 4 m in depth', 'Excavation of trench up to 2 m in width and up to 4 m in depth, in compact terrain, with excavator shovel and load mechanics of excavated material', 9.0324, NULL);
INSERT INTO plan_price VALUES ('S_NULL', 'm3', 'Filling pipe material', 'Filling pipe material', 0.0000, NULL);
INSERT INTO plan_price VALUES ('S_TRENCH', 'm3', 'Trenchlining of excavation', 'Trenchlining of excavation', 30.0000, NULL);
INSERT INTO plan_price VALUES ('S_REB', 'm3', 'Reversing and trenching of width ditch more than 1.5 and up to 2 m', 'Reversing and trenching of width ditch more than 1.5 and up to 2 m, with selected material, in tongades of thickness up to 25 cm, using vibratory roller to compact, with 95% PM compaction', 8.9241, NULL);
INSERT INTO plan_price VALUES ('S_REP', 'm2', 'Revision and trenching of dense soil of more than 0.6 and less than 1.5 m in width', 'Revision and trenching of dense soil of more than 0.6 and less than 1.5 m in width, with 90% PM compaction', 2.5708, NULL);
INSERT INTO plan_price VALUES ('SECURITY_HEALTH', 'pa', 'Health and safety of works', 'Plan for the implementation of health and safety throughout the works according to the program and instructions of project management.', 0.3000, NULL);
INSERT INTO plan_price VALUES ('PROTEC_SERVIS', 'pa', 'Protection of extsting services', 'Location and protection of all existing services that may be affected by the works.', 0.5000, NULL);
INSERT INTO plan_price VALUES ('P_SLAB-4P', 'm2', 'Slab pavement 20x20x4 cm', 'Slab pavement 20x20x4 cm, 1st class, higher price, with sand support of 3cm, hammered on mixed mortar 1:0.5:4, made on site with cement mix 165 and concrete.', NULL, NULL);
INSERT INTO plan_price VALUES ('P_CONCRETE-20', 'm2', 'Concrete pavement HM-30/P/20/I+E, 20cm thick', 'Concrete pavement HM-30/P/20/I+E, 20cm thick, scattered from the truck, and extended vibratge mechanic, mechanical swirling, including the base of artificial ballast to 95% of PM.', NULL, NULL);
INSERT INTO plan_price VALUES ('A_FC63_PN10', 'm', 'Polyethylene tube designation PE 100, of 63 mm nominal diameter, 10 bar of nominal pressure', 'Polyethylene tube designation PE 100, of 63 mm nominal diameter, 10 bar of nominal pressure, series SDR 17, UNE-EN 12201-2, welded and placed at the bottom of the ditch', 12.0700, NULL);
INSERT INTO plan_price VALUES ('A_FD150', 'm', 'Ductile cast iron tube, DN = 150mm, bell-shaped joint with water', 'Ductile cast iron tube with a nominal internal diameter of 150 mm, according to ISO 2531, a hood joint with elastomeric ring for water and watertight contrabrity and placed at the bottom of the ditch', 36.5100, NULL);
INSERT INTO plan_price VALUES ('A_PVC110_PN16', 'm', 'PVC tube of 110 mm of nominal external diameter, of 16 bar of nominal pressure', 'PVC tube of 110 mm of nominal external diameter, of 16 bar of nominal pressure, elastic union with elastomeric ring of watertight, according to the norm UNE-EN 1452-2 and placed at the bottom of the ditch', 19.4300, NULL);
INSERT INTO plan_price VALUES ('A_PVC200_PN16', 'm', 'PVC tube of 200 mm of nominal external diameter, of 16 bar of nominal pressure', 'PVC tube of 200 mm of nominal external diameter, of 16 bar of nominal pressure, elastic union with elastomeric ring of watertight, according to the norm UNE-EN 1452-2 and placed at the bottom of the ditch', 35.1000, NULL);
INSERT INTO plan_price VALUES ('A_PVC160_PN16', 'm', 'PVC tube of 160 mm of nominal external diameter, of 16 bar of nominal pressure', 'PVC tube of 160 mm of nominal external diameter, of 16 bar of nominal pressure, elastic union with elastomeric ring of watertight, according to the norm UNE-EN 1452-2 and placed at the bottom of the ditch', 27.6400, NULL);
INSERT INTO plan_price VALUES ('N_T63-63_PN16', 'u', 'PVC dervation of DN 63mm, nominal pressure of 16bar, 90° branches of 63mm', 'PVC dervation of DN 63mm, nominal pressure of 16bar , with two elastic unions with elastometric ring, 90° branches of 63mm;placed on the bottom trench.', 28.0000, NULL);
INSERT INTO plan_price VALUES ('A_FD200', 'm', 'Ductile cast iron tube, DN = 200mm, bell-shaped joint with water', 'Ductile cast iron tube with a nominal internal diameter of 150 mm, according to ISO 2531, a hood joint with elastomeric ring for water and watertight contrabrity and placed at the bottom of the ditch', 47.6700, NULL);
INSERT INTO plan_price VALUES ('N_TANK_30x10x3', 'u', 'Construction of potable water tank of dimensions 30x10x3m.', 'Construction of potable water tank of dimensions 30x10x3m.', NULL, NULL);
INSERT INTO plan_price VALUES ('N_FLOWMETER200', 'u', 'Flow meter with connections with 200 mm diameter', 'Flow meter designation G400 according to UNE 60510 with 200 mm diameter bundled connections, of 2500 m3 / h (n), at most, of turbine and mounted between tubes', 13639.3300, NULL);
INSERT INTO plan_price VALUES ('N_PUMP-01', 'u', 'Pressure group for installations against fires of maximum flow rate 50 m3/h', 'Pressure group for installations against fires of maximum flow rate 50 m3 / h, minimum pressure of 5 bar and maximum 6 bar with 1 service pump and 1 pump jockey and mounted on bench', 4210.7800, NULL);
INSERT INTO plan_price VALUES ('N_GREVAL110_PN16', 'u', 'Iron irigation head, with hose fitting diameter of 110mm', 'Iron irigation head, with hose fitting diameter of 110mm', 190.3600, NULL);
INSERT INTO plan_price VALUES ('N_AIRVAL_DN50', 'u', 'Embossed air valve of 50 mm DN, 16 bar of test pressure', 'Embossed air valve of 50 mm DN, 16 bar of test pressure, smelting, high price and mounted in a buried channeling', 192.4000, NULL);
INSERT INTO plan_price VALUES ('N_SOURCE-01', 'u', 'Hydraulic structure intended to derive water', 'Hydraulic structure intended to derive water', 141.0200, NULL);
INSERT INTO plan_price VALUES ('N_T63-63-110', 'u', 'PVC dervation of DN 63mm, nominal pressure of 16bar, 90° branches of 63 and 110mm', 'PVC dervation of DN 63mm, nominal pressure of 16bar , with two elastic unions with elastometric ring, 90° branches of 63 and 110mm;placed on the bottom trench.', 33.0000, NULL);
INSERT INTO plan_price VALUES ('N_GREVAL50_PN16', 'u', 'Iron irigation head, with hose fitting diameter of 50mm', 'Iron irigation head, with hose fitting diameter of 50mm', 120.4500, NULL);
INSERT INTO plan_price VALUES ('N_GREVAL63_PN16', 'u', 'Iron irigation head, with hose fitting diameter of 63mm', 'Iron irigation head, with hose fitting diameter of 63mm', 145.5400, NULL);
INSERT INTO plan_price VALUES ('N_OUTVAL-01', 'u', 'Iron automatic outfall valve, with diameter nominal of 150mm', 'Iron automatic outfall valve, with diameter nominal of 150mm, placed on the pipe, with unions and accessories included fully installed.', 340.6300, NULL);
INSERT INTO plan_price VALUES ('N_SHTVAL160_PN16', 'u', 'Manual shutoff valve  with thread of nominal diameter 160mm, nominal pressure 16 bar', 'Manual shutoff valve with thread of nominal diameter 160mm, nominal pressure 16 bar, with iron nodular body cast EN-GJS-500-7 (GGG50) and nodular iron cover EN-GJS-500-7 (GGG50) with epoxy resin coating (250 micres), iron leads+EPDM and elastic closure seatclosing, stainless steel shaft 1.4021 (AISI 420), with iron steering wheel mounted on the surface.', 120.3200, NULL);
INSERT INTO plan_price VALUES ('N_SHTVAL63_PN16', 'u', 'Manual shutoff valve  with thread of nominal diameter 63mm, nominal pressure 16 bar', 'Manual shutoff valve with thread of nominal diameter 63mm, nominal pressure 16 bar, with iron nodular body cast EN-GJS-500-7 (GGG50) and nodular iron cover EN-GJS-500-7 (GGG50) with epoxy resin coating (250 micres), iron leads+EPDM and elastic closure seatclosing, stainless steel shaft 1.4021 (AISI 420), with iron steering wheel mounted on the surface.', 75.3200, NULL);
INSERT INTO plan_price VALUES ('N_PRESME110_PN16', 'u', 'Glycerin manometer DN-100 mm with key of passage', 'Glycerin manometer DN-100 mm with key of passage, including unions, auxiliary elements and necessary accessories for its operation, mounted in the pipe and tested', 144.5300, NULL);
INSERT INTO plan_price VALUES ('N_PRESME200_PN16', 'u', 'Glycerine manometer DN-200mm, with stopcock', 'Glycerine manometer DN-200mm, with stopcock, including unions, auxiliary elements and accessories necessary for the operation, mounted on the pipe.', 249.3600, NULL);
INSERT INTO plan_price VALUES ('A_FC110_PN10', 'm', 'Polyethylene tube designation PE 100, of 110 mm nominal diameter, 10 bar of nominal pressure', 'Polyethylene tube designation PE 100, of 110 mm nominal diameter, 10 bar of nominal pressure, series SDR 17, UNE-EN 12201-2, welded and placed at the bottom of the ditch', 20.0900, NULL);
INSERT INTO plan_price VALUES ('A_FC160_PN10', 'm', 'Polyethylene tube designation PE 100, of 160 mm nominal diameter, 10 bar of nominal pressure', 'Polyethylene tube designation PE 100, of 160 mm nominal diameter, 10 bar of nominal pressure, series SDR 17, UNE-EN 12201-2, welded and placed at the bottom of the ditch', 31.7400, NULL);
INSERT INTO plan_price VALUES ('A_PEHD110_PN16', 'm', 'Polyethylene tube designation PE 100, of 110 mm nominal diameter, 16 bar of nominal pressure', 'Polyethylene tube designation PE 100, of 110 mm nominal diameter, 16 bar of nominal pressure, series SDR 11, UNE-EN 12201-2, welded and placed at the bottom of the ditch', 22.4400, NULL);
INSERT INTO plan_price VALUES ('N_WATERWELL-01', 'u', 'Fully equipied construction of waterwell ', 'Fully equipied construction of waterwell ', 6000.0000, NULL);
INSERT INTO plan_price VALUES ('N_CHKVAL100_PN10', 'u', 'Check valve with tilting disc check, with diameter nominal 100mm, nominal pressure of 10 bar', 'Check valve with tilting disc check, according to UNE-EN 12334, with flanges, with diameter nominal 100mm, nominal pressure of 10 bar, iron nodular body cast EN-GJS-400-15 (GGG40) and epoxy resin coating (200 micres), iron nodular tilting discs EN-GJS-400-15 (GGG40), elastic closure seatclosing, mounted in a mini manhole. ', 184.2100, NULL);
INSERT INTO price_compost VALUES ('N_CHKVAL200_PN10', 'u', 'Check valve with flanges, of 200 mm in nominal diameter, of 10 bar of nominal pressure', 'Check valve according to UNE-EN 12334 standard, with flanges, of 200 mm in nominal diameter, of 10 bar of nominal pressure, nodular cast iron body EN-GJS-400-15 (GGG40) with coating of epoxy resin (200 microns) , nodular cast iron cladding EN-GJS-400-15 (GGG40), elastic seating closure, mounted a buried pipe', 556.9300, NULL);
INSERT INTO price_compost VALUES ('N_CHKVAL300_PN10', 'u', 'Check valve with flanges, of 300 mm in nominal diameter, of 10 bar of nominal pressure', 'Check valve according to UNE-EN 12334 standard, with flanges, of 300 mm in nominal diameter, of 10 bar of nominal pressure, nodular cast iron body EN-GJS-400-15 (GGG40) with coating of epoxy resin (200 microns) , nodular cast iron cladding EN-GJS-400-15 (GGG40), elastic seating closure, mounted a buried pipe', 998.4800, NULL);
INSERT INTO price_compost VALUES ('N_CHKVAL63_PN10', 'u', 'Check valve with tilting disc check, with diameter nominal 63mm, nominal pressure of 10 bar', 'Check valve with tilting disc check, according to UNE-EN 12334, with flanges, with diameter nominal 63mm, nominal pressure of 10 bar, iron nodular body cast EN-GJS-400-15 (GGG40) and epoxy resin coating (200 micres), iron nodular tilting discs EN-GJS-400-15 (GGG40), elastic closure seatclosing, mounted in a mini manhole. ', 95.3500, NULL);
INSERT INTO price_compost VALUES ('N_PRVAL100_6/16', 'u', 'Pressure reduction valve with flanges, 100 mm DN with a maximum pressure of 16 bar', 'Pressure reduction valve with flanges, 100 mm DN with a maximum pressure of 16 bar and a maximum differential of 15 bar, of bronze, high price and mounted in a bureid pipe', 4417.4800, NULL);
INSERT INTO price_compost VALUES ('N_PRVAL150_6/16', 'u', 'Pressure reduction valve with flanges, 150 mm DN with a maximum pressure of 16 bar', 'Pressure reduction valve with flanges, 150 mm DN with a maximum pressure of 16 bar and a maximum differential of 15 bar, of bronze, high price and mounted in a bureid pipe', 6134.3200, NULL);
INSERT INTO price_compost VALUES ('N_PRVAL200_6/16', 'u', 'Pressure reduction valve with flanges, 200 mm DN with a maximum pressure of 16 bar', 'Pressure reduction valve with flanges, 200 mm DN with a maximum pressure of 16 bar and a maximum differential of 15 bar, of bronze, high price and mounted in a bureid pipe', 7769.2900, NULL);
INSERT INTO price_compost VALUES ('N_HYD_1x100', 'u', 'Buried hydrant, with an output of 100 mm', 'Buried hydrant, with an output of 100 mm in diameter and 4" in diameter of connection to the pipe, mounted outside', 501.5200, NULL);
INSERT INTO price_compost VALUES ('N_FILTER-01', 'u', 'Filter strainer with Y-shaped flanges, nominal diameter of 200mm', 'Filter strainer with Y-shaped flanges, nominal diameter of 200mm, nominal pressure of 16bar, gray cast iron EN-GJL-250 (GG25), mesh stainless steel 1.4301 (AISI 304) with perforations of diameter 1,5mm, mounted in a mini manhole.', 1114.2600, NULL);
INSERT INTO price_compost VALUES ('N_FLOWMETER110', 'u', 'Flow meter with connections with 100 mm diameter', 'Flow meter,designation G400 according to UNE 60510 with 100 mm diameter bundled connections, of 650 m3 / h (n), at most, of turbine and mounted between tubes', 2278.7700, NULL);
INSERT INTO price_compost VALUES ('N_JUN160', 'u', '160 mm DN cast iron connection sleeve with 2 bell unions', '160 mm DN cast iron connection sleeve with 2 bell unions with elastomeric ring for water and watertight contrabrity and placed at the bottom of the ditch', 186.0000, NULL);
INSERT INTO price_compost VALUES ('N_JUN200', 'u', '200 mm DN cast iron connection sleeve with 2 bell unions', '200 mm DN cast iron connection sleeve with 2 bell unions with elastomeric ring for water and watertight contrabrity and placed at the bottom of the ditch', 235.3200, NULL);
INSERT INTO price_compost VALUES ('N_JUN63', 'u', '63 mm DN cast iron connection sleeve with 2 bell unions', '63 mm DN cast iron connection sleeve with 2 bell unions with elastomeric ring for water and watertight contrabrity and placed at the bottom of the ditch', 103.0900, NULL);
INSERT INTO price_compost VALUES ('N_JUN110', 'u', '110 mm DN cast iron connection sleeve with 2 bell unions', '110 mm DN cast iron connection sleeve with 2 bell unions with elastomeric ring for water and watertight contrabrity and placed at the bottom of the ditch', 103.0900, NULL);
INSERT INTO price_compost VALUES ('N_ENDLINE', 'u', 'Cavity plug', 'Cavity plug', 92.5600, NULL);
INSERT INTO price_compost VALUES ('N_HYD_1x110-2x63', 'u', 'Hydrant with output diameter of 110 and 63mm.', 'Hydrant buried with mini manhole, with output diameter of 100 and 63mm and diameter of pipe connection of 4", placed on the outside.', 689.3400, NULL);
INSERT INTO price_compost VALUES ('P_ASPHALT-10', 'm2', 'Pavement of continuous hot bituminous mix 10cm thick', 'Pavement of continuous hot bituminous mix 10cm thick (6+4), including the base of artificial ballast to 95% of PM, primer and adhesion.', NULL, NULL);
INSERT INTO price_compost VALUES ('N_CHKVAL150_PN10', 'u', 'Check valve with tilting disc check, with diameter nominal 150mm, nominal pressure of 10 bar', 'Check valve with tilting disc check, according to UNE-EN 12334, with flanges, with diameter nominal 150mm, nominal pressure of 10 bar, iron nodular body cast EN-GJS-400-15 (GGG40) and epoxy resin coating (200 micres), iron nodular tilting discs EN-GJS-400-15 (GGG40), elastic closure seatclosing, mounted in a mini manhole. ', 312.5200, NULL);
INSERT INTO price_compost VALUES ('N_T160-110_PN16', 'u', 'Druid derivation of 160 mm DN with two bell unions. Embedded 110mm', 'Druid derivation of 160 mm DN with two bell unions and elastomeric ring of watertightness and sealing contrabrity, 90 ° branch, 110 mm DN gusset and placed at the bottom of the ditch', 209.0800, NULL);
INSERT INTO price_compost VALUES ('N_T160-110-63', 'u', 'FD derivation of DN 160 mm with 90° branches of 110 and 63mm', 'Ductile iron derivation of DN 160 mm with two bell shaped unions with an elastomeric ring for water and counter flange,90° branches of 110 and 63mm; placed on the bottom trench.', 201.0000, NULL);
INSERT INTO price_compost VALUES ('N_T160-160_PN16', 'u', 'Druid derivation of 160 mm DN with two bell unions. Embedded 160mm', 'Druid derivation of 160 mm DN with two bell unions and elastomeric ring of watertightness and sealing contrabrity, 90 ° branch, 160 mm DN gusset and placed at the bottom of the ditch', 210.6700, NULL);
INSERT INTO price_compost VALUES ('N_T160-63_PN16', 'u', 'Druid derivation of 160 mm DN with two bell unions. Embedded 63mm', 'Druid derivation of 160 mm DN with two bell unions and elastomeric ring of watertightness and sealing contrabrity, 90 ° branch, 63 mm DN gusset and placed at the bottom of the ditch', 204.3400, NULL);
INSERT INTO price_compost VALUES ('N_T200-160_PN16', 'u', 'Druid derivation of 200 mm DN with two bell unions. Embedded 160mm', 'Druid derivation of 200 mm DN with two bell unions and elastomeric ring of watertightness and sealing contrabrity, 90 ° branch, 160 mm DN gusset and placed at the bottom of the ditch', 260.3000, NULL);
INSERT INTO price_compost VALUES ('N_T110-110_PN16', 'u', 'Druid derivation of 110 mm DN with two bell unions', 'Druid derivation of 110 mm DN with two bell unions and elastomeric ring of watertightness and sealing contrabrity, 90 ° branch, 110 mm DN gusset and placed at the bottom of the ditch', 156.0200, NULL);
INSERT INTO price_compost VALUES ('N_T110-63_PN16', 'u', 'PVC derivation DN110mm, 90° branches of 63mm', 'PVC dervation of DN 110mm, nominal pressure of 16bar , with two elastic unions with elastometric ring, 90° branches of 63mm;placed on the bottom trench.', 35.0000, NULL);
INSERT INTO price_compost VALUES ('A_PVC63_PN10', 'm', 'PVC tube of 63 mm of nominal external diameter, of 16 bar of nominal pressure', 'PVC tube of 63 mm of nominal external diameter, of 16 bar of nominal pressure, elastic union with elastomeric ring of watertight, according to the norm UNE-EN 1452-2 and placed at the bottom of the ditch', 12.2100, NULL);
INSERT INTO price_compost VALUES ('N_FLEXUNION', 'u', 'Flexunion, nominal pressure of 10 bar', 'Flexunion, nominal pressure of 10 bar', 15.5000, NULL);
INSERT INTO price_compost VALUES ('N_REDUC_110-90', 'u', 'Iron reduction form 110mm to 90mm, nominal pressure of 16 bar', 'Iron reduction form 110mm to 90mm, nominal pressure of 16 bar', 125.1500, NULL);
INSERT INTO price_compost VALUES ('N_REDUC_110-63', 'u', 'Iron reduction form 110mm to 90mm, nominal pressure of 16 bar', 'Iron reduction form 110mm to 63mm, nominal pressure of 16 bar', 125.1500, NULL);
INSERT INTO price_compost VALUES ('N_REDUC_200-110', 'u', 'Iron reduction form 200mm to 110mm, nominal pressure of 16 bar', 'Iron reduction form 200mm to 110mm, nominal pressure of 16 bar', 188.3100, NULL);
INSERT INTO price_compost VALUES ('N_REDUC_160-110', 'u', 'Iron reduction form 180mm to 110mm, nominal pressure of 16 bar', 'Iron reduction form 160mm to 110mm, nominal pressure of 16 bar', 125.1500, NULL);
INSERT INTO price_compost VALUES ('N_JUNCT_CHNGMAT', 'u', 'Change of material', 'Change of material', 100.0000, NULL);
INSERT INTO price_compost VALUES ('N_REDUC_160-90', 'u', 'Iron reduction form 160mm to 90mm, nominal pressure of 16 bar', 'Iron reduction form 160mm to 90mm, nominal pressure of 16 bar', 198.5000, NULL);
INSERT INTO price_compost VALUES ('N_REGISTER', 'u', 'Register of 57x57x90cm, of brick and interior batter, with frame and cover of 60x60x5cm of ductile i', 'Register of 57x57x90cm, of brick and interior batter, with frame and cover of 60x60x5cm of ductile i', 155.5000, NULL);
INSERT INTO price_compost VALUES ('N_WATER-CONNECT', 'u', 'Connection point of connec', 'Connection point of connec', 135.5000, NULL);
INSERT INTO price_compost VALUES ('N_XDN110_PN16', 'u', 'Derivation on T, with diameter nominal 110mm, nominal pressure of 16 bar', 'Derivation on T, with diameter nominal 110mm, nominal pressure of 16 bar', 90.9500, NULL);
INSERT INTO price_compost VALUES ('N_XDN110-90_PN16', 'u', 'Derivation on T, with diameter nominal 110mm and 90mm, nominal pressure of 16 bar', 'Derivation on T, with diameter nominal 110mm and 90mm, nominal pressure of 16 bar', 85.3000, NULL);
INSERT INTO price_compost VALUES ('A_PVC25_PN10', 'm', 'PVC sewer pipe with nominal exterior diameter of 25mm, nominal pressure of 10 bar', 'PVC sewer pipe with nominal exterior diameter of 25mm, nominal pressure of 10 bar', 8.1500, NULL);
INSERT INTO price_compost VALUES ('A_PVC32_PN10', 'm', 'PVC sewer pipe with nominal exterior diameter of 32mm, nominal pressure of 10 bar', 'PVC sewer pipe with nominal exterior diameter of 32mm, nominal pressure of 10 bar', 8.9500, NULL);
INSERT INTO price_compost VALUES ('A_PVC50_PN10', 'm', 'PVC sewer pipe with nominal exterior diameter of 50mm, nominal pressure of 10 bar', 'PVC sewer pipe with nominal exterior diameter of 50mm, nominal pressure of 10 bar', 11.4300, NULL);
INSERT INTO price_compost VALUES ('N_EXPANTANK', 'u', 'Expansion tank ', 'Expansion tank ', 3950.0000, NULL);
INSERT INTO price_compost VALUES ('N_NETSAMPLEP', 'u', 'Network sampling point', 'Network sampling point', 0.0000, NULL);
INSERT INTO price_compost VALUES ('N_NETELEMENT', 'u', 'Network element', 'Network element', 0.0000, NULL);
INSERT INTO price_compost VALUES ('N_ETAP', 'u', 'Water treatment plant', 'Water treatment plant', 1950000.0000, NULL);
INSERT INTO price_compost VALUES ('F9H118E1', 't', 'Continuous bituminous mixing flooring type AC 22 surf BC50 / 70 S (S-20)', 'Continuous bituminous mixing flooring type AC 22 surf BC50 / 70 S (S-20)', 57.3861, NULL);
INSERT INTO price_compost VALUES ('S_TRANS', 'm3', 'Transport of waste to authorized waste management facility, with 12 t truck and waiting time for loa', 'Transport of waste to authorized waste management facility, with 12 t truck and waiting time for loading, with a route of more than 15 and up to 20 km', 8.1164, NULL);
INSERT INTO price_compost VALUES ('F931201F', 'm3', 'Base of artificial gravels, with extended and compacted material at 95% of the PM', 'Base of artificial gravels, with extended and compacted material at 95% of the PM', 29.2250, NULL);
INSERT INTO price_compost VALUES ('F9G1A732', 'm3', 'Concrete flooring without additives HA-30/P/20/IIIa + E of plastic consistency', 'Concrete flooring without additives HA-30/P/20/IIIa + E of plastic consistency, maximum size of aggregate, 20 mm, scattered from truck, manual extended and vibration, riveted finish', 105.6413, NULL);
INSERT INTO price_compost VALUES ('F9E1311N', 'm2', 'Tile pavement for gray sidewalk of 20x20x4 cm on support of 3 cm of sand', 'Tile pavement for gray sidewalk of 20x20x4 cm, first class, top price, on support of 3 cm of sand, made in the work with concrete mixer of 165 l and portland cement', 35.3418, NULL);
INSERT INTO price_compost VALUES ('F9J12X40', 'm2', 'Primer irrigation with specific cationic bituminous emulsion for irrigation of priming', 'Primer irrigation with specific cationic bituminous emulsion for irrigation of priming, ECI type, with a provision of 1 kg / m2', 0.5221, NULL);
INSERT INTO price_compost VALUES ('F9H11251', 't', 'Continuous bituminous mixing pavement type AC 16 surf B50 / 70 D (D-12)', 'Continuous bituminous mixing pavement type AC 16 surf B50 / 70 D (D-12), with asphalt penetration bitumen, dense granulometry for tread and granite granulate, extended and compacted', 55.8791, NULL);
INSERT INTO price_compost VALUES ('F9J13Y40', 'm2', 'Adhesive irrigation with modified bituminous emulsion with fast cationic polymer', 'Adhesive irrigation with modified bituminous emulsion with fast cationic polymers, ECR-1d-m type, with a 1 kg / m2', 0.4334, NULL);
INSERT INTO price_compost VALUES ('N_SHTVAL110_PN16', 'u', 'Manual shutoff valve  with thread of nominal diameter 110mm, nominal pressure 16 bar', 'Manual shutoff valve with thread of nominal diameter 110mm, nominal pressure 16 bar, with iron nodular body cast EN-GJS-500-7 (GGG50) and nodular iron cover EN-GJS-500-7 (GGG50) with epoxy resin coating (250 micres), iron leads+EPDM and elastic closure seatclosing, stainless steel shaft 1.4021 (AISI 420), with iron steering wheel mounted on the surface.', 98.4100, NULL);
INSERT INTO price_compost VALUES ('F9265C51', 'm3', 'Concret base of HM-20/B/10/ I, soft consistency with mechanical interior transport', 'Concret base of HM-20/B/10/I, of soft consistency and maximum size of 10 mm granulate, with mechanical interior transport with manual extension and vibration, with a rusty finish', 87.0445, NULL);
INSERT INTO price_compost VALUES ('A_PELD110_PN10', 'm', 'Polyethylene pipe, with nominal diameter of 110mm, nominal pressure 10bar', 'Polyethylene pipe ,designation PE 100, with nominal diameter of 110mm, nominal pressure 10bar, series SDR 17, UNE-EN 12201-2, welded and placed on trench bottom.', 20.0900, NULL);
INSERT INTO price_compost VALUES ('A_PVC90_PN16', 'm', 'PVC sewer pipe with nominal exterior diameter of 90mm, nominal pressure of 16 bar', 'PVC sewer pipe with nominal exterior diameter of 90mm, nominal pressure of 16 bar, with elastic join and elastomeric ring, according to the UNE-EN 1452-2; placed on the bottom trench.', 16.9000, NULL);
INSERT INTO price_compost VALUES ('N_CUR30_PVC110', 'u', 'Connection of DN 110mm, on the 30° angle', 'Connection of DN 110mm, on the 30° angle,  with 2 bell unions with with an elastomeric ring for water and counter flange,placed on the trench bottom.', 103.0900, NULL);
INSERT INTO price_compost VALUES ('N_CUR45_PVC110', 'u', 'Connection of DN 110mm, on the 45° angle', 'Connection of DN 110mm, on the 45° angle,  with 2 bell unions with with an elastomeric ring for water and counter flange,placed on the trench bottom.', 103.0900, NULL);
INSERT INTO price_compost VALUES ('VIRTUAL_U', 'u', 'Null price for unitary virtual elements', 'Null price for unitary virtual elements', 0, NULL);
INSERT INTO price_compost VALUES ('VIRTUAL_M', 'm', 'Null price for  m virtual elements', 'Null price for m virtual elements', 0, NULL);
INSERT INTO price_compost VALUES ('VIRTUAL_M2', 'm2', 'Null price for m2 virtual elements', 'Null price for m2 virtual elements', 0, NULL);
INSERT INTO price_compost VALUES ('VIRTUAL_M3', 'm3', 'Null price for m3 virtual elements', 'Null price for m3 virtual elements', 0, NULL);




INSERT INTO price_compost_value VALUES (1, 'P_CONCRETE-20', 'F931201F', 0.2000);
INSERT INTO price_compost_value VALUES (2, 'P_CONCRETE-20', 'F9G1A732', 0.2000);
INSERT INTO price_compost_value VALUES (3, 'P_ASPHALT-10', 'F931201F', 0.2500);
INSERT INTO price_compost_value VALUES (4, 'P_ASPHALT-10', 'F9H118E1', 0.1440);
INSERT INTO price_compost_value VALUES (5, 'P_ASPHALT-10', 'F9H11251', 0.0960);
INSERT INTO price_compost_value VALUES (6, 'P_ASPHALT-10', 'F9J12X40', 1.0000);
INSERT INTO price_compost_value VALUES (7, 'P_ASPHALT-10', 'F9J13Y40', 1.0000);
INSERT INTO price_compost_value VALUES (8, 'P_SLAB-4P', 'F9E1311N', 1.0000);
INSERT INTO price_compost_value VALUES (9, 'P_SLAB-4P', 'F9265C51', 0.1000);


