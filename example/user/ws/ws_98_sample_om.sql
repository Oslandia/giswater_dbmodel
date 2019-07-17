/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/


SET search_path = "SCHEMA_NAME", public, pg_catalog;

INSERT INTO om_visit_cat VALUES (1, 'Test num.1','2017-1-1', '2017-3-31', NULL, FALSE);
INSERT INTO om_visit_cat VALUES (2, 'Test num.2','2017-4-1', '2017-7-31', NULL, FALSE);
INSERT INTO om_visit_cat VALUES (3, 'Test num.3','2017-8-1', '2017-9-30', NULL, TRUE);
INSERT INTO om_visit_cat VALUES (4, 'Test num.4','2017-10-1', '2017-12-31', NULL, TRUE);


INSERT INTO om_visit_class VALUES (6, 'Inspection and clean arc', NULL, true, false, true, 'ARC', 'role_om');
INSERT INTO om_visit_class VALUES (5, 'Inspection and clean node', NULL, true, false, true, 'NODE', 'role_om');
INSERT INTO om_visit_class VALUES (7, 'Inspection and clean embornals', NULL, true, false, true, 'CONNEC', 'role_om');
INSERT INTO om_visit_class VALUES (1, 'Leak on pipe', NULL, true, false, false, 'ARC', 'role_om');
INSERT INTO om_visit_class VALUES (0, 'Open visit', NULL, true, true, false, NULL, 'role_om');
INSERT INTO om_visit_class VALUES (2, 'Inspection and clean connec', NULL, true, false, true, 'CONNEC', 'role_om');
INSERT INTO om_visit_class VALUES (4, 'Leak on connec', NULL, true, false, false, 'CONNEC', 'role_om');
INSERT INTO om_visit_class VALUES (3, 'Leak on node', NULL, true, false, false, 'NODE', 'role_om');
INSERT INTO om_visit_class VALUES (8, 'Incident', NULL, true, false, true, null, 'role_om');



INSERT INTO om_visit_parameter VALUES ('leak_connec', NULL, 'INSPECTION', 'CONNEC', 'TEXT', NULL, 'leak on connec', 'event_standard', 'defaultvalue',FALSE, 'con_insp_des');
INSERT INTO om_visit_parameter VALUES ('leak_arc', NULL, 'INSPECTION', 'ARC', 'TEXT', NULL, 'leak on arc', 'event_standard', 'defaultvalue', FALSE, 'arc_insp_des');
INSERT INTO om_visit_parameter VALUES ('leak_node', NULL, 'INSPECTION', 'NODE', 'TEXT', NULL, 'leak on node', 'event_standard', 'defaultvalue',FALSE, 'node_insp_des');

INSERT INTO om_visit_parameter VALUES ('sediments_arc', NULL, 'INSPECTION', 'ARC', 'TEXT', NULL, 'Sediments in arc', 'event_standard', 'defaultvalue',FALSE, 'arc_insp_sed');
INSERT INTO om_visit_parameter VALUES ('clean_arc', NULL, 'INSPECTION', 'ARC', 'TEXT', NULL, 'Clean of arc', 'event_standard', 'defaultvalue', FALSE, 'arc_cln_exec');
INSERT INTO om_visit_parameter VALUES ('defect_arc', NULL, 'INSPECTION', 'ARC', 'TEXT', NULL, 'Defects of arc', 'event_standard', 'defaultvalue', FALSE, 'arc_defect');

INSERT INTO om_visit_parameter VALUES ('sediments_connec', NULL, 'INSPECTION', 'CONNEC', 'TEXT', NULL, 'Sediments in connec', 'event_standard', 'defaultvalue',FALSE, 'con_insp_sed');
INSERT INTO om_visit_parameter VALUES ('clean_connec', NULL, 'INSPECTION', 'CONNEC', 'TEXT', NULL, 'Clean of connec', 'event_standard', 'defaultvalue',FALSE, 'con_cln_exec');
INSERT INTO om_visit_parameter VALUES ('defect_connec', NULL, 'INSPECTION', 'CONNEC', 'TEXT', NULL, 'Defects of connec', 'event_standard', 'defaultvalue', FALSE, 'connec_defect');

INSERT INTO om_visit_parameter VALUES ('sediments_node', NULL, 'INSPECTION', 'NODE', 'TEXT', NULL, 'Sediments in node', 'event_standard', 'defaultvalue',FALSE, 'node_insp_sed');
INSERT INTO om_visit_parameter VALUES ('clean_node', NULL, 'INSPECTION', 'NODE', 'TEXT', NULL, 'Clean of node', 'event_standard', 'defaultvalue',FALSE, 'node_cln_exec');
INSERT INTO om_visit_parameter VALUES ('defect_node', NULL, 'INSPECTION', 'NODE', 'TEXT', NULL, 'Defects of node', 'event_standard', 'defaultvalue', FALSE, 'node_defect');

INSERT INTO om_visit_parameter VALUES ('incident_comment', NULL, 'INSPECTION', NULL, 'TEXT', NULL, 'incident_comment', 'event_standard', 'e', FALSE, 'incident_comment');
INSERT INTO om_visit_parameter VALUES ('incident_type', NULL, 'INSPECTION', NULL, 'TEXT', NULL, 'incident type', 'event_standard', NULL, FALSE, 'incident_type');


INSERT INTO om_visit_class_x_parameter VALUES (1, 5	, 'sediments_node');
INSERT INTO om_visit_class_x_parameter VALUES (2, 2, 'clean_connec');
INSERT INTO om_visit_class_x_parameter VALUES (4, 6, 'clean_arc');
INSERT INTO om_visit_class_x_parameter VALUES (5, 2, 'sediments_connec');
INSERT INTO om_visit_class_x_parameter VALUES (6, 6, 'sediments_arc');
INSERT INTO om_visit_class_x_parameter VALUES (7, 5, 'defect_node');
INSERT INTO om_visit_class_x_parameter VALUES (8, 5, 'clean_node');
INSERT INTO om_visit_class_x_parameter VALUES (10, 1, 'leak_arc');
INSERT INTO om_visit_class_x_parameter VALUES (11, 3, 'leak_node');
INSERT INTO om_visit_class_x_parameter VALUES (12, 4, 'leak_connec');
INSERT INTO om_visit_class_x_parameter VALUES (13, 8, 'incident_comment');
INSERT INTO om_visit_class_x_parameter VALUES (15, 8, 'incident_type');
INSERT INTO om_visit_class_x_parameter VALUES (3, 6, 'defect_arc');
INSERT INTO om_visit_class_x_parameter VALUES (16, 2, 'defect_arc');

CREATE OR REPLACE VIEW ve_visit_noinfra AS 
 SELECT om_visit.id AS visit_id,
    om_visit.visitcat_id,
    om_visit.ext_code,
    "left"(date_trunc('second'::text, om_visit.startdate)::text, 19) AS startdate,
    "left"(date_trunc('second'::text, om_visit.enddate)::text, 19) AS enddate,
    om_visit.user_name,
    om_visit.webclient_id,
    om_visit.expl_id,
    om_visit.the_geom,
    om_visit.descript,
    om_visit.is_done,
    om_visit.class_id,
    om_visit.lot_id,
    om_visit.status,
    a.param_1 AS incident_type,
    a.param_2 AS incident_comment
   FROM om_visit
     JOIN om_visit_class ON om_visit_class.id = om_visit.class_id
     LEFT JOIN ( SELECT ct.visit_id,
            ct.param_1,
            ct.param_2
           FROM crosstab('SELECT visit_id, om_visit_event.parameter_id, value 
      FROM om_visit JOIN om_visit_event ON om_visit.id= om_visit_event.visit_id 
      JOIN om_visit_class on om_visit_class.id=om_visit.class_id
      JOIN om_visit_class_x_parameter on om_visit_class_x_parameter.parameter_id=om_visit_event.parameter_id 
      where om_visit_class.ismultievent = TRUE ORDER  BY 1,2'::text, ' VALUES (''incident_type''),(''incident_comment'')'::text) ct(visit_id integer, param_1 text, param_2 text)) a ON a.visit_id = om_visit.id
  WHERE om_visit_class.ismultievent = true;



DROP VIEW IF EXISTS ve_visit_arc_insp;
CREATE OR REPLACE VIEW ve_visit_arc_insp AS 
 SELECT om_visit_x_arc.id,
    om_visit_x_arc.visit_id,
    om_visit_x_arc.arc_id,
    om_visit.visitcat_id,
    om_visit.ext_code,
    om_visit.startdate,
    om_visit.enddate,
    om_visit.user_name,
    om_visit.webclient_id,
    om_visit.expl_id,
    om_visit.the_geom,
    om_visit.descript,
    om_visit.is_done,
    om_visit.class_id,
    om_visit.lot_id,
    om_visit.status,
    a.param_1 AS sendiments_arc,
    a.param_2 AS defect_arc,
    a.param_3 AS clean_arc
   FROM om_visit
     JOIN om_visit_class ON om_visit_class.id = om_visit.class_id
     JOIN om_visit_x_arc ON om_visit.id = om_visit_x_arc.visit_id
     LEFT JOIN ( SELECT ct.visit_id,
            ct.param_1,
            ct.param_2,
            ct.param_3
           FROM crosstab('SELECT visit_id, om_visit_event.parameter_id, value 
      FROM om_visit JOIN om_visit_event ON om_visit.id= om_visit_event.visit_id 
      JOIN om_visit_class on om_visit_class.id=om_visit.class_id
      JOIN om_visit_class_x_parameter on om_visit_class_x_parameter.parameter_id=om_visit_event.parameter_id 
      where om_visit_class.ismultievent = TRUE ORDER  BY 1,2'::text, ' VALUES (''sendiments_arc''),(''defect_arc''),(''clean_arc'')'::text) ct(visit_id integer, param_1 text, param_2 text, param_3 text)) a ON a.visit_id = om_visit.id
  WHERE om_visit_class.ismultievent = true;


DROP VIEW IF EXISTS ve_visit_node_insp;
CREATE OR REPLACE VIEW ve_visit_node_insp AS 
 SELECT om_visit_x_node.id,
    om_visit_x_node.visit_id,
    om_visit_x_node.node_id,
    om_visit.visitcat_id,
    om_visit.ext_code,
    om_visit.startdate,
    om_visit.enddate,
    om_visit.user_name,
    om_visit.webclient_id,
    om_visit.expl_id,
    om_visit.the_geom,
    om_visit.descript,
    om_visit.is_done,
    om_visit.class_id,
    om_visit.lot_id,
    om_visit.status,
    a.param_1 AS sediments_node,
    a.param_2 AS defect_node,
    a.param_3 AS clean_node
   FROM om_visit
     JOIN om_visit_class ON om_visit_class.id = om_visit.class_id
     JOIN om_visit_x_node ON om_visit.id = om_visit_x_node.visit_id
     LEFT JOIN ( SELECT ct.visit_id,
            ct.param_1,
            ct.param_2,
            ct.param_3
           FROM crosstab('SELECT visit_id, om_visit_event.parameter_id, value 
      FROM om_visit JOIN om_visit_event ON om_visit.id= om_visit_event.visit_id 
      JOIN om_visit_class on om_visit_class.id=om_visit.class_id
      JOIN om_visit_class_x_parameter on om_visit_class_x_parameter.parameter_id=om_visit_event.parameter_id 
      where om_visit_class.ismultievent = TRUE ORDER  BY 1,2'::text, ' VALUES (''sediments_node''),(''defect_node''),(''clean_node'')'::text) ct(visit_id integer, param_1 text, param_2 text, param_3 text)) a ON a.visit_id = om_visit.id
  WHERE om_visit_class.ismultievent = true;


DROP VIEW IF EXISTS ve_visit_connec_insp;
CREATE OR REPLACE VIEW ve_visit_connec_insp AS 
 SELECT om_visit_x_connec.id,
    om_visit_x_connec.visit_id,
    om_visit_x_connec.connec_id,
    om_visit.visitcat_id,
    om_visit.ext_code,
    om_visit.startdate,
    om_visit.enddate,
    om_visit.user_name,
    om_visit.webclient_id,
    om_visit.expl_id,
    om_visit.the_geom,
    om_visit.descript,
    om_visit.is_done,
    om_visit.class_id,
    om_visit.lot_id,
    om_visit.status,
    a.param_1 AS sediments_connec,
    a.param_2 AS defect_connec,
    a.param_3 AS clean_connec
   FROM om_visit
     JOIN om_visit_class ON om_visit_class.id = om_visit.class_id
     JOIN om_visit_x_connec ON om_visit.id = om_visit_x_connec.visit_id
     LEFT JOIN ( SELECT ct.visit_id,
            ct.param_1,
            ct.param_2,
            ct.param_3
           FROM crosstab('SELECT visit_id, om_visit_event.parameter_id, value 
      FROM om_visit JOIN om_visit_event ON om_visit.id= om_visit_event.visit_id 
      JOIN om_visit_class on om_visit_class.id=om_visit.class_id
      JOIN om_visit_class_x_parameter on om_visit_class_x_parameter.parameter_id=om_visit_event.parameter_id 
      where om_visit_class.ismultievent = TRUE ORDER  BY 1,2'::text, ' VALUES (''sediments_connec''),(''defect_connec''),(''clean_connec'')'::text) ct(visit_id integer, param_1 text, param_2 text, param_3 text)) a ON a.visit_id = om_visit.id
  WHERE om_visit_class.ismultievent = true;

INSERT INTO om_typevalue VALUES ('visit_cleaned', 1, 'Yes', NULL, NULL);
INSERT INTO om_typevalue VALUES ('visit_cleaned', 2, 'No', NULL, NULL);
INSERT INTO om_typevalue VALUES ('visit_cleaned', 3, 'Half', NULL, NULL);
INSERT INTO om_typevalue VALUES ('visit_defect', 1, 'Good state', NULL, NULL);
INSERT INTO om_typevalue VALUES ('visit_defect', 2, 'Some defects', NULL, NULL);
INSERT INTO om_typevalue VALUES ('visit_defect', 3, 'Bad state', NULL, NULL);
INSERT INTO om_typevalue VALUES ('incident_type', 1, 'Broken cover', NULL, NULL);
INSERT INTO om_typevalue VALUES ('incident_type', 2, 'Water on the street', NULL, NULL);
INSERT INTO om_typevalue VALUES ('incident_type', 3, 'Smells', NULL, NULL);
INSERT INTO om_typevalue VALUES ('incident_type', 4, 'Noisy cover', NULL, NULL);
INSERT INTO om_typevalue VALUES ('incident_type', 5, 'Others', NULL, NULL);


INSERT INTO config_api_form_fields VALUES (27350, 'visit_connec_insp', 'visit', 'defect_connec', 1, 8, true, 'integer', 'combo', 'Defects:', NULL, NULL, NULL, NULL, NULL, false, NULL, true, NULL, 'SELECT id, idval FROM om_typevalue WHERE typevalue = ''visit_defect'' ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (27360, 'visit_connec_insp', 'visit', 'clean_connec', 1, 9, true, 'integer', 'combo', 'Cleaned:', NULL, NULL, NULL, NULL, NULL, false, NULL, true, NULL, 'SELECT id, idval FROM om_typevalue WHERE typevalue = ''visit_cleaned'' ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (28120, 'visit_node_insp', 'visit', 'defect_node', 1, 8, true, 'integer', 'combo', 'Defects:', NULL, NULL, NULL, NULL, NULL, false, NULL, true, NULL, 'SELECT id, idval FROM om_typevalue WHERE typevalue = ''visit_defect'' ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (28130, 'visit_node_insp', 'visit', 'clean_node', 1, 9, true, 'integer', 'combo', 'Cleaned:', NULL, NULL, NULL, NULL, NULL, false, NULL, true, NULL, 'SELECT id, idval FROM om_typevalue WHERE typevalue = ''visit_cleaned'' ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (28270, 'visit_arc_insp', 'visit', 'defect_arc', 1, 8, true, 'integer', 'combo', 'Defects:', NULL, NULL, NULL, NULL, NULL, false, NULL, true, NULL, 'SELECT id, idval FROM om_typevalue WHERE typevalue = ''visit_defect'' ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (28280, 'visit_arc_insp', 'visit', 'clean_arc', 1, 9, true, 'integer', 'combo', 'Cleaned:', NULL, NULL, NULL, NULL, NULL, false, NULL, true, NULL, 'SELECT id, idval FROM om_typevalue WHERE typevalue = ''visit_cleaned'' ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (28520, 'unexpected_noinfra', 'visit', 'incident_type', 1, 3, true, 'integer', 'combo', 'Incident type:', NULL, NULL, NULL, NULL, NULL, false, NULL, true, NULL, 'SELECT DISTINCT id,  idval FROM om_typevalue WHERE typevalue= ''incident_type'' ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (30110, 'unexpected_arc', 'visit', 'incident_type', 1, 3, true, 'integer', 'combo', 'Incident type:', NULL, NULL, NULL, NULL, NULL, false, NULL, true, NULL, 'SELECT DISTINCT id,  idval FROM om_typevalue WHERE typevalue= ''incident_type'' ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (28030, 'visit_node_leak', 'visit', 'event_code', 1, 7, true, 'string', 'text', 'Event code:', NULL, NULL, 'Ex.: Parameter code', NULL, NULL, false, NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (28170, 'visit_connec_leak', 'visit', 'ext_code', 1, 5, true, 'string', 'text', 'Code:', NULL, NULL, 'Ex.: Work order code', NULL, NULL, false, NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (28180, 'visit_connec_leak', 'visit', 'event_code', 1, 7, true, 'string', 'text', 'Event code:', NULL, NULL, 'Ex.: Parameter code', NULL, NULL, false, NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (28068, 'visit_node_insp', 'visit', 'class_id', 1, 1, true, 'integer', 'combo', 'Visit type:', NULL, NULL, NULL, NULL, NULL, true, NULL, true, NULL, 'SELECT id, idval FROM om_visit_class WHERE feature_type=''NODE'' AND  active IS TRUE AND sys_role_id IN (SELECT rolname FROM pg_roles WHERE  pg_has_role( current_user, oid, ''member''))', NULL, NULL, NULL, NULL, NULL, NULL, true, NULL, true, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (28138, 'visit_connec_leak', 'visit', 'class_id', 1, 1, true, 'integer', 'combo', 'Visit type:', NULL, NULL, NULL, NULL, NULL, true, NULL, true, NULL, 'SELECT id, idval FROM om_visit_class WHERE feature_type=''CONNEC'' AND  active IS TRUE AND sys_role_id IN (SELECT rolname FROM pg_roles WHERE  pg_has_role( current_user, oid, ''member''))', NULL, NULL, NULL, NULL, 'gwGetVisit', NULL, true, NULL, true, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (28218, 'visit_arc_insp', 'visit', 'class_id', 1, 1, true, 'integer', 'combo', 'Visit type:', NULL, NULL, NULL, NULL, NULL, true, NULL, true, NULL, 'SELECT id, idval FROM om_visit_class WHERE feature_type=''ARC'' AND  active IS TRUE AND sys_role_id IN (SELECT rolname FROM pg_roles WHERE  pg_has_role( current_user, oid, ''member''))', NULL, NULL, NULL, NULL, 'gwGetVisit', NULL, true, NULL, true, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (28286, 'visit_arc_insp', 'visit', 'backbutton', 9, 2, true, NULL, 'button', 'Back', NULL, NULL, NULL, NULL, NULL, false, NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, 'backButtonClicked', NULL, NULL, NULL, NULL, NULL, NULL, 'data_9', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (27260, 'visit_arc_leak', 'visit', 'event_code', 1, 7, true, 'string', 'text', 'Event code:', NULL, NULL, 'Ex.: Parameter code', NULL, NULL, false, NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (27284, 'visit_arc_leak', 'visit', 'enddate', 1, 12, true, 'date', 'datepickertime', 'End date:', NULL, NULL, NULL, NULL, NULL, false, NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (28282, 'visit_arc_insp', 'visit', 'enddate', 1, 11, true, 'date', 'datepickertime', 'End date:', NULL, NULL, NULL, NULL, NULL, false, NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (27282, 'visit_arc_leak', 'visit', 'startdate', 1, 11, true, 'date', 'text', 'Start date:', NULL, NULL, NULL, NULL, NULL, false, NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (27240, 'visit_arc_leak', 'visit', 'lot_id', 1, 4, true, 'integer', 'combo', 'Lot id:', NULL, NULL, NULL, NULL, NULL, true, NULL, false, NULL, 'SELECT id , idval FROM om_visit_lot WHERE active IS TRUE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (27270, 'visit_arc_leak', 'visit', 'position_id', 1, 8, true, 'string', 'combo', 'Position id:', NULL, NULL, NULL, NULL, NULL, false, NULL, true, NULL, 'SELECT id, idval FROM (SELECT node_1 AS id, node_1 AS idval FROM arc UNION SELECT DISTINCT node_2 AS id, node_2 AS idval FROM arc) WHERE id IS NOT NULL', NULL, NULL, 'arc_id', ' AND arc.arc_id.arc_id=', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (27320, 'visit_connec_insp', 'visit', 'visitcat_id', 1, 5, true, 'integer', 'combo', 'Visit catalog:', NULL, NULL, NULL, NULL, NULL, true, NULL, true, NULL, 'SELECT DISTINCT id AS id, name AS idval FROM om_visit_cat WHERE active IS TRUE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (28260, 'visit_arc_insp', 'visit', 'sediments_arc', 1, 7, true, 'double', 'text', 'Sediments', NULL, NULL, 'Ex.: 10 (en cmts.)', 12, 2, false, NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (28299, 'visit_connec_insp', 'visit', 'image1', 1, 2, true, 'bytea', 'image', NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, true, NULL, 'SELECT row_to_json(res) FROM (SELECT encode(image, ''base64'') AS image FROM config_api_images WHERE id=1) res;', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (27250, 'visit_arc_leak', 'visit', 'ext_code', 1, 5, true, 'string', 'text', 'Code:', NULL, NULL, 'Ex.: Work order code', NULL, NULL, false, NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (28219, 'visit_arc_insp', 'visit', 'image1', 1, 2, true, 'bytea', 'image', NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, true, NULL, 'SELECT row_to_json(res) FROM (SELECT encode(image, ''base64'') AS image FROM config_api_images WHERE id=1) res;', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (27340, 'visit_connec_insp', 'visit', 'sediments_connec', 1, 7, true, 'string', 'text', 'Sediments:', NULL, NULL, 'Ex.: 10 (en cmts.)', 12, 2, false, NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (27220, 'visit_arc_leak', 'visit', 'event_id', 1, 2, true, 'double', 'text', 'Event id:', NULL, NULL, NULL, 12, 0, false, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (29930, 'visit_class_0', 'visit', 'acceptbutton', 9, 1, true, NULL, 'button', 'Accept', NULL, NULL, NULL, NULL, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gwSetVisit', NULL, NULL, NULL, NULL, NULL, NULL, 'data_9', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (27290, 'visit_arc_leak', 'visit', 'arc_id', 1, 10, true, 'string', 'text', 'Arc id:', NULL, NULL, NULL, NULL, NULL, false, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (28250, 'visit_arc_insp', 'visit', 'ext_code', 1, 6, true, 'string', 'text', 'Code:', NULL, NULL, NULL, NULL, NULL, false, NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (28230, 'visit_arc_insp', 'visit', 'arc_id', 1, 4, true, 'double', 'text', 'Arc_id', NULL, NULL, NULL, 12, 0, false, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (28080, 'visit_node_insp', 'visit', 'node_id', 1, 4, true, 'double', 'text', 'Node_id', NULL, NULL, NULL, 12, 0, false, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (28770, 'visit_class_0', 'visit', 'class_id', 1, 1, true, 'integer', 'text', 'Visit type:', NULL, NULL, NULL, NULL, NULL, false, NULL, true, NULL, 'SELECT id, idval FROM om_visit_class WHERE feature_type IS NULL AND active IS TRUE AND id > 0 AND sys_role_id IN (SELECT rolname FROM pg_roles WHERE  pg_has_role( current_user, oid, ''member''))', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (29900, 'visit_class_0', 'visit', 'ext_code', 1, 4, true, 'string', 'text', 'Code:', NULL, NULL, NULL, NULL, NULL, false, NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (29920, 'visit_class_0', 'visit', 'enddate', 1, 6, true, 'date', 'datepickertime', 'End date:', NULL, NULL, NULL, NULL, NULL, false, NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (27230, 'visit_arc_leak', 'visit', 'visit_id', 1, 3, true, 'double', 'text', 'Visit id:', NULL, NULL, NULL, 12, 0, false, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (28281, 'visit_arc_insp', 'visit', 'startdate', 1, 10, true, 'date', 'datepickertime', 'Start date:', NULL, NULL, NULL, NULL, NULL, false, NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (28780, 'visit_class_0', 'visit', 'visit_id', 1, 2, true, 'integer', 'text', 'Visit id:', NULL, NULL, NULL, NULL, NULL, false, NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (29910, 'visit_class_0', 'visit', 'startdate', 1, 5, true, 'date', 'datepickertime', 'Start date:', NULL, NULL, NULL, NULL, NULL, false, NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (27330, 'visit_connec_insp', 'visit', 'visit_code', 1, 6, true, 'string', 'text', 'Visit code:', NULL, NULL, NULL, NULL, NULL, false, NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (27364, 'visit_connec_insp', 'visit', 'backbutton', 9, 2, true, NULL, 'button', 'Back', NULL, NULL, NULL, NULL, NULL, false, NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, 'backButtonClicked', NULL, NULL, NULL, NULL, NULL, NULL, 'data_9', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (27988, 'visit_node_leak', 'visit', 'class_id', 1, 1, true, 'integer', 'combo', 'Visit type:', NULL, NULL, NULL, NULL, NULL, true, NULL, true, NULL, 'SELECT id, idval FROM om_visit_class WHERE feature_type=''NODE'' AND  active IS TRUE AND sys_role_id IN (SELECT rolname FROM pg_roles WHERE  pg_has_role( current_user, oid, ''member''))', NULL, NULL, NULL, NULL, 'gwGetVisit', NULL, true, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (28010, 'visit_node_leak', 'visit', 'visitcat_id', 1, 4, true, 'integer', 'combo', 'Visit catalog:', NULL, NULL, NULL, NULL, NULL, true, NULL, true, NULL, 'SELECT DISTINCT id AS id, name AS idval FROM om_visit_cat WHERE active IS TRUE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (28100, 'visit_node_insp', 'visit', 'visit_code', 1, 6, true, 'string', 'text', 'Visit code:', NULL, NULL, NULL, NULL, NULL, false, NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (28285, 'visit_arc_insp', 'visit', 'acceptbutton', 9, 1, true, NULL, 'button', 'Accept', NULL, NULL, NULL, NULL, NULL, false, NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, 'gwSetVisit', NULL, NULL, NULL, NULL, NULL, NULL, 'data_9', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (28790, 'visit_class_0', 'visit', 'visitcat_id', 1, 3, true, 'integer', 'combo', 'Visit catalog:', NULL, NULL, NULL, NULL, NULL, false, NULL, true, NULL, 'SELECT DISTINCT id AS id, name AS idval FROM om_visit_cat WHERE active IS TRUE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (29940, 'visit_class_0', 'visit', 'cancelbutton', 9, 2, true, NULL, 'button', 'Cancel', NULL, NULL, NULL, NULL, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'backButtonClicked', NULL, NULL, NULL, NULL, NULL, NULL, 'data_9', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (28110, 'visit_node_insp', 'visit', 'sediments_node', 1, 7, true, 'double', 'text', 'Sediments:', NULL, NULL, 'Ex.: 10 (en cmts.)', 12, 2, false, NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (28140, 'visit_connec_leak', 'visit', 'event_id', 1, 2, true, 'double', 'text', 'Event id:', NULL, NULL, NULL, NULL, NULL, false, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (28210, 'visit_connec_leak', 'visit', 'connec_id', 1, 8, true, 'double', 'text', 'Connec id:', NULL, NULL, NULL, NULL, NULL, false, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (27310, 'visit_connec_insp', 'visit', 'connec_id', 1, 4, true, 'string', 'text', 'Connec id', NULL, NULL, NULL, NULL, NULL, false, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (27990, 'visit_node_leak', 'visit', 'event_id', 1, 2, true, 'double', 'text', 'Event id:', NULL, NULL, NULL, 12, 0, false, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (28060, 'visit_node_leak', 'visit', 'arc_id', 1, 8, true, 'double', 'text', 'Node id:', NULL, NULL, NULL, 12, 0, false, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (28168, 'visit_node_insp', 'visit', 'image1', 1, 2, true, 'bytea', 'image', NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, true, NULL, 'SELECT row_to_json(res) FROM (SELECT encode(image, ''base64'') AS image FROM config_api_images WHERE id=1) res;', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (28020, 'visit_node_leak', 'visit', 'ext_code', 1, 5, true, 'string', 'text', 'Code:', NULL, NULL, 'Ex.: Work order code', NULL, NULL, false, NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (27300, 'visit_connec_insp', 'visit', 'visit_id', 1, 3, true, 'double', 'text', 'Visit id:', NULL, NULL, NULL, 12, 0, false, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (28000, 'visit_node_leak', 'visit', 'visit_id', 1, 3, true, 'double', 'text', 'Visit id:', NULL, NULL, NULL, 12, 0, false, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (28070, 'visit_node_insp', 'visit', 'visit_id', 1, 3, true, 'double', 'text', 'Visit id:', NULL, NULL, NULL, 12, 0, false, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (28150, 'visit_connec_leak', 'visit', 'visit_id', 1, 3, true, 'double', 'text', 'Visit id:', NULL, NULL, NULL, NULL, NULL, false, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (28172, 'visit_connec_leak', 'visit', 'parameter_id', 1, 6, true, 'string', 'text', 'Parameter:', NULL, NULL, NULL, NULL, NULL, false, NULL, false, NULL, 'SELECT id AS id, descript AS idval FROM om_visit_parameter WHERE feature_type=''CONNEC''', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (28220, 'visit_arc_insp', 'visit', 'visit_id', 1, 3, true, 'double', 'text', 'Visit id:', NULL, NULL, NULL, 12, 0, false, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (27218, 'visit_arc_leak', 'visit', 'class_id', 1, 1, true, 'integer', 'combo', 'Visit type:', NULL, NULL, NULL, 12, 0, true, NULL, true, NULL, 'SELECT id, idval FROM om_visit_class WHERE feature_type=''ARC'' AND  active IS TRUE AND sys_role_id IN (SELECT rolname FROM pg_roles WHERE  pg_has_role( current_user, oid, ''member''))', NULL, NULL, NULL, NULL, 'gwGetVisit', NULL, true, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (27256, 'visit_arc_leak', 'visit', 'parameter_id', 1, 6, true, 'string', 'combo', 'Parameter:', NULL, NULL, NULL, NULL, NULL, false, NULL, false, NULL, 'SELECT id AS id, descript AS idval FROM om_visit_parameter WHERE feature_type=''ARC''', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (27280, 'visit_arc_leak', 'visit', 'position_value', 1, 9, true, 'double', 'text', 'Position value:', NULL, NULL, 'Ex.: 34.57', 12, 2, false, NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (27292, 'visit_arc_leak', 'visit', 'acceptbutton', 9, 1, true, NULL, 'button', 'Accept', NULL, NULL, NULL, NULL, NULL, false, NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, 'gwSetVisit', NULL, NULL, NULL, NULL, NULL, NULL, 'data_9', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (27294, 'visit_arc_leak', 'visit', 'backbutton', 9, 2, true, NULL, 'button', 'Back', NULL, NULL, NULL, NULL, NULL, false, NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, 'backButtonClicked', NULL, NULL, NULL, NULL, NULL, NULL, 'data_9', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (27298, 'visit_connec_insp', 'visit', 'class_id', 1, 1, true, 'integer', 'combo', 'Visit type:', NULL, NULL, NULL, 12, 0, true, NULL, true, NULL, 'SELECT id, idval FROM om_visit_class WHERE feature_type=''CONNEC'' AND  active IS TRUE AND sys_role_id IN (SELECT rolname FROM pg_roles WHERE  pg_has_role( current_user, oid, ''member''))', NULL, NULL, NULL, NULL, NULL, NULL, true, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (27362, 'visit_connec_insp', 'visit', 'acceptbutton', 9, 1, true, NULL, 'button', 'Accept', NULL, NULL, NULL, NULL, NULL, false, NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, 'gwSetVisit', NULL, NULL, NULL, NULL, NULL, NULL, 'data_9', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (27286, 'visit_arc_leak', 'visit', 'status', 1, 13, true, 'integer', 'combo', 'Status:', NULL, NULL, NULL, NULL, NULL, false, NULL, true, NULL, 'SELECT DISTINCT (id) AS id,  idval  AS idval FROM om_typevalue WHERE id IS NOT NULL AND typevalue=''visit_cat_status'' ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (28090, 'visit_node_insp', 'visit', 'visitcat_id', 1, 5, true, 'integer', 'combo', 'Visit catalog:', NULL, NULL, NULL, NULL, NULL, true, NULL, true, NULL, 'SELECT DISTINCT id AS id, name AS idval FROM om_visit_cat WHERE active IS TRUE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (28132, 'visit_node_insp', 'visit', 'acceptbutton', 9, 1, true, NULL, 'button', 'Accept', NULL, NULL, NULL, NULL, NULL, false, NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, 'gwSetVisit', NULL, NULL, NULL, NULL, NULL, NULL, 'data_9', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (28134, 'visit_node_insp', 'visit', 'backbutton', 9, 2, true, NULL, 'button', 'Back', NULL, NULL, NULL, NULL, NULL, false, NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, 'backButtonClicked', NULL, NULL, NULL, NULL, NULL, NULL, 'data_9', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (28160, 'visit_connec_leak', 'visit', 'visitcat_id', 1, 4, true, 'integer', 'combo', 'Visit catalog:', NULL, NULL, NULL, NULL, NULL, true, NULL, true, NULL, 'SELECT DISTINCT id AS id, name AS idval FROM om_visit_cat WHERE active IS TRUE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (28284, 'visit_arc_insp', 'visit', 'divider', 1, 10, true, NULL, 'formDivider', NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (28022, 'visit_node_leak', 'visit', 'parameter_id', 1, 6, true, 'string', 'text', 'Parameter:', NULL, NULL, NULL, NULL, NULL, false, NULL, false, NULL, 'SELECT id AS id, descript AS idval FROM om_visit_parameter WHERE feature_type=''NODE''', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (28510, 'unexpected_noinfra', 'visit', 'visit_id', 1, 2, true, 'integer', 'text', 'Visit id:', NULL, NULL, NULL, NULL, NULL, false, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (28532, 'unexpected_noinfra', 'visit', 'startdate', 1, 5, true, 'date', 'datepickertime', 'Start date:', NULL, NULL, NULL, NULL, NULL, false, NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (28600, 'unexpected_noinfra', 'visit', 'acceptbutton', 9, 1, true, NULL, 'button', 'Accept', NULL, NULL, NULL, NULL, NULL, false, NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, 'gwSetVisit', NULL, NULL, NULL, NULL, NULL, NULL, 'data_9', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (28500, 'unexpected_noinfra', 'visit', 'class_id', 1, 1, true, 'integer', 'combo', 'Visit type:', NULL, NULL, NULL, NULL, NULL, false, NULL, false, NULL, 'SELECT id, idval FROM om_visit_class WHERE feature_type IS NULL AND active IS TRUE AND id > 0 AND sys_role_id IN (SELECT rolname FROM pg_roles WHERE  pg_has_role( current_user, oid, ''member''))', NULL, NULL, NULL, NULL, 'gwGetVisit', NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (28524, 'unexpected_noinfra', 'visit', 'incident_comment', 1, 7, true, 'string', 'text', 'Comment:', NULL, NULL, NULL, NULL, NULL, false, NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (28530, 'unexpected_noinfra', 'visit', 'ext_code', 1, 4, true, 'string', 'text', 'Code:', NULL, NULL, NULL, NULL, NULL, false, NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (28534, 'unexpected_noinfra', 'visit', 'enddate', 1, 6, true, 'date', 'datepickertime', 'End date:', NULL, NULL, NULL, NULL, NULL, false, NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (30120, 'unexpected_arc', 'visit', 'ext_code', 1, 4, true, 'string', 'text', 'Code:', NULL, NULL, NULL, NULL, NULL, false, NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (30140, 'unexpected_arc', 'visit', 'enddate', 1, 6, true, 'date', 'datepickertime', 'End date:', NULL, NULL, NULL, NULL, NULL, false, NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (30160, 'unexpected_arc', 'visit', 'class_id', 1, 1, true, 'integer', 'combo', 'Visit type:', NULL, NULL, NULL, NULL, NULL, false, NULL, false, NULL, 'SELECT id, idval FROM om_visit_class WHERE feature_type IS NULL AND active IS TRUE AND id > 0 AND sys_role_id IN (SELECT rolname FROM pg_roles WHERE  pg_has_role( current_user, oid, ''member''))', NULL, NULL, NULL, NULL, 'gwGetVisit', NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (30170, 'unexpected_arc', 'visit', 'startdate', 1, 5, true, 'date', 'datepickertime', 'Start date:', NULL, NULL, NULL, NULL, NULL, false, NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (28610, 'unexpected_noinfra', 'visit', 'cancelbutton', 9, 2, true, NULL, 'button', 'Cancel', NULL, NULL, NULL, NULL, NULL, false, NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, 'backButtonClicked', NULL, NULL, NULL, NULL, NULL, NULL, 'data_9', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (30100, 'unexpected_arc', 'visit', 'acceptbutton', 9, 1, true, NULL, 'button', 'Accept', NULL, NULL, NULL, NULL, NULL, false, NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, 'gwSetVisit', NULL, NULL, NULL, NULL, NULL, NULL, 'data_9', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (30101, 'unexpected_arc', 'visit', 'cancelbutton', 9, 2, true, NULL, 'button', 'Cancel', NULL, NULL, NULL, NULL, NULL, false, NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, 'backButtonClicked', NULL, NULL, NULL, NULL, NULL, NULL, 'data_9', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (30130, 'unexpected_arc', 'visit', 'visit_id', 1, 2, true, 'integer', 'text', 'Visit id:', NULL, NULL, NULL, NULL, NULL, false, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (28240, 'visit_arc_insp', 'visit', 'lot_id', 1, 5, true, 'integer', 'combo', 'Lot id:', NULL, NULL, NULL, NULL, NULL, true, NULL, false, NULL, 'SELECT id , idval FROM om_visit_lot WHERE active IS TRUE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (28283, 'visit_arc_insp', 'visit', 'status', 1, 12, true, 'integer', 'combo', 'Status:', NULL, NULL, NULL, NULL, NULL, false, NULL, true, NULL, 'SELECT DISTINCT (id) AS id,  idval  AS idval FROM om_typevalue WHERE id IS NOT NULL AND typevalue=''visit_cat_status'' ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (28542, 'unexpected_noinfra', 'visit', 'status', 9, 1, true, 'integer', 'combo', 'Status:', NULL, NULL, NULL, NULL, NULL, false, NULL, true, NULL, 'SELECT DISTINCT (id) AS id,  idval  AS idval FROM om_typevalue WHERE id IS NOT NULL AND typevalue=''visit_cat_status'' ', NULL, NULL, NULL, NULL, 'gwSetVisit', NULL, NULL, NULL, NULL, NULL, NULL, 'data_9', NULL, NULL);
INSERT INTO config_api_form_fields VALUES (30150, 'unexpected_arc', 'visit', 'status', 1, 7, true, 'integer', 'combo', 'Status:', NULL, NULL, NULL, NULL, NULL, false, NULL, true, NULL, 'SELECT DISTINCT (id) AS id,  idval  AS idval FROM om_typevalue WHERE id IS NOT NULL AND typevalue=''visit_cat_status'' ', NULL, NULL, NULL, NULL, 'gwSetVisit', NULL, NULL, NULL, NULL, NULL, NULL, 'data_1', NULL, NULL);

