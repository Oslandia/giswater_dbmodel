/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/


SET search_path = "SCHEMA_NAME", public, pg_catalog;

INSERT INTO cat_dwf_scenario VALUES (1, 'scenario1', '2017-01-01', '2017-12-31');

UPDATE inp_dwf SET dwfscenario_id=1;


INSERT INTO cat_users VALUES (1,'user1');
INSERT INTO cat_users VALUES (2,'user2');
INSERT INTO cat_users VALUES (3,'user3');
INSERT INTO cat_users VALUES (4,'user4');


UPDATE plan_arc_x_pavement SET pavcat_id = 'Asphalt';
	
TRUNCATE plan_psector_x_arc;
INSERT INTO plan_psector_x_arc VALUES (1, '20603', 1, 1, true, NULL);
INSERT INTO plan_psector_x_arc VALUES (2, '20604', 1, 1, true, NULL);
INSERT INTO plan_psector_x_arc VALUES (3, '20605', 1, 1, true, NULL);
INSERT INTO plan_psector_x_arc VALUES (5, '20602', 1, 1, true, NULL);
INSERT INTO plan_psector_x_arc VALUES (6, '20606', 1, 1, true, NULL);
INSERT INTO plan_psector_x_arc VALUES (4, '252', 2, 1, true, NULL);
INSERT INTO plan_psector_x_arc VALUES (7, '251', 2, 1, true, NULL);
INSERT INTO plan_psector_x_arc VALUES (8, '20608', 2, 0, false, NULL);
INSERT INTO plan_psector_x_arc VALUES (9, '157', 2, 0, false, NULL);
INSERT INTO plan_psector_x_arc VALUES (10, '177', 1, 0, false, NULL);
INSERT INTO plan_psector_x_arc VALUES (11, '178', 1, 0, false, NULL);
INSERT INTO plan_psector_x_arc VALUES (13, '179', 1, 0, false, NULL);
INSERT INTO plan_psector_x_arc VALUES (12, '339', 1, 0, false, NULL);



TRUNCATE plan_psector_x_node;
INSERT INTO plan_psector_x_node (id, node_id, psector_id, state, doable, descript) VALUES (1, '20599', 1, 1, true, NULL);
INSERT INTO plan_psector_x_node (id, node_id, psector_id, state, doable, descript) VALUES (2, '20596', 1, 1, true, NULL);
INSERT INTO plan_psector_x_node (id, node_id, psector_id, state, doable, descript) VALUES (3, '20597', 1, 1, true, NULL);
INSERT INTO plan_psector_x_node (id, node_id, psector_id, state, doable, descript) VALUES (4, '20598', 1, 1, true, NULL);
INSERT INTO plan_psector_x_node (id, node_id, psector_id, state, doable, descript) VALUES (7, '94', 1, 0, false, NULL);
INSERT INTO plan_psector_x_node (id, node_id, psector_id, state, doable, descript) VALUES (6, '92', 1, 0, false, NULL);
INSERT INTO plan_psector_x_node (id, node_id, psector_id, state, doable, descript) VALUES (5, '91', 1, 0, false, NULL);
	
TRUNCATE plan_psector_x_connec;
INSERT INTO plan_psector_x_connec (connec_id, arc_id, psector_id, state, doable, descript, link_geom, vnode_geom) VALUES ('3029', NULL, 2, 0, false, NULL, NULL, NULL);
INSERT INTO plan_psector_x_connec (connec_id, arc_id, psector_id, state, doable, descript, link_geom, vnode_geom) VALUES ('100018', '251', 2, 1, true, NULL, '0102000020E76400000200000002A4D88FD6931941A9D45FDE6A755141736891EDB39319413333334363755141', '0101000020E7640000736891EDB39319413333334363755141');

INSERT INTO plan_psector_x_gully (gully_id, arc_id, psector_id, state, doable, descript, link_geom, vnode_geom) VALUES ('30110', NULL, 2, 0, false, NULL, NULL, NULL);
INSERT INTO plan_psector_x_gully (gully_id, arc_id, psector_id, state, doable, descript, link_geom, vnode_geom) VALUES ('30072', NULL, 2, 0, false, NULL, NULL, NULL);
UPDATE plan_psector_x_gully set arc_id  = '252', psector_id=2 WHERE gully_id = '100012';
UPDATE plan_psector_x_gully set arc_id  = '156', psector_id=2 WHERE gully_id = '100013';

INSERT INTO doc VALUES ('Demo document 1', 'OTHER', 'https://github.com/Giswater/docs/blob/master/user/manual_usuario_giswater3.doc', NULL, '2018-03-11 19:40:20.449663', current_user, '2018-03-11 19:40:20.449663');
INSERT INTO doc VALUES ('Demo document 3', 'OTHER', 'https://github.com/Giswater/giswater/blob/master-2.1/legal/Licensing.txt', NULL, '2018-03-14 17:09:59.762257', current_user, '2018-03-14 17:09:59.762257');
INSERT INTO doc VALUES ('Demo document 2', 'OTHER', 'https://github.com/Giswater/giswater/blob/master-2.1/legal/Readme.txt', NULL, '2018-03-14 17:09:19.852804', current_user, '2018-03-14 17:09:19.852804');

select gw_fct_connect_to_network((select array_agg(connec_id)from connec ), 'CONNEC');
select gw_fct_connect_to_network((select array_agg(connec_id)from connec ), 'GULLY');

SELECT gw_fct_plan_result($${"client":{"device":3, "infoType":100, "lang":"ES"},
							"feature":{},"data":{"parameters":{"coefficient":1, "description":"Demo prices for reconstruction", "resultType":1, "resultId":"Starting prices","saveOnDatabase":true}}}$$);
							
SELECT gw_fct_fill_doc_tables();
SELECT gw_fct_fill_om_tables();

INSERT INTO doc_x_visit (doc_id, visit_id)
SELECT 
doc.id,
om_visit.id
FROM doc, om_visit;

update node set link='https://www.giswater.org';
update arc set link='https://www.giswater.org';
update connec set link='https://www.giswater.org';
update gully set link='https://www.giswater.org';

refresh MATERIALIZED VIEW v_ui_workcat_polygon_aux;

select gw_fct_audit_check_project(1);

SELECT 	gw_fct_admin_manage_child_views($${"client":{"device":9, "infoType":100, "lang":"ES"}, "form":{}, "feature":{"catFeature":"CONDUIT"},
 "data":{"filterFields":{}, "pageInfo":{}, "multi_create":"TRUE" }}$$);


SELECT gw_fct_admin_manage_addfields($${"client":{"lang":"ES"}, "feature":{"catFeature":"CHAMBER"},
"data":{"action":"CREATE", "multi_create":"false", "parameters":{"column_id":"chamber_param_1", "datatype":"string", 
"widgettype":"combo", "label":"Chamber param_1","ismandatory":"False",
"fieldLength":"250", "numDecimals" :null,"addfield_active":"True", "iseditable":"True", 
"isenabled":"True","dv_querytext":"SELECT value as id, value as idval  FROM man_addfields_cat_combo WHERE parameter_id=2"}}}$$);

SELECT gw_fct_admin_manage_addfields($${"client":{"lang":"ES"}, "feature":{"catFeature":"CHAMBER"},
"data":{"action":"CREATE", "multi_create":"false", "parameters":{"column_id":"chamber_param_2", "datatype":"date", 
"widgettype":"datepickertime", "label":"Chamber param_2","ismandatory":"False",
"fieldLength":null, "numDecimals" :null,"addfield_active":"True", "iseditable":"True", "isenabled":"True"}}}$$);

SELECT gw_fct_admin_manage_addfields($${"client":{"lang":"ES"}, "feature":{"catFeature":"CIRC-MANHOLE"},
"data":{"action":"CREATE", "multi_create":"false", "parameters":{"column_id":"cirmanhole_param_1", "datatype":"integer", 
"widgettype":"text", "label":"Cmanhole param_1","ismandatory":"False",
"fieldLength":"10", "numDecimals" :null,"addfield_active":"True", "iseditable":"True", "isenabled":"True"}}}$$);

SELECT gw_fct_admin_manage_addfields($${"client":{"lang":"ES"}, "feature":{"catFeature":"CIRC-MANHOLE"},
"data":{"action":"CREATE", "multi_create":"false", "parameters":{"column_id":"cirmanhole_param_2", "datatype":"string", 
"widgettype":"text", "label":"Cmanhole param_2","ismandatory":"False",
"fieldLength":"250", "numDecimals" :null,"addfield_active":"True", "iseditable":"True", "isenabled":"True"}}}$$);

SELECT gw_fct_admin_manage_addfields($${"client":{"lang":"ES"}, "feature":{"catFeature":"PGULLY"},
"data":{"action":"CREATE", "multi_create":"false", "parameters":{"column_id":"grate_param_1", "datatype":"string", 
"widgettype":"combo", "label":"Grate param_1","ismandatory":"False",
"fieldLength":"250", "numDecimals" :null,"addfield_active":"True", "iseditable":"True", 
"isenabled":"True","dv_querytext":"SELECT value as id, value as idval  FROM man_addfields_cat_combo WHERE parameter_id=10"}}}$$);

SELECT gw_fct_admin_manage_addfields($${"client":{"lang":"ES"}, "feature":{"catFeature":"PGULLY"},
"data":{"action":"CREATE", "multi_create":"false", "parameters":{"column_id":"grate_param_2", "datatype":"boolean", 
"widgettype":"check", "label":"Grate param_2","ismandatory":"False",
"fieldLength":null, "numDecimals" :null,"addfield_active":"True", "iseditable":"True", "isenabled":"True"}}}$$);

SELECT gw_fct_admin_manage_addfields($${"client":{"lang":"ES"}, "feature":{"catFeature":"OWERFLOW-STORAGE"},
"data":{"action":"CREATE", "multi_create":"false", "parameters":{"column_id":"owestorage_param_1", "datatype":"integer", 
"widgettype":"text", "label":"Owstorage param_1","ismandatory":"False",
"fieldLength":"10", "numDecimals" :null,"addfield_active":"True", "iseditable":"True", "isenabled":"True"}}}$$);

SELECT gw_fct_admin_manage_addfields($${"client":{"lang":"ES"}, "feature":{"catFeature":"OWERFLOW-STORAGE"},
"data":{"action":"CREATE", "multi_create":"false", "parameters":{"column_id":"owestorage_param_2", "datatype":"string", 
"widgettype":"text", "label":"Owstorage param_2","ismandatory":"False",
"fieldLength":"250", "numDecimals" :null,"addfield_active":"True", "iseditable":"True", "isenabled":"True"}}}$$);

SELECT gw_fct_admin_manage_addfields($${"client":{"lang":"ES"}, "feature":{"catFeature":"PUMP-PIPE"},
"data":{"action":"CREATE", "multi_create":"false", "parameters":{"column_id":"pumpipe_param_1", "datatype":"boolean", 
"widgettype":"check", "label":"Ppipe param_1","ismandatory":"False",
"fieldLength":null, "numDecimals" :null,"addfield_active":"True", "iseditable":"True", "isenabled":"True"}}}$$);

SELECT gw_fct_admin_manage_addfields($${"client":{"lang":"ES"}, "feature":{"catFeature":"PUMP-PIPE"},
"data":{"action":"CREATE", "multi_create":"false", "parameters":{"column_id":"pumpipe_param_2", "datatype":"string", 
"widgettype":"text", "label":"Ppipe param_2","ismandatory":"False",
"fieldLength":"250", "numDecimals" :null,"addfield_active":"True", "iseditable":"True", "isenabled":"True"}}}$$);

SELECT gw_fct_admin_manage_addfields($${"client":{"lang":"ES"}, "feature":{"catFeature":"RECT-MANHOLE"},
"data":{"action":"CREATE", "multi_create":"false", "parameters":{"column_id":"recmanhole_param_1", "datatype":"string", 
"widgettype":"text", "label":"Rect. mhole param_1","ismandatory":"False",
"fieldLength":"500", "numDecimals" :null,"addfield_active":"True", "iseditable":"True", "isenabled":"True"}}}$$);

SELECT gw_fct_admin_manage_addfields($${"client":{"lang":"ES"}, "feature":{"catFeature":"RECT-MANHOLE"},
"data":{"action":"CREATE", "multi_create":"false", "parameters":{"column_id":"recmanhole_param_2", "datatype":"string", 
"widgettype":"text", "label":"Rect. mhole param_2","ismandatory":"False",
"fieldLength":"250", "numDecimals" :null,"addfield_active":"True", "iseditable":"True", "isenabled":"True"}}}$$);

SELECT gw_fct_admin_manage_addfields($${"client":{"lang":"ES"}, "feature":{"catFeature":"REGISTER"},
"data":{"action":"CREATE", "multi_create":"false", "parameters":{"column_id":"register_param_1", "datatype":"string", 
"widgettype":"text", "label":"Register param_1","ismandatory":"False",
"fieldLength":"500", "numDecimals" :null,"addfield_active":"True", "iseditable":"True", "isenabled":"True"}}}$$);

SELECT gw_fct_admin_manage_addfields($${"client":{"lang":"ES"}, "feature":{"catFeature":"REGISTER"},
"data":{"action":"CREATE", "multi_create":"false", "parameters":{"column_id":"register_param_2", "datatype":"string", 
"widgettype":"text", "label":"Register param_2","ismandatory":"False",
"fieldLength":"250", "numDecimals" :null,"addfield_active":"True", "iseditable":"True", "isenabled":"True"}}}$$);

SELECT gw_fct_admin_manage_addfields($${"client":{"lang":"ES"}, "feature":{"catFeature":"SEWER-STORAGE"},
"data":{"action":"CREATE", "multi_create":"false", "parameters":{"column_id":"sewstorage_param_1", "datatype":"string", 
"widgettype":"combo", "label":"Sstorage param_1","ismandatory":"False",
"fieldLength":"250", "numDecimals" :null,"addfield_active":"True", "iseditable":"True", 
"isenabled":"True","dv_querytext":"SELECT value as id, value as idval  FROM man_addfields_cat_combo WHERE parameter_id=30"}}}$$);

SELECT gw_fct_admin_manage_addfields($${"client":{"lang":"ES"}, "feature":{"catFeature":"SEWER-STORAGE"},
"data":{"action":"CREATE", "multi_create":"false", "parameters":{"column_id":"sewstorage_param_2", "datatype":"string", 
"widgettype":"text", "label":"Sstorage param_1","ismandatory":"False",
"fieldLength":"250", "numDecimals" :null,"addfield_active":"True", "iseditable":"True", "isenabled":"True"}}}$$);

SELECT gw_fct_admin_manage_addfields($${"client":{"lang":"ES"}, "feature":{"catFeature":"WEIR"},
"data":{"action":"CREATE", "multi_create":"false", "parameters":{"column_id":"weir_param_1", "datatype":"integer", 
"widgettype":"text", "label":"Weir param_1","ismandatory":"False",
"fieldLength":null, "numDecimals" :null,"addfield_active":"True", "iseditable":"True", "isenabled":"True"}}}$$);

SELECT gw_fct_admin_manage_addfields($${"client":{"lang":"ES"}, "feature":{"catFeature":"WEIR"},
"data":{"action":"CREATE", "multi_create":"false", "parameters":{"column_id":"weir_param_2", "datatype":"string", 
"widgettype":"text", "label":"Weir param_2","ismandatory":"False",
"fieldLength":"250", "numDecimals" :null,"addfield_active":"True", "iseditable":"True", "isenabled":"True"}}}$$);



INSERT INTO man_addfields_cat_combo VALUES (10, 'combo1', NULL);
INSERT INTO man_addfields_cat_combo VALUES (10, 'combo2', NULL);
INSERT INTO man_addfields_cat_combo VALUES (10, 'combo3', NULL);
INSERT INTO man_addfields_cat_combo VALUES (10, 'combo4', NULL);
INSERT INTO man_addfields_cat_combo VALUES (10, 'combo5', NULL);
INSERT INTO man_addfields_cat_combo VALUES (2, 'combo1', NULL);
INSERT INTO man_addfields_cat_combo VALUES (2, 'combo2', NULL);
INSERT INTO man_addfields_cat_combo VALUES (2, 'combo3', NULL);
INSERT INTO man_addfields_cat_combo VALUES (30, 'combo1', NULL);
INSERT INTO man_addfields_cat_combo VALUES (30, 'combo2', NULL);
INSERT INTO man_addfields_cat_combo VALUES (30, 'combo3', NULL);
INSERT INTO man_addfields_cat_combo VALUES (30, 'combo4', NULL);


