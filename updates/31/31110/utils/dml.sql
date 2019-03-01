﻿/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/


SET search_path = SCHEMA_NAME, public, pg_catalog;



-- update config param system
UPDATE config_param_system SET label='Gully units tolerance:' ,isenabled=TRUE,layout_id=15,layout_order=18 ,project_type='ud' ,datatype='integer' ,widgettype='linextext' WHERE parameter='rev_gully_units_tol';
UPDATE config_param_system SET label='Node geom 1 tolerance:' ,isenabled=TRUE,layout_id=15 ,layout_order=7 ,project_type='ud' ,datatype='double' ,widgettype='spinbox' WHERE parameter='rev_node_geom1_tol';
UPDATE config_param_system SET label='custom_giswater_folder:' ,isenabled=FALSE ,layout_id=NULL ,layout_order=NULL ,project_type=NULL , datatype='string' ,widgettype='linetext' WHERE parameter='custom_giswater_folder';

INSERT INTO sys_fprocess_cat VALUES (35, 'Recursive go2epa process', 'EPA', 'Recursive go2epa process', 'utils');
INSERT INTO sys_fprocess_cat VALUES (36, 'store fk', 'admin', 'store fk', 'utils');


/*

REMIX
1)
UPDATE config_param_system SET         4, 'expl_layer', 'ext_municipality', 'varchar', 'searchplus', NULL, 'expl_layer:', NULL, NULL, false, 1, NULL, NULL, NULL, false, false, 'string', 'linetext', NULL);
2)
label='' ,isenabled= ,layout_id= ,layout_order= ,project_type= , datatype= ,widgettype= WHERE parameter='';

1+2= EXAMPLE
UPDATE config_param_system SET label='expl_layer:' ,isenabled=false ,layout_id=false ,layout_order=false ,project_type=false , datatype='string' ,widgettype='linetext' WHERE parameter='expl_layer';


										   PARAMETER (1)												      LABEL(:)              ISENABLED(t/f), (1), LY_ID, LY_OD, PT, f,f, DATAYPE   WIDGETTYPE
UPDATE config_param_system SET         4, 'expl_layer', 'ext_municipality', 'varchar', 'searchplus', NULL, 'expl_layer:', NULL, NULL, false, 1, NULL, NULL, NULL, false, false, 'string', 'linetext', NULL);
UPDATE config_param_system SET         5, 'expl_field_code', 'muni_id', 'varchar', 'searchplus', NULL, 'expl_field_code:', NULL, NULL, false, 1, NULL, NULL, NULL, false, false, 'string', 'linetext', NULL);
UPDATE config_param_system SET         6, 'expl_field_name', 'name', 'varchar', 'searchplus', NULL, 'expl_field_name:', NULL, NULL, false, 1, NULL, NULL, NULL, false, false, 'string', 'linetext', NULL);
UPDATE config_param_system SET         8, 'network_layer_arc', 'v_edit_arc', 'varchar', 'searchplus', NULL, 'network_layer_arc:', NULL, NULL, false, 1, NULL, NULL, NULL, false, false, 'string', 'linetext', NULL);
UPDATE config_param_system SET         9, 'network_layer_connec', 'v_edit_connec', 'varchar', 'searchplus', NULL, 'network_layer_connec:', NULL, NULL, false, 1, NULL, NULL, NULL, false, false, 'string', 'linetext', NULL);
UPDATE config_param_system SET         10, 'network_layer_element', 'element', 'varchar', 'searchplus', NULL, 'network_layer_element:', NULL, NULL, false, 1, NULL, NULL, NULL, false, false, 'string', 'linetext', NULL);
UPDATE config_param_system SET         11, 'network_layer_gully', 'v_edit_gully', 'varchar', 'searchplus', NULL, 'network_layer_gully:', NULL, NULL, false, 1, NULL, NULL, NULL, false, false, 'string', 'linetext', NULL);
UPDATE config_param_system SET         12, 'network_layer_node', 'v_edit_node', 'varchar', 'searchplus', NULL, 'network_layer_node:', NULL, NULL, false, 1, NULL, NULL, NULL, false, false, 'string', 'linetext', NULL);
UPDATE config_param_system SET         13, 'network_field_arc_code', 'code', 'varchar', 'searchplus', NULL, 'network_field_arc_code:', NULL, NULL, false, 1, NULL, NULL, NULL, false, false, 'string', 'linetext', NULL);
UPDATE config_param_system SET         14, 'network_field_connec_code', 'code', 'varchar', 'searchplus', NULL, 'network_field_connec_code:', NULL, NULL, false, 1, NULL, NULL, NULL, false, false, 'string', 'linetext', NULL);
UPDATE config_param_system SET         15, 'network_field_element_code', 'code', 'varchar', 'searchplus', NULL, 'network_field_element_code:', NULL, NULL, false, 1, NULL, NULL, NULL, false, false, 'string', 'linetext', NULL);
UPDATE config_param_system SET         16, 'network_field_gully_code', 'code', 'varchar', 'searchplus', NULL, 'network_field_gully_code:', NULL, NULL, false, 1, NULL, NULL, NULL, false, false, 'string', 'linetext', NULL);
UPDATE config_param_system SET         17, 'network_field_node_code', 'code', 'varchar', 'searchplus', NULL, 'network_field_node_code:', NULL, NULL, false, 1, NULL, NULL, NULL, false, false, 'string', 'linetext', NULL);
UPDATE config_param_system SET         18, 'street_layer', 'v_ext_streetaxis', 'varchar', 'searchplus', NULL, 'street_layer:', NULL, NULL, false, 1, NULL, NULL, NULL, false, false, 'string', 'linetext', NULL);
UPDATE config_param_system SET         19, 'street_field_code', 'id', 'varchar', 'searchplus', NULL, 'street_field_code:', NULL, NULL, false, 1, NULL, NULL, NULL, false, false, 'string', 'linetext', NULL);
UPDATE config_param_system SET         20, 'street_field_name', 'name', 'varchar', 'searchplus', NULL, 'street_field_name:', NULL, NULL, false, 1, NULL, NULL, NULL, false, false, 'string', 'linetext', NULL);
UPDATE config_param_system SET         21, 'portal_layer', 'v_ext_address', 'varchar', 'searchplus', NULL, 'portal_layer:', NULL, NULL, false, 1, NULL, NULL, NULL, false, false, 'string', 'linetext', NULL);
UPDATE config_param_system SET         22, 'portal_field_code', 'streetaxis_id', 'varchar', 'searchplus', NULL, 'portal_field_code:', NULL, NULL, false, 1, NULL, NULL, NULL, false, false, 'string', 'linetext', NULL);
UPDATE config_param_system SET         23, 'portal_field_number', 'postnumber', 'varchar', 'searchplus', NULL, 'portal_field_number:', NULL, NULL, false, 1, NULL, NULL, NULL, false, false, 'string', 'linetext', NULL);
UPDATE config_param_system SET         24, 'portal_field_postal', 'postcode', 'varchar', 'searchplus', NULL, 'portal_field_postal:', NULL, NULL, false, 1, NULL, NULL, NULL, false, false, 'string', 'linetext', NULL);
UPDATE config_param_system SET         25, 'street_field_expl', 'muni_id', 'varchar', 'searchplus', NULL, 'street_field_expl:', NULL, NULL, false, 1, NULL, NULL, NULL, false, false, 'string', 'linetext', NULL);
UPDATE config_param_system SET         60, 'basic_search_hyd_hydro_layer_name', 'v_rtc_hydrometer', 'varchar', 'searchplus', 'layer name', 'basic_search_hyd_hydro_layer_name:', NULL, NULL, false, 1, NULL, NULL, NULL, false, false, 'string', 'linetext', NULL);
UPDATE config_param_system SET         61, 'basic_search_hyd_hydro_field_expl_name', 'expl_name', 'varchar', 'searchplus', 'field exploitation.name', 'basic_search_hyd_hydro_field_expl_name:', NULL, NULL, false, 1, NULL, NULL, NULL, false, false, 'string', 'linetext', NULL);
UPDATE config_param_system SET         68, 'basic_search_hyd_hydro_field_3', 'state', 'text', 'searchplus', 'field value_state.name', 'basic_search_hyd_hydro_field_3:', NULL, NULL, false, 1, NULL, NULL, NULL, false, false, 'string', 'linetext', NULL);
UPDATE config_param_system SET         69, 'basic_search_workcat_filter', 'code', 'text', 'searchplus', NULL, 'basic_search_workcat_filter:', NULL, NULL, false, 1, NULL, NULL, NULL, false, false, 'string', 'linetext', NULL);
UPDATE config_param_system SET         11114, 'gully_proximity', '0.5', NULL, NULL, NULL, 'gully_proximity:', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
UPDATE config_param_system SET         11115, 'gully_proximity_control', 'TRUE', NULL, NULL, NULL, 'gully_proximity_control:', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
UPDATE config_param_system SET         39, 'rev_node_ymax_tol', '0', 'float', 'review', 'Only for UD', 'Node Y max tolerance:', NULL, NULL, true, 1, 15, 6, 'ud', false, false, 'double', 'spinbox', NULL);
UPDATE config_param_system SET         92, 'arc_searchnodes', '9.0', NULL, NULL, NULL, 'Arc searchnodes buffer:', NULL, NULL, true, NULL, 13, 1, 'utils', false, false, 'double', 'spinbox', NULL);
UPDATE config_param_system SET         36, 'rev_arc_geom1_tol', '0', 'float', 'review', 'Only for UD', 'Arc geom 1 tolerance:', NULL, NULL, true, 1, 15, 3, 'ud', false, false, 'double', 'spinbox', NULL);
UPDATE config_param_system SET         48, 'rev_gully_sandbox_tol', '0', 'float', 'review', 'Only for UD', 'Gully sandbox tolerance:', NULL, NULL, true, 1, 15, 15, 'ud', false, false, 'double', 'spinbox', NULL);
UPDATE config_param_system SET         50, 'rev_gully_connec_geom2_tol', '0', 'float', 'review', 'Only for UD', 'Gully geom 2 tolerance:', NULL, NULL, true, 1, 15, 17, 'ud', false, false, 'double', 'spinbox', NULL);
UPDATE config_param_system SET         71, 'node_proximity', '4.0', 'double precision', NULL, NULL, 'Node proximity control:', NULL, NULL, true, 1, 13, 3, 'utils', false, false, 'double', 'spinbox', NULL);
UPDATE config_param_system SET         34, 'rev_arc_y1_tol', '0', 'float', 'review', 'Only for UD', 'Arc y1 tolerance:', NULL, NULL, true, 1, 15, 1, 'ud', false, false, 'double', 'spinbox', NULL);
UPDATE config_param_system SET         82, 'node_duplicated_tolerance', '0.001', 'double precision', NULL, NULL, 'Node duplicated tolerance:', NULL, NULL, true, 1, 16, 1, 'utils', false, false, 'double', 'spinbox', NULL);
UPDATE config_param_system SET         33, 'rev_node_depth_tol', '0', 'float', 'review', 'Only for WS', 'Node depth tolerance:', NULL, NULL, true, 1, 15, 3, 'ws', false, false, 'double', 'spinbox', NULL);
UPDATE config_param_system SET         53, 'proximity_buffer', '50.0', 'double precision', NULL, NULL, 'Neighbourhood proximity buffer:', NULL, NULL, true, 1, 13, 10, 'utils', false, false, 'double', 'spinbox', NULL);
UPDATE config_param_system SET         49, 'rev_gully_connec_geom1_tol', '0', 'float', 'review', 'Only for UD', 'Gully geom 1 tolerance:', NULL, NULL, true, 1, 15, 16, 'ud', false, false, 'double', 'spinbox', NULL);
UPDATE config_param_system SET         83, 'connec_duplicated_tolerance', '0.001', 'double precision', NULL, NULL, 'Connec duplicated tolerance:', NULL, NULL, true, 1, 16, 2, 'utils', false, false, 'double', 'spinbox', NULL);
UPDATE config_param_system SET         47, 'rev_gully_ymax_tol', '0', 'float', 'review', 'Only for UD', 'Gully Y max tolerance:', NULL, NULL, true, 1, 15, 14, 'ud', false, false, 'double', 'spinbox', NULL);
UPDATE config_param_system SET         35, 'rev_arc_y2_tol', '0', 'float', 'review', 'Only for UD', 'Arc y2 tolerance:', NULL, NULL, true, 1, 15, 2, 'ud', false, false, 'double', 'spinbox', NULL);
UPDATE config_param_system SET         87, 'buffer_value', '3.0', 'double precision', NULL, NULL, 'Double geometry enabled:', NULL, NULL, true, 1, 13, 5, 'utils', false, false, 'double', 'spinbox', NULL);
UPDATE config_param_system SET         37, 'rev_arc_geom2_tol', '0', 'float', 'review', 'Only for UD', 'Arc geom 2 tolerance:', NULL, NULL, true, 1, 15, 4, 'ud', false, false, 'double', 'spinbox', NULL);
UPDATE config_param_system SET         38, 'rev_node_top_elev_tol', '0', 'float', 'review', 'Only for UD', 'Node top elev tolerance:', NULL, NULL, true, 1, 15, 5, 'ud', false, false, 'double', 'spinbox', NULL);
UPDATE config_param_system SET         52, 'link_searchbuffer', '3.0', 'boolean', 'topology', NULL, 'Link search buffer:', NULL, NULL, true, 1, 13, 9, 'utils', false, false, 'double', 'spinbox', NULL);
UPDATE config_param_system SET         74, 'connec_proximity', '1.0', 'double precision', NULL, NULL, 'Connec proximity control:', NULL, NULL, true, 1, 13, 4, 'utils', false, false, 'double', 'spinbox', NULL);
UPDATE config_param_system SET         41, 'rev_node_geom2_tol', '0', 'float', 'review', 'Only for UD', 'Node geom 2 tolerance:', NULL, NULL, true, 1, 15, 8, 'ud', false, false, 'double', 'spinbox', NULL);
UPDATE config_param_system SET         43, 'rev_connec_y2_tol', '0', 'float', 'review', 'Only for UD', 'Connec y2 tolerance:', NULL, NULL, true, 1, 15, 10, 'ud', false, false, 'double', 'spinbox', NULL);
UPDATE config_param_system SET         32, 'rev_node_elevation_tol', '2', 'float', 'review', 'Only for WS', 'Node elev tolerance:', NULL, NULL, true, 1, 15, 1, 'ws', false, false, 'double', 'spinbox', NULL);
UPDATE config_param_system SET         45, 'rev_connec_geom2_tol', '0', 'float', 'review', 'Only for UD', 'Connec geom 2 tolerance:', NULL, NULL, true, 1, 15, 12, 'ud', false, false, 'double', 'spinbox', NULL);
UPDATE config_param_system SET         42, 'rev_connec_y1_tol', '0', 'float', 'review', 'Only for UD', 'Connec y1 tolerance:', NULL, NULL, true, 1, 15, 9, 'ud', false, false, 'double', 'spinbox', NULL);
UPDATE config_param_system SET         44, 'rev_connec_geom1_tol', '0', 'float', 'review', 'Only for UD', 'Connec geom 1 tolerance:', NULL, NULL, true, 1, 15, 11, 'ud', false, false, 'double', 'spinbox', NULL);
UPDATE config_param_system SET         46, 'rev_gully_top_elev_tol', '0', 'float', 'review', 'Only for UD', 'Gully top elev tolerance:', NULL, NULL, true, 1, 15, 13, 'ud', false, false, 'double', 'spinbox', NULL);
UPDATE config_param_system SET         81, 'connec_proximity_control', 'true', 'boolean', NULL, NULL, 'Connec proximity control:', NULL, NULL, true, 1, 13, 4, 'utils', false, false, 'boolean', 'check', NULL);
UPDATE config_param_system SET         86, 'insert_double_geometry', 'true', 'boolean', NULL, NULL, 'Double geometry enabled:', NULL, NULL, true, 1, 13, 5, 'utils', false, false, 'boolean', 'check', NULL);
UPDATE config_param_system SET         76, 'orphannode_delete', 'true', 'boolean', NULL, NULL, 'Orphan node delete:', NULL, NULL, true, 1, 13, 6, 'utils', false, false, 'boolean', 'check', NULL);
UPDATE config_param_system SET         75, 'nodeinsert_arcendpoint', 'true', 'boolean', NULL, NULL, 'Automatic insert arc end point:', NULL, NULL, true, 1, 13, 7, 'utils', false, false, 'boolean', 'check', NULL);
UPDATE config_param_system SET         7, 'scale_zoom', '500', 'integer', 'searchplus', NULL, 'scale_zoom:', NULL, NULL, false, 1, NULL, NULL, NULL, false, false, 'integer', 'linetext', NULL);
UPDATE config_param_system SET         26, 'module_om_rehabit', 'TRUE', 'boolean', 'om', NULL, 'module_om_rehabit:', NULL, NULL, false, 1, NULL, NULL, NULL, false, false, 'boolean', 'check', NULL);
UPDATE config_param_system SET         27, 'state_topocontrol', 'true', 'boolean', 'topology', 'Only for WS', 'state_topocontrol:', NULL, NULL, true, 1, 13, 15, 'utils', false, false, 'boolean', 'check', NULL);
UPDATE config_param_system SET         28, 'mincut_conflict_map', 'false', 'boolean', 'mincut', NULL, 'mincut_conflict_map:', NULL, NULL, true, 1, 17, 4, 'utils', false, false, 'boolean', 'check', NULL);
UPDATE config_param_system SET         29, 'inventory_update_date', '2017-01-01', 'date', 'om', NULL, 'inventory_update_date:', NULL, NULL, false, 1, NULL, NULL, NULL, false, false, 'date', 'datepickertime', NULL);
UPDATE config_param_system SET         31, 'link_search_button', '0,1', 'float', 'edit', NULL, 'link_search_button:', NULL, NULL, false, 1, NULL, NULL, NULL, false, false, 'double', 'spinbox', NULL);
UPDATE config_param_system SET         55, 'edit_enable_arc_nodes_update', 'true', 'boolean', 'edit', NULL, 'edit_enable_arc_nodes_update:', NULL, NULL, true, 1, 13, 14, 'utils', false, false, 'boolean', 'check', NULL);
UPDATE config_param_system SET         56, 'hydrometer_link_absolute_path', '', 'text', 'rtc', NULL, 'hydrometer_link_absolute_path:', NULL, NULL, true, 1, 17, 3, 'utils', false, false, 'string', 'linetext', NULL);
UPDATE config_param_system SET         62, 'basic_search_hyd_hydro_field_cc', 'connec_id', 'text', 'searchplus', 'field connec.code', 'basic_search_hyd_hydro_field_cc:', NULL, NULL, false, 1, NULL, NULL, NULL, false, false, 'string', 'linetext', NULL);
UPDATE config_param_system SET         63, 'basic_search_hyd_hydro_field_erhc', 'hydrometer_customer_code', 'text', 'searchplus', 'field ext_rtc_hydrometer.code', 'basic_search_hyd_hydro_field_erhc:', NULL, NULL, false, 1, NULL, NULL, NULL, false, false, 'string', 'linetext', NULL);
UPDATE config_param_system SET         64, 'basic_search_hyd_hydro_field_ccc', 'connec_customer_code', 'text', 'searchplus', 'field connec.customer_code', 'basic_search_hyd_hydro_field_ccc:', NULL, NULL, false, 1, NULL, NULL, NULL, false, false, 'string', 'linetext', NULL);
UPDATE config_param_system SET         66, 'basic_search_hyd_hydro_field_1', 'hydrometer_customer_code', 'text', 'searchplus', 'field ext_rtc_hydrometer.code', 'basic_search_hyd_hydro_field_1:', NULL, NULL, false, 1, NULL, NULL, NULL, false, false, 'string', 'linetext', NULL);
UPDATE config_param_system SET         67, 'basic_search_hyd_hydro_field_2', 'connec_customer_code', 'text', 'searchplus', 'field connec.customer_code', 'basic_search_hyd_hydro_field_2:', NULL, NULL, false, 1, NULL, NULL, NULL, false, false, 'string', 'linetext', NULL);
UPDATE config_param_system SET         70, 'om_mincut_use_pgrouting', NULL, 'boolean', 'mincut', NULL, 'om_mincut_use_pgrouting:', NULL, NULL, false, 1, NULL, NULL, NULL, false, false, 'boolean', 'check', NULL);
UPDATE config_param_system SET         73, 'node2arc', '0.5', 'double precision', NULL, NULL, 'Node Tolerance (arc divide):', NULL, NULL, true, 1, 13, 16, 'ws', false, false, 'double', 'spinbox', NULL);
UPDATE config_param_system SET         77, 'vnode_update_tolerance', '0.5', 'double precision', NULL, NULL, 'vnode_update_tolerance:', NULL, NULL, true, 1, 13, 11, 'utils', false, false, 'double', 'spinbox', NULL);
UPDATE config_param_system SET         84, 'audit_function_control', 'TRUE', 'boolean', NULL, NULL, 'audit_function_control:', NULL, NULL, false, 1, NULL, NULL, NULL, false, false, 'boolean', 'check', NULL);
UPDATE config_param_system SET         11113, 'api_canvasmargin', '{"mincanvasmargin":{"mts":5, "pixels":""}, "maxcanvasmargin":{"mts":50, "pixels":""}}', NULL, NULL, NULL, 'api_canvasmargin:', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
UPDATE config_param_system SET         11112, 'sys_currency', '{"id":"EUR", "descript":"EURO", "symbol":"€"}', NULL, NULL, NULL, 'sys_currency:', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
UPDATE config_param_system SET         30, 'geom_slp_direction', 'FALSE', 'boolean', 'topology', 'Ony for UD', 'Geometry direction as slope arc direction:', NULL, NULL, true, 1, 13, 16, 'ud', false, false, 'boolean', 'check', NULL);
UPDATE config_param_system SET         94, 'chk_state_topo', 'true', NULL, NULL, NULL, 'State topo control:', NULL, NULL, true, NULL, 13, 8, 'utils', false, false, 'boolean', 'check', NULL);
UPDATE config_param_system SET         80, 'node_proximity_control', 'true', 'boolean', NULL, NULL, 'Node proximity control:', NULL, NULL, true, 1, 13, 3, 'utils', false, false, 'boolean', 'check', NULL);
UPDATE config_param_system SET         93, 'samenode_init_end_control', 'true', NULL, NULL, NULL, 'Arc same node init end control:', NULL, NULL, true, NULL, 13, 2, 'utils', false, false, 'boolean', 'check', NULL);
UPDATE config_param_system SET         85, 'arc_searchnodes_control', 'true', 'boolean', NULL, NULL, 'Arc searchnodes buffer:', NULL, NULL, true, 1, 13, 1, 'utils', false, false, 'boolean', 'check', NULL);
UPDATE config_param_system SET         1, 'doc_absolute_path', '', 'varchar', 'path', NULL, 'doc_absolute_path:', NULL, NULL, true, 1, 17, 1, 'utils', false, false, 'string', 'linetext', NULL);
UPDATE config_param_system SET         2, 'om_visit_absolute_path', 'c:/', 'varchar', 'path', NULL, 'om_visit_absolute_path:', NULL, NULL, true, 1, 17, 2, 'utils', false, false, 'string', 'linetext', NULL);
UPDATE config_param_system SET         54, 'edit_arc_divide_automatic_control', 'true', 'boolean', 'edit', NULL, 'edit_arc_divide_automatic_control:', NULL, NULL, true, 1, 13, 13, 'utils', false, false, 'boolean', 'check', NULL);
UPDATE config_param_system SET         78, 'nodetype_change_enabled', 'true', 'boolean', NULL, NULL, 'nodetype_change_enabled:', NULL, NULL, true, 1, 13, 12, 'utils', false, false, 'boolean', 'check', NULL);
UPDATE config_param_system SET         95, 'api_search_arc', '{"sys_table_id":"ve_arc", "sys_id_field":"arc_id", "sys_search_field":"code", "alias":"Arcs", "cat_field":"arccat_id", "orderby" :"1", "feature_type":"arc_id"}', NULL, 'api_search_network', '
', 'api_search_arc:', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
UPDATE config_param_system SET         90, 'ApiVersion', '0.9.101', NULL, NULL, NULL, 'ApiVersion:', NULL, NULL, false, NULL, NULL, NULL, NULL, false, false, NULL, NULL, NULL);
UPDATE config_param_system SET         88, 'api_sensibility_factor_mobile', '2', NULL, NULL, NULL, 'api_sensibility_factor_mobile:', NULL, NULL, false, NULL, NULL, NULL, NULL, false, false, NULL, NULL, NULL);
UPDATE config_param_system SET         89, 'api_sensibility_factor_web', '1', NULL, NULL, NULL, 'api_sensibility_factor_web:', NULL, NULL, false, NULL, NULL, NULL, NULL, false, false, NULL, NULL, NULL);
UPDATE config_param_system SET         96, 'api_search_node', '{"sys_table_id":"ve_node", "sys_id_field":"node_id", "sys_search_field":"code", "alias":"Nodes", "cat_field":"nodecat_id", "orderby":"2", "feature_type":"node_id"}', NULL, 'api_search_network', NULL, 'api_search_node:', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
UPDATE config_param_system SET         97, 'api_search_connec', '{"sys_table_id":"ve_connec", "sys_id_field":"connec_id", "sys_search_field":"code", "alias":"Escomeses", "cat_field":"connecat_id", "orderby":"3", "feature_type":"connec_id"}', NULL, 'api_search_network', NULL, 'api_search_connec:', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
UPDATE config_param_system SET         98, 'api_search_element', '{"sys_table_id":"ve_element", "sys_id_field":"element_id", "sys_search_field":"code", "alias":"Elements", "cat_field":"elementcat_id", "orderby":"5", "feature_type":"element_id"}', NULL, 'api_search_network', NULL, 'api_search_element:', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
UPDATE config_param_system SET         99, 'api_search_muni', '{"sys_table_id":"ext_municipality", "sys_id_field":"muni_id", "sys_search_field":"name", "sys_geom_field":"the_geom"}', NULL, 'apì_search_adress', NULL, 'api_search_muni:', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
UPDATE config_param_system SET         100, 'api_search_street', '{"sys_table_id":"v_ext_streetaxis", "sys_id_field":"id", "sys_search_field":"name", "sys_parent_field":"muni_id", "sys_geom_field":"the_geom"}', NULL, 'apì_search_adress', NULL, 'api_search_street:', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
UPDATE config_param_system SET         101, 'api_search_postnumber', '{"sys_table_id":"v_ext_address", "sys_id_field":"id", "sys_search_field":"postnumber", "sys_parent_field":"streetaxis_id", "sys_geom_field":"the_geom"}', NULL, 'apì_search_adress', NULL, 'api_search_postnumber:', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
UPDATE config_param_system SET         102, 'api_search_workcat', '{"sys_table_id":"v_ui_workcat_polygon", "sys_id_field":"workcat_id", "sys_search_field":"workcat_id", "sys_geom_field":"the_geom", "filter_text":"code"}', NULL, 'apì_search_workcat', NULL, 'api_search_workcat:', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
UPDATE config_param_system SET         103, 'api_search_psector', '{"sys_table_id":"ve_plan_psector","WARNING":"sys_table_id only web, python is hardcoded: ve_plan_psector as self.plan_om =''plan''''", "sys_id_field":"psector_id", "sys_search_field":"name", "sys_parent_field":"expl_id", "sys_geom_field":"the_geom"}', NULL, 'apì_search_psector', NULL, 'api_search_psector:', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
UPDATE config_param_system SET         104, 'api_search_exploitation', '{"sys_table_id":"exploitation", "sys_id_field":"expl_id", "sys_search_field":"name", "sys_geom_field":"the_geom"}', NULL, 'apì_search_psector', NULL, 'api_search_exploitation:', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
UPDATE config_param_system SET         105, 'api_search_hydrometer', '{"sys_table_id":"v_ui_hydrometer", "sys_id_field":"sys_hydrometer_id", "sys_connec_id":"sys_connec_id", "sys_search_field_1":"Hydro ccode:",  "sys_search_field_2":"Connec ccode:",  "sys_search_field_3":"State:", "sys_parent_field":"Exploitation:"}', NULL, 'apì_search_hydrometer', NULL, 'api_search_hydrometer:', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
UPDATE config_param_system SET         106, 'api_search_network_null', '{"sys_table_id":"", "sys_id_field":"", "sys_search_field":"", "alias":"", "cat_field":"", "orderby":"0"}', NULL, 'api_search_network', NULL, 'api_search_network_null:', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
UPDATE config_param_system SET         107, 'api_search_visit', '{"sys_table_id":"om_visit", "sys_id_field":"id", "sys_search_field":"id", "alias":"Visita", "cat_field":"visitcat_id", "orderby":"6", "feature_type":"visit"}', NULL, 'api_search_network', NULL, 'api_search_visit:', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
UPDATE config_param_system SET         108, 'api_search_visit_modificat', '{"sys_table_id":"om_visit", "sys_id_field":"id", "sys_search_field":"id", "sys_geom_field":"the_geom"}', NULL, 'api_search_visit', NULL, 'api_search_visit_modificat:', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
UPDATE config_param_system SET         11111, 'daily_update_mails', '{"mails": [{"mail":"info@bgeo.es"},{"mail":"info@giswater.org"}]}', 'json', 'daily_update_mails', 'Daily update mails', 'daily_update_mails:', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
*/


/*
-- update config_param_user

1)
UPDATE audit_cat_param_user SET     WHERE parameter='verified_vdefault', 'config', NULL, 'role_edit', NULL, 'Verified:', 'SELECT id AS id, id as idval  FROM value_verified WHERE id IS NOT NULL', NULL, true, 8, 1, 'utils', false, NULL, 'verified', NULL, false, 'string', 'combo', false, NULL, NULL, NULL, NULL);
									
2)
label='' , dv_querytext=, dv_parent_id=, isenabled= , layout_id= ,layout_order= , project_type='' ,isparent= ,dv_querytext_filterc=NULL, feature_field_id=, feature_dv_parent_value=, isautoupdate=
, datatype='' , widgettype='' ismandatory= , widgetcontrols= , vdefault= , layout_name=, reg_exp=;


1+2= EXAMPLE
UPDATE audit_cat_param_user SET  label='Verified:', dv_querytext='SELECT id AS id, id as idval FROM value_verified WHERE id IS NOT NULL', dv_parent_id=NULL, isenabled=true , layout_id=8 ,layout_order=1 , 
project_type='utils' ,isparent=false ,dv_querytext_filterc=NULL, feature_field_id='verified', feature_dv_parent_value=NULL, isautoupdate=false, datatype='string' , widgettype='combo' ismandatory=false , widgetcontrols=NULL , vdefault=NULL , layout_name=NULL, reg_exp=NULL WHERE parameter='verified_vdefault';



UPDATE audit_cat_param_user SET     WHERE parameter='visitclass_vdefault_connec', 'config', NULL, 'role_om', NULL, 'Visit class vdefault connec:', 'SELECT id, idval FROM SCHEMA_NAME.om_visit_class WHERE feature_type=''CONNEC'' AND  active IS TRUE AND sys_role_id IN (SELECT rolname FROM pg_roles WHERE  pg_has_role( current_user, oid, ''member''))', NULL, true, 2, 6, 'utils', false, NULL, NULL, NULL, false, 'integer', 'combo', false, NULL, NULL, NULL, NULL);
UPDATE audit_cat_param_user SET     WHERE parameter='visitclass_vdefault_arc', 'config', NULL, 'role_om', NULL, 'Visit class vdefault arc:', 'SELECT id, idval FROM SCHEMA_NAME.om_visit_class WHERE feature_type=''ARC'' AND  active IS TRUE AND sys_role_id IN (SELECT rolname FROM pg_roles WHERE  pg_has_role( current_user, oid, ''member''))', NULL, true, 2, 4, 'utils', false, NULL, NULL, NULL, false, 'integer', 'combo', false, NULL, NULL, NULL, NULL);
UPDATE audit_cat_param_user SET     WHERE parameter='visitclass_vdefault_node', 'config', NULL, 'role_om', NULL, 'Visit class vdefault node:', 'SELECT id, idval FROM SCHEMA_NAME.om_visit_class WHERE feature_type=''NODE'' AND  active IS TRUE AND sys_role_id IN (SELECT rolname FROM pg_roles WHERE  pg_has_role( current_user, oid, ''member''))', NULL, true, 2, 5, 'utils', false, NULL, NULL, NULL, false, 'integer', 'combo', false, NULL, NULL, NULL, NULL);
UPDATE audit_cat_param_user SET     WHERE parameter='psector_other_vdefault', 'config', NULL, 'role_master', NULL, 'Psector other:', NULL, NULL, true, 7, 6, 'utils', false, NULL, NULL, NULL, false, 'double', 'spinbox', false, NULL, NULL, NULL, NULL);
UPDATE audit_cat_param_user SET     WHERE parameter='psector_vat_vdefault', 'config', NULL, 'role_master', NULL, 'Psector vat:', NULL, NULL, true, 7, 5, 'utils', false, NULL, NULL, NULL, false, 'double', 'spinbox', false, NULL, NULL, NULL, NULL);
UPDATE audit_cat_param_user SET     WHERE parameter='psector_scale_vdefault', 'config', NULL, 'role_master', NULL, 'Psector scale:', NULL, NULL, true, 7, 2, 'utils', false, NULL, NULL, NULL, false, 'double', 'spinbox', false, NULL, NULL, NULL, NULL);
UPDATE audit_cat_param_user SET     WHERE parameter='psector_rotation_vdefault', 'config', NULL, 'role_master', NULL, 'Psector rotation:', NULL, NULL, true, 7, 3, 'utils', false, NULL, NULL, NULL, false, 'double', 'spinbox', false, NULL, NULL, NULL, NULL);
UPDATE audit_cat_param_user SET     WHERE parameter='visitcat_vdefault', 'config', NULL, 'role_om', NULL, 'Visit catalog:', 'SELECT id AS id, name as idval  FROM om_visit_cat WHERE id IS NOT NULL', NULL, true, 2, 1, 'utils', false, NULL, NULL, NULL, false, 'string', 'combo', false, NULL, NULL, NULL, NULL);
UPDATE audit_cat_param_user SET     WHERE parameter='state_vdefault', 'config', NULL, 'role_edit', NULL, 'State:', 'SELECT id AS id , name as idval  FROM value_state WHERE id IS NOT NULL', NULL, true, 3, 1, 'utils', false, NULL, 'state', NULL, false, 'string', 'combo', false, NULL, NULL, NULL, NULL);
UPDATE audit_cat_param_user SET     WHERE parameter='exploitation_vdefault', 'config', NULL, 'role_edit', NULL, 'Exploitation:', 'SELECT expl_id AS id , name as idval FROM exploitation WHERE expl_id IS NOT NULL', NULL, true, 4, 2, 'utils', true, NULL, 'expl_id', NULL, false, 'string', 'combo', false, NULL, NULL, NULL, NULL);
UPDATE audit_cat_param_user SET     WHERE parameter='parameter_vdefault', 'config', NULL, 'role_om', NULL, 'Parameter:', 'SELECT om_visit_parameter.id AS id, om_visit_parameter.id AS idval FROM om_visit_parameter WHERE id IS NOT NULL', NULL, true, 2, 2, 'utils', false, NULL, NULL, NULL, false, 'string', 'combo', false, NULL, NULL, NULL, NULL);
UPDATE audit_cat_param_user SET     WHERE parameter='document_type_vdefault', 'config', NULL, 'role_basic', NULL, 'Document type:', 'SELECT doc_type.id AS id, doc_type.id AS idval FROM doc_type WHERE id IS NOT NULL', NULL, true, 1, 5, 'utils', false, NULL, NULL, NULL, false, 'string', 'combo', false, NULL, NULL, NULL, NULL);
UPDATE audit_cat_param_user SET     WHERE parameter='search_municipality_vdefault', 'config', NULL, 'role_basic', NULL, 'Search municipality:', 'SELECT muni_id AS id, name AS idval FROM ext_municipality WHERE muni_id IS NOT NULL', NULL, true, 1, 2, 'utils', false, NULL, 'muni_id', NULL, false, 'string', 'combo', false, NULL, NULL, NULL, NULL);
UPDATE audit_cat_param_user SET     WHERE parameter='nodetype_vdefault', 'config', NULL, 'role_edit', NULL, 'Node Type:', 'SELECT id AS id, id AS idval FROM node_type WHERE id IS NOT NULL', NULL, true, 9, 1, 'ud', false, NULL, NULL, NULL, false, 'string', 'combo', false, NULL, NULL, NULL, NULL);
UPDATE audit_cat_param_user SET     WHERE parameter='builtdate_vdefault', 'config', NULL, 'role_edit', NULL, 'Builtdate:', NULL, NULL, true, 3, 5, 'utils', false, NULL, 'builtdate', NULL, false, 'date', 'datepickertime', false, NULL, NULL, NULL, NULL);
UPDATE audit_cat_param_user SET     WHERE parameter='from_date_vdefault', 'config', NULL, 'role_basic', NULL, 'From date:', NULL, NULL, true, 1, 3, 'utils', false, NULL, NULL, NULL, false, 'date', 'datepickertime', false, NULL, NULL, NULL, NULL);
UPDATE audit_cat_param_user SET     WHERE parameter='to_date_vdefault', 'config', NULL, 'role_basic', NULL, 'To date:', NULL, NULL, true, 1, 4, 'utils', false, NULL, NULL, NULL, false, 'date', 'datepickertime', false, NULL, NULL, NULL, NULL);
UPDATE audit_cat_param_user SET     WHERE parameter='cf_keep_opened_edition', 'config', NULL, 'role_edit', NULL, 'Keep opened edition:', NULL, NULL, true, 8, 4, 'utils', false, NULL, NULL, NULL, false, 'boolean', 'check', false, NULL, NULL, NULL, NULL);
UPDATE audit_cat_param_user SET     WHERE parameter='edit_arc_downgrade_force', 'config', NULL, 'role_edit', 'edit', 'edit_arc_downgrade_force', NULL, NULL, true, 99, 98, 'utils', false, NULL, NULL, NULL, false, 'boolean', 'check', false, NULL, NULL, NULL, NULL);
UPDATE audit_cat_param_user SET     WHERE parameter='dim_tooltip', 'config', NULL, 'role_edit', NULL, 'Dim. tooltip:', NULL, NULL, true, 8, 2, 'utils', false, NULL, NULL, NULL, false, 'boolean', 'check', false, NULL, NULL, NULL, NULL);
UPDATE audit_cat_param_user SET     WHERE parameter='edit_arc_division_dsbl', 'config', NULL, 'role_edit', 'edit', 'Dissable arc div on node insert:', NULL, NULL, true, 8, 3, 'utils', false, NULL, NULL, NULL, false, 'boolean', 'check', false, NULL, NULL, NULL, NULL);
UPDATE audit_cat_param_user SET     WHERE parameter='plan_arc_vdivision_dsbl', 'config', NULL, 'role_edit', 'edit', 'Dissable arc vdiv on node insert:', NULL, NULL, true, 7, 9, 'utils', false, NULL, NULL, NULL, false, 'boolean', 'check', false, NULL, NULL, NULL, NULL);
UPDATE audit_cat_param_user SET     WHERE parameter='statetype_end_vdefault', 'config', NULL, 'role_edit', NULL, 'State type end:', 'SELECT id as id, name as idval FROM value_state_type WHERE id IS NOT NULL AND state = 0', NULL, true, 3, 3, 'utils', false, NULL, 'state_type', '0', false, 'string', 'combo', false, NULL, NULL, NULL, NULL);
UPDATE audit_cat_param_user SET     WHERE parameter='statetype_vdefault', 'config', NULL, 'role_edit', NULL, 'State type:', 'SELECT id as id, name as idval FROM value_state_type WHERE id IS NOT NULL AND state = 1', NULL, true, 3, 2, 'utils', false, NULL, 'state_type', '1', false, 'string', 'combo', false, NULL, NULL, NULL, NULL);
UPDATE audit_cat_param_user SET     WHERE parameter='psector_vdefault', 'config', NULL, 'role_master', NULL, 'Psector (Alternative):', 'SELECT plan_psector.psector_id AS id,  plan_psector.name as idval FROM plan_psector WHERE psector_id IS NOT NULL', NULL, true, 7, 1, 'utils', false, NULL, NULL, NULL, false, 'string', 'combo', false, NULL, NULL, NULL, NULL);
UPDATE audit_cat_param_user SET     WHERE parameter='arccat_vdefault', 'config', NULL, 'role_edit', NULL, 'Arc catalog:', 'SELECT cat_arc.id AS id, cat_arc.id as idval FROM cat_arc WHERE id IS NOT NULL', NULL, true, 10, 1, 'ud', false, NULL, 'arccat_id', NULL, false, 'string', 'combo', false, NULL, NULL, NULL, NULL);
UPDATE audit_cat_param_user SET     WHERE parameter='statetype_plan_vdefault', 'config', NULL, 'role_master', 'plan', 'State type plan:', 'SELECT id as id, name as idval FROM value_state_type WHERE id IS NOT NULL AND state = 2', NULL, true, 7, 8, 'utils', false, NULL, 'state_type', '2', false, 'string', 'combo', false, NULL, NULL, NULL, NULL);
UPDATE audit_cat_param_user SET     WHERE parameter='psector_gexpenses_vdefault', 'config', NULL, 'role_master', NULL, 'Psector gexpenses:', NULL, NULL, true, 7, 4, 'utils', false, NULL, NULL, NULL, false, 'double', 'spinbox', false, NULL, NULL, NULL, NULL);
UPDATE audit_cat_param_user SET     WHERE parameter='dma_vdefault', 'config', NULL, 'role_edit', NULL, 'Dma:', 'SELECT dma_id as id, name as idval FROM dma WHERE dma_id IS NOT NULL', 'exploitation_vdefault', true, 4, 3, 'utils', false, ' AND expl_id=', 'dma_id', NULL, false, 'string', 'combo', false, NULL, NULL, NULL, NULL);
UPDATE audit_cat_param_user SET     WHERE parameter='enddate_vdefault', 'config', NULL, 'role_edit', NULL, 'End date:', NULL, NULL, true, 3, 6, 'utils', false, NULL, 'enddate', NULL, false, 'date', 'datepickertime', false, NULL, NULL, NULL, NULL);
UPDATE audit_cat_param_user SET     WHERE parameter='municipality_vdefault', 'config', NULL, 'role_edit', NULL, 'Municipality:', 'SELECT muni_id AS id, name AS idval FROM ext_municipality WHERE muni_id IS NOT NULL', NULL, true, 4, 1, 'utils', false, NULL, 'muni_id', NULL, false, 'string', 'combo', false, NULL, NULL, NULL, NULL);
UPDATE audit_cat_param_user SET     WHERE parameter='om_param_type_vdefault', 'config', NULL, 'role_om', NULL, 'Parameter type:', 'SELECT om_visit_parameter_type.id AS id, om_visit_parameter_type.id as idval FROM om_visit_parameter_type WHERE id IS NOT NULL', NULL, true, 2, 3, 'utils', false, NULL, NULL, NULL, false, 'string', 'combo', false, NULL, NULL, NULL, NULL);
UPDATE audit_cat_param_user SET     WHERE parameter='search_exploitation_vdefault', 'config', NULL, 'role_basic', NULL, 'Search exploitation:', 'SELECT expl_id AS id , name as idval FROM exploitation WHERE expl_id IS NOT NULL', NULL, true, 1, 1, 'utils', false, NULL, 'expl_id', NULL, false, 'string', 'combo', false, NULL, NULL, NULL, NULL);
UPDATE audit_cat_param_user SET     WHERE parameter='workcat_id_end_vdefault', 'config', NULL, 'role_edit', NULL, 'workcat_id_end_vdefault', 'SELECT cat_work.id AS id,cat_work.id as idval FROM cat_work WHERE id IS NOT NULL', NULL, true, 99, 97, 'utils', false, NULL, 'workcat_id_end', '0', false, 'string', 'combo', false, NULL, NULL, NULL, NULL);
UPDATE audit_cat_param_user SET     WHERE parameter='psector_measurement_vdefault', 'config', NULL, 'role_master', NULL, 'Psector measurement:', NULL, NULL, true, 7, 7, 'utils', false, NULL, NULL, NULL, false, 'double', 'spinbox', false, NULL, NULL, NULL, NULL);
UPDATE audit_cat_param_user SET     WHERE parameter='workcat_vdefault', 'config', NULL, 'role_edit', NULL, 'Workcat id:', 'SELECT cat_work.id AS id,cat_work.id as idval FROM cat_work WHERE id IS NOT NULL', NULL, true, 3, 4, 'utils', false, NULL, 'workcat_id', '1', false, 'string', 'combo', false, NULL, NULL, NULL, NULL);
UPDATE audit_cat_param_user SET     WHERE parameter='sector_vdefault', 'config', NULL, 'role_edit', NULL, 'Sector:', 'SELECT sector_id as id, name as idval FROM sector WHERE sector_id IS NOT NULL', NULL, true, 4, 4, 'utils', false, NULL, 'sector_id', NULL, false, 'string', 'combo', false, NULL, NULL, NULL, NULL);
UPDATE audit_cat_param_user SET     WHERE parameter='elementcat_vdefault', 'config', NULL, 'role_edit', NULL, 'Element catalog:', 'SELECT cat_element.id, cat_element.id as idval FROM cat_element WHERE  id IS NOT NULL', NULL, true, 5, 1, 'utils', false, NULL, 'elementcat_id', NULL, false, 'string', 'combo', false, NULL, NULL, NULL, NULL);
UPDATE audit_cat_param_user SET     WHERE parameter='pavementcat_vdefault', 'config', NULL, 'role_edit', NULL, 'Pavement catalog:', 'SELECT cat_pavement.id AS id, cat_pavement.id as idval FROM cat_pavement WHERE id IS NOT NULL', NULL, true, 5, 2, 'utils', false, NULL, NULL, NULL, false, 'string', 'combo', false, NULL, NULL, NULL, NULL);
UPDATE audit_cat_param_user SET     WHERE parameter='soilcat_vdefault', 'config', NULL, 'role_edit', NULL, 'Soil catalog:', 'SELECT cat_soil.id AS id, cat_soil.id as idval FROM cat_soil WHERE id IS NOT NULL', NULL, true, 5, 3, 'utils', false, NULL, 'soilcat_id', NULL, false, 'string', 'combo', false, NULL, NULL, NULL, NULL);

*/



-- 2019/01/26
INSERT INTO audit_cat_function (id, function_name, sys_role_id, isdeprecated, descript) VALUES (2640, 'gw_api_getvisitmanager', 'role_om', FALSE, 'To call visit from user');
INSERT INTO audit_cat_function (id, function_name, sys_role_id, isdeprecated, descript) VALUES (2642, 'gw_api_setvisitmanagerstart', 'role_om', FALSE,'To start visit manager');
INSERT INTO audit_cat_function (id, function_name, sys_role_id, isdeprecated, descript) VALUES (2644, 'gw_api_setvisitmanagerend', 'role_om', FALSE,'To start visit manager');
INSERT INTO audit_cat_function (id, function_name, sys_role_id, isdeprecated, descript) VALUES (2646, 'gw_fct_pg2epa_recursive', 'role_epa', FALSE, 'Function to enable recursive calculations on epa workflow');
INSERT INTO audit_cat_function (id, function_name, sys_role_id, isdeprecated, descript) VALUES (2648, 'gw_fct_admin_schema_manage_fk', 'role_admin', FALSE, 'Function to manage fk');
INSERT INTO audit_cat_function (id, function_name, sys_role_id, isdeprecated, descript) VALUES (2650, 'gw_fct_admin_schema_lastprocess', 'role_admin', FALSE, 'Function to execute last process on the schema manager end');


-- 2019/01/31
INSERT INTO sys_csv2pg_cat VALUES (10, 'Export inp', 'Export inp', null, 'role_epa');
INSERT INTO sys_csv2pg_cat VALUES (11, 'Import rpt', 'Import rpt', null, 'role_epa');
INSERT INTO sys_csv2pg_cat VALUES (12, 'Import inp', 'Import inp', null, 'role_admin');

-- 2019/02/08
SELECT setval('SCHEMA_NAME.config_param_system_id_seq', (SELECT max(id) FROM config_param_system), true);
INSERT INTO config_param_system (parameter, value, data_type, context, descript) 
VALUES ('vdefault_rtc_period_seconds','2592000','integer', 'rtc', 'Default value used if ext_cat_period doesn''t have date values or they are incorrect');

-- 2019/02/14
INSERT INTO config_param_system (parameter, value, data_type, context, descript) 
VALUES ('customer_code_autofill', 'FALSE', 'boolean', 'System', 'If TRUE, when insert a new connec customer_code will be the same as connec_id');


INSERT INTO config_param_system (parameter, value, data_type, context, descript, label, dv_querytext, dv_filterbyfield, isenabled, layout_id, layout_order, project_type, dv_isparent, isautoupdate, datatype, widgettype, tooltip) 
VALUES ('nodeisert_arcendpoint', 'FALSE', 'boolean', 'edit', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO config_param_system (parameter, value, data_type, context, descript, label, dv_querytext, dv_filterbyfield, isenabled, layout_id, layout_order, project_type, dv_isparent, isautoupdate, datatype, widgettype, tooltip) 
VALUES ('orphannode_delete', 'false', 'boolean', NULL, NULL, 'Orphan node delete:', NULL, NULL, true, 13, 6, 'utils', false, false, 'boolean', 'checkbox', NULL);
INSERT INTO config_param_system (parameter, value, data_type, context, descript, label, dv_querytext, dv_filterbyfield, isenabled, layout_id, layout_order, project_type, dv_isparent, isautoupdate, datatype, widgettype, tooltip) 
VALUES ('nodetype_change_enabled', 'FALSE', 'boolean', NULL, NULL, 'nodetype_change_enabled', NULL, NULL, true, 13, 12, 'utils', false, false, 'boolean', 'checkbox', NULL);
INSERT INTO config_param_system (parameter, value, data_type, context, descript, label, dv_querytext, dv_filterbyfield, isenabled, layout_id, layout_order, project_type, dv_isparent, isautoupdate, datatype, widgettype, tooltip) 
VALUES ('samenode_init_end_control', 'true', NULL, NULL, NULL, 'Arc same node init end control:', NULL, NULL, true, 13, 2, 'utils', false, false, 'boolean', 'checkbox', NULL);
INSERT INTO config_param_system (parameter, value, data_type, context, descript, label, dv_querytext, dv_filterbyfield, isenabled, layout_id, layout_order, project_type, dv_isparent, isautoupdate, datatype, widgettype, tooltip) 
VALUES ('audit_function_control', 'TRUE', 'boolean', NULL, NULL, 'audit_function_control', NULL, NULL, false, NULL, NULL, NULL, false, false, 'boolean', 'checkbox', NULL);
INSERT INTO config_param_system (parameter, value, data_type, context, descript, label, dv_querytext, dv_filterbyfield, isenabled, layout_id, layout_order, project_type, dv_isparent, isautoupdate, datatype, widgettype, tooltip) 
VALUES ('insert_double_geometry', 'false', 'boolean', NULL, NULL, 'Double geometry enabled:', NULL, NULL, true, 13, 5, 'utils', false, false, 'boolean', 'checkbox', NULL);
INSERT INTO config_param_system (parameter, value, data_type, context, descript, label, dv_querytext, dv_filterbyfield, isenabled, layout_id, layout_order, project_type, dv_isparent, isautoupdate, datatype, widgettype, tooltip) 
VALUES ('buffer_value', '3.0', 'double precision', NULL, NULL, 'Double geometry enabled:', NULL, NULL, true, 13, 5, 'utils', false, false, 'double', 'spinbox', NULL);
INSERT INTO config_param_system (parameter, value, data_type, context, descript, label, dv_querytext, dv_filterbyfield, isenabled, layout_id, layout_order, project_type, dv_isparent, isautoupdate, datatype, widgettype, tooltip) 
VALUES ('node_proximity_control', 'true', 'boolean', NULL, NULL, 'Node proximity control:', NULL, NULL, true, 13, 3, 'utils', false, false, 'boolean', 'checkbox', NULL);
INSERT INTO config_param_system (parameter, value, data_type, context, descript, label, dv_querytext, dv_filterbyfield, isenabled, layout_id, layout_order, project_type, dv_isparent, isautoupdate, datatype, widgettype, tooltip) 
VALUES ('arc_searchnodes_control', 'true', 'boolean', NULL, NULL, 'Arc searchnodes buffer:', NULL, NULL, true, 13, 1, 'utils', false, false, 'boolean', 'checkbox', NULL);
INSERT INTO config_param_system (parameter, value, data_type, context, descript, label, dv_querytext, dv_filterbyfield, isenabled, layout_id, layout_order, project_type, dv_isparent, isautoupdate, datatype, widgettype, tooltip) 
VALUES ('connec_proximity_control', 'true', 'boolean', NULL, NULL,'Connec proximity control:', NULL, NULL, true, 13, 4, 'utils', false, false, 'boolean', 'checkbox', NULL);


-- 2019/02/24
INSERT INTO audit_cat_param_user VALUES ('visit_duration_vdef', 'visit', 'Duration for user', 'role_om', NULL, 'Visit expires time vdefault', 
'Visit duration', NULL, NULL, TRUE, 9, 9, 'utils', false, NULL, NULL, NULL, false, 'date', 'text', FALSE, NULL, '24 hours', 'grl_om', NULL, TRUE, NULL, NULL, NULL);

-- 2019/02/27 update audit_cat_function
DELETE FROM audit_cat_function;
INSERT INTO audit_cat_function VALUES (2618, 'gw_api_setsearch', 'utils', 'api function', NULL, NULL, NULL, 'Search elements by defined fields', 'role_basic', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2616, 'gw_api_setinsert', 'utils', 'api function', NULL, NULL, NULL, 'Set insert feature', 'role_basic', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2614, 'gw_api_setgo2epa', 'utils', 'api function', NULL, NULL, NULL, 'Function called to execute changes on go2epa forms', 'role_basic', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2612, 'gw_api_setfileinsert', 'utils', 'api function', NULL, NULL, NULL, 'Set insert visit file', 'role_basic', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2608, 'gw_api_setdelete', 'utils', 'api function', NULL, NULL, NULL, 'Set delete feature', 'role_basic', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2606, 'gw_api_setconfig', 'utils', 'api function', NULL, NULL, NULL, 'Set new config values', 'role_basic', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2604, 'gw_api_getvisit', 'utils', 'api function', NULL, NULL, NULL, 'Get visit form fiels', 'role_basic', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2602, 'gw_api_gettypeahead', 'utils', 'api function', NULL, NULL, NULL, 'Function called to fill typeahead widgets', 'role_basic', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2600, 'gw_api_getsearch', 'utils', 'api function', NULL, NULL, NULL, 'Get search form fields', 'role_basic', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2598, 'gw_api_getrowinsert', 'utils', 'api function', NULL, NULL, NULL, 'Function called to get eow insert', 'role_basic', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2590, 'gw_api_getlayersfromcoordinates', 'utils', 'api function', NULL, NULL, NULL, 'Get information about layer by coordinates', 'role_basic', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2588, 'gw_api_getinsertfeature', 'utils', 'api function', NULL, NULL, NULL, 'Function to insert features', 'role_basic', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2586, 'gw_api_getinfoplan', 'utils', 'api function', NULL, NULL, NULL, 'Get information about plan cost', 'role_basic', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2584, 'gw_api_getinfofromlist', 'utils', 'api function', NULL, NULL, NULL, 'Function to get info from lists', 'role_basic', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2232, 'gw_fct_rpt2pg', 'ud', 'function', NULL, NULL, NULL, 'Called when the importation from rpt file is finished.', 'role_epa', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2496, 'gw_fct_repair_arc', 'utils', 'function', NULL, NULL, NULL, 'Massive repair function. All the arcs that are not connected with extremal node will be reconected using the parameter arc_searchnodes', 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2440, 'gw_fct_utils_csv2pg', 'utils', 'function', NULL, NULL, NULL, 'This function makes importations from csv to PostgreSQL database.  Requires a previous configuration after that every csv is possible to import into database', 'role_om', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2438, 'gw_fct_plan_psector_update_geom', 'utils', 'function', NULL, NULL, NULL, 'This automatic updates the geometry of plan_psector in function of the feature related to', 'role_master', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2434, 'gw_fct_om_visit_multiplier', 'utils', 'function', NULL, NULL, NULL, 'This function enables the possibility to multiply the visit from unique one to individual ones in case of massive assignation of visit', 'role_om', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2322, 'gw_fct_rpt2pg', 'ws', 'function', NULL, NULL, NULL, 'This function is called when the importation from rpt file is finished.', 'role_epa', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2120, 'gw_fct_check_delete', 'utils', 'function', NULL, NULL, NULL, 'To check if one feature is deletable or not', 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2114, 'gw_fct_arc_divide', 'utils', 'function', NULL, NULL, NULL, 'Used to divide one arc into two news', 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2112, 'gw_fct_arc_fusion', 'utils', 'function', NULL, NULL, NULL, 'Used to fusion two arcs in a unique new one, downgrading the node in case of itâ€™s possible to o it', 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2580, 'gw_api_getinfofromcoordinates', 'utils', 'api function', NULL, NULL, NULL, 'Get information by feature coordinates', 'role_basic', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2578, 'gw_api_getinfocrossection', 'utils', 'api function', NULL, NULL, NULL, 'Function called to get info of crossection for arc features', 'role_basic', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2572, 'gw_api_getchilds', 'utils', 'api function', NULL, NULL, NULL, 'Get child view fields and data', 'role_basic', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2544, 'gw_trg_link_connecrotation_update', 'utils', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2548, 'gw_trg_om_visit', 'utils', 'trigger function', NULL, NULL, NULL, NULL, 'role_om', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1202, 'gw_trg_edit_arc', 'ud', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2570, 'gw_api_getconfig', 'utils', 'api function', NULL, NULL, NULL, 'Get configs fields and data', 'role_basic', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2566, 'gw_api_getattributetable', 'utils', 'api function', NULL, NULL, NULL, 'Get atrribute tcatalog of a feature', 'role_basic', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1204, 'gw_trg_edit_connec', 'ud', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1206, 'gw_trg_edit_gully', 'ud', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1208, 'gw_trg_edit_inp_arc', 'ud', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2502, 'gw_fct_utils_role_permisions', 'utils', 'function', NULL, NULL, NULL, 'Deprecated function used to admin role permissons.', 'role_admin', true, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1212, 'gw_trg_edit_man_arc', 'ud', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1214, 'gw_trg_edit_man_connec', 'ud', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1216, 'gw_trg_edit_man_gully', 'ud', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2426, 'gw_fct_audit_schema_repair', 'utils', 'function', NULL, NULL, NULL, 'Deprecated function used to repair schemas.', 'role_admin', true, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1346, 'gw_trg_arc_noderotation_update', 'ws', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1344, 'gw_trg_topocontrol_arc', 'ws', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1342, 'gw_trg_rtc_hydrometer', 'ws', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1340, 'gw_trg_review_audit_node', 'ws', 'trigger function', NULL, NULL, NULL, NULL, 'role_om', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1236, 'gw_trg_review_audit_arc', 'ud', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1218, 'gw_trg_edit_man_node', 'ud', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1116, 'gw_trg_edit_link', 'utils', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1114, 'gw_trg_edit_element', 'utils', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2564, 'gw_api_get_widgetjson', 'utils', 'api function', NULL, NULL, NULL, 'Get widget type of a field', 'role_basic', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2610, 'gw_api_setfields', 'utils', 'api function', NULL, NULL, NULL, 'Function called to set fields on feature', 'role_basic', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2592, 'gw_api_getlist', 'utils', 'api function', NULL, NULL, NULL, 'Function to call lists', 'role_basic', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2222, 'gw_fct_pg2epa', 'ud', 'function', NULL, NULL, NULL, 'Starts the exportation process to inp file', 'role_epa', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2224, 'gw_fct_pg2epa_nodarc', 'ud', 'function', NULL, NULL, NULL, 'Transform node to arcs (in case that flow regulator must be designed as a node)', 'role_epa', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2648, 'gw_fct_admin_schema_manage_fk', 'utils', 'function', NULL, NULL, NULL, 'Function to manage fk', 'role_admin', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2512, 'gw_fct_utils_csv2pg_import_omvisit', 'utils', 'function', NULL, NULL, NULL, 'Function imports visits from csv file into database', 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2204, 'gw_fct_anl_arc_inverted', 'ud', 'function', NULL, NULL, NULL, 'Check topology assistant. Identifies arcs that have the slope in a oposite sense that the direction', 'role_edit', false, true, 'Arcs with the inverted slope', false);
INSERT INTO audit_cat_function VALUES (2514, 'gw_fct_utils_csv2pg_import_elements', 'utils', 'function', NULL, NULL, NULL, 'Function imports elements from csv file into database', 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2516, 'gw_fct_utils_csv2pg_import_addfields', 'utils', 'function', NULL, NULL, NULL, 'Function imports personalized fields from csv file into database', 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2216, 'gw_fct_flow_exit_recursive', 'ud', 'function', NULL, NULL, NULL, 'Recursive function of flow exit', 'role_basic', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2646, 'gw_fct_pg2epa_recursive', 'utils', 'function', NULL, NULL, NULL, 'Function to enable recursive calculations on epa workflow', 'role_epa', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2106, 'gw_fct_anl_connec_duplicated', 'utils', 'function', NULL, NULL, NULL, 'Check topology assistant. To review how many connecs are duplicated (using the parameter connec duplicated tolerance)', 'role_edit', false, true, 'Connecs duplicated', false);
INSERT INTO audit_cat_function VALUES (1136, 'gw_trg_topocontrol_node', 'utils', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1138, 'gw_trg_ui_doc', 'utils', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1140, 'gw_trg_ui_element', 'utils', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2464, 'gw_fct_node_replace', 'ud', 'function', NULL, NULL, NULL, 'This function enables the possibility to replace one connected node, disconnecting temporary the associated arcs, setting state=0 to node inserting a new one on the same position and reconnecting arcs to new one', 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2422, 'gw_fct_audit_log_feature', 'utils', 'function', NULL, NULL, NULL, 'Deprecated function used to audit features. Replaced by customized function of corporate to do this', 'role_admin', true, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1336, 'gw_trg_review_audit_arc', 'ws', 'trigger function', NULL, NULL, NULL, NULL, 'role_om', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1142, 'gw_trg_vnode_proximity', 'utils', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1144, 'gw_trg_vnode_update', 'utils', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2644, 'gw_api_setvisitmanagerend', 'utils', 'api function', NULL, NULL, NULL, 'To start visit manager', 'role_om', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2414, 'gw_fct_role_permissions', 'utils', 'function', NULL, NULL, NULL, 'Grant for all relations on database the permissions needed using the audit_cat_table ', 'role_admin', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2498, 'gw_trg_visit_event_update_xy', 'utils', 'trigger function', '{"featureType":"node"}', '[{"widgetname":"visitEventUpdateXY", "label":"visitEventUpdateXY:","widgettype":"text","datatype":"float","layout_name":"grl_option_parameters","layout_order":1,"value":""}]', NULL, 'Enables the posibility to update the xcoord, ,ycoord columns using position_id and position_value.', 'role_master', false, false, 'Visit event update xy - NOT VALID', NULL);
INSERT INTO audit_cat_function VALUES (1146, 'gw_trg_node_arc_divide', 'utils', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1330, 'gw_trg_edit_unconnected', 'ws', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1328, 'gw_trg_edit_rtc_hydro_data', 'ws', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2332, 'gw_fct_pg2epa_valvestatus', 'ws', 'function', NULL, NULL, NULL, 'Function used to set the network valve status using mincut result status, epa tables status or inventory status', 'role_epa', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1326, 'gw_trg_edit_review_node', 'ws', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1324, 'gw_trg_edit_review_connec', 'ws', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1332, 'gw_trg_man_addfields_control', 'ws', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', true, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2650, 'gw_fct_admin_schema_lastprocess', 'utils', 'function', NULL, NULL, NULL, 'Function to execute last process on the schema manager end', 'role_admin', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2116, 'gw_fct_audit_function', 'utils', 'function', NULL, NULL, NULL, 'To audit all what happens wiht functions', 'role_basic', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2220, 'gw_fct_flow_trace_recursive', 'ud', 'function', NULL, NULL, NULL, 'Recursive function of flow trace', 'role_basic', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2104, 'gw_fct_anl_arc_same_startend', 'utils', 'function', NULL, NULL, NULL, 'Check topology assistant. To review how many arcs have the same node as node1 and node2', 'role_edit', false, true, 'Arcs with same start/end node', false);
INSERT INTO audit_cat_function VALUES (2632, 'gw_trg_visit_update_enddate', 'utils', 'trigger function', NULL, NULL, NULL, NULL, 'role_basic', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1228, 'gw_trg_edit_review_gully', 'ud', 'trigger function', NULL, NULL, NULL, NULL, 'role_om', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2424, 'gw_fct_audit_schema_check', 'utils', 'function', NULL, NULL, NULL, 'This function analyzes the schema', 'role_admin', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1338, 'gw_trg_review_audit_connec', 'ws', 'trigger function', NULL, NULL, NULL, NULL, 'role_om', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1322, 'gw_trg_edit_review_arc', 'ws', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1320, 'gw_trg_edit_node', 'ws', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1250, 'gw_trg_man_addfields_value_control', 'utils', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1248, 'gw_trg_gully_update', 'ud', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1246, 'gw_trg_edit_macrosector', 'ud', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1244, 'gw_trg_topocontrol_arc', 'ud', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1242, 'gw_trg_review_audit_node', 'ud', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1226, 'gw_trg_edit_review_connec', 'ud', 'trigger function', NULL, NULL, NULL, NULL, 'role_om', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1224, 'gw_trg_edit_review_arc', 'ud', 'trigger function', NULL, NULL, NULL, NULL, 'role_om', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1232, 'gw_trg_edit_subcatchment', 'ud', 'trigger function', NULL, NULL, NULL, NULL, 'role_epa', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1230, 'gw_trg_edit_review_node', 'ud', 'trigger function', NULL, NULL, NULL, NULL, 'role_om', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1222, 'gw_trg_edit_raingage', 'ud', 'trigger function', NULL, NULL, NULL, NULL, 'role_epa', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1220, 'gw_trg_edit_node', 'ud', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2642, 'gw_api_setvisitmanagerstart', 'utils', 'api function', NULL, NULL, NULL, 'To start visit manager', 'role_om', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2640, 'gw_api_getvisitmanager', 'utils', 'api function', NULL, NULL, NULL, 'To call visit from user', 'role_om', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2596, 'gw_api_getpermissions', 'utils', 'api function', NULL, NULL, NULL, 'Get information about permissions', 'role_basic', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2582, 'gw_api_getinfofromid', 'utils', 'api function', NULL, NULL, NULL, 'Get information by feature id', 'role_basic', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2576, 'gw_api_getgo2epa', 'utils', 'api function', NULL, NULL, NULL, 'Function called to get the epa forms', 'role_basic', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2574, 'gw_api_getfeatureinsert', 'utils', 'api function', NULL, NULL, NULL, 'Function to insert features', 'role_basic', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2500, 'gw_trg_edit_field_node', 'utils', 'trigger function', NULL, NULL, NULL, 'To update values on field', 'role_om', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2634, 'gw_fct_refresh_mat_view', 'utils', 'function', NULL, NULL, NULL, 'Refresh mat views', 'role_basic', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2636, 'gw_fct_admin_schema_renameviews', 'utils', 'function', NULL, NULL, NULL, 'Rename views', 'role_admin', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2552, 'gw_fct_admin_role_permissions', 'utils', 'function', NULL, NULL, NULL, 'Function that assignes roles to database', 'role_admin', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2550, 'gw_fct_admin_schema_dropdeprecated_rel', 'utils', 'function', NULL, NULL, NULL, 'Function that eliminates deprecated sequences, views, tables and functions', 'role_admin', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2638, 'gw_fct_utils_update_dma_hydroval', 'ws', 'function', NULL, NULL, NULL, 'Function to update the values of hydrometers on dmas', 'role_epa', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2122, 'gw_fct_clone_schema', 'utils', 'function', NULL, NULL, NULL, 'To clone schema', 'role_admin', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2510, 'gw_fct_utils_csv2pg_import_dbprices', 'utils', 'function', NULL, NULL, NULL, 'Function imports prices from csv file into database', 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2244, 'gw_fct_mincut_result_overlap', 'ws', 'function', NULL, NULL, NULL, 'Function used to overlap mincuts in order to planificate possible conflicts one each other', 'role_om', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2324, 'gw_fct_pg2epa_check_data', 'ws', 'function', NULL, NULL, NULL, 'The function allows the possibility to find errors and data inconsistency before first exportation to EPA models. It checks on EPA feature tables hydraulic mandatory data to enable the simulation.', 'role_epa', false, true, 'Check epa missing/wrong data before go2epa', false);
INSERT INTO audit_cat_function VALUES (1334, 'gw_trg_node_update', 'ws', 'trigger function', NULL, NULL, NULL, NULL, 'role_om', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2562, 'gw_api_get_formfields', 'utils', 'api function', NULL, NULL, NULL, 'Get fields of a form', 'role_basic', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2490, 'gw_trg_edit_review_connec', 'ws', 'trigger function', NULL, NULL, NULL, NULL, 'role_om', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2492, 'gw_trg_edit_review_audit_connec', 'ws', 'trigger function', NULL, NULL, NULL, NULL, 'role_om', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2218, 'gw_fct_flow_trace', 'ud', 'function', NULL, NULL, NULL, 'Analisys of the network identifying all arc and nodes upstream of the selected node.', 'role_basic', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2430, 'gw_fct_epa_audit_check_data', 'utils', 'function', NULL, NULL, NULL, 'The function allows the possibility to find errors and data inconsistency before first exportation to EPA models. It checks on EPA feature tables hydraulic mandatory data to enable the simulation.', 'role_epa', false, true, 'Check epa missing/wrong data before go2epa', false);
INSERT INTO audit_cat_function VALUES (2206, 'gw_fct_anl_node_exit_upper_intro', 'ud', 'function', NULL, NULL, NULL, 'Check topology assistant.  Identifies nodes that all the exit arcs are upper that all the entry arcs. ', 'role_edit', false, true, 'Nodes with exit arcs uppers than entry arcs', false);
INSERT INTO audit_cat_function VALUES (2214, 'gw_fct_flow_exit', 'ud', 'function', NULL, NULL, NULL, 'Analisys of the network identifying all arc and nodes downstream of the selected node.', 'role_basic', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1318, 'gw_trg_edit_man_node', 'ws', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1314, 'gw_trg_edit_man_arc', 'ws', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1312, 'gw_trg_edit_macrodma', 'ws', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1310, 'gw_trg_edit_inp_node', 'ws', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1308, 'gw_trg_edit_inp_demand', 'ws', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1306, 'gw_trg_edit_inp_arc', 'ws', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1304, 'gw_trg_edit_connec', 'ws', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1302, 'gw_trg_edit_arc', 'ws', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2330, 'gw_fct_pg2epa_rtc', 'ws', 'function', NULL, NULL, NULL, 'Function used to connect CRM values on the EPA exportation', 'role_epa', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2558, 'gw_api_get_featureinfo', 'utils', 'api function', NULL, NULL, NULL, 'Function to provide information aboute feature', 'role_basic', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2560, 'gw_api_get_featureupsert', 'utils', 'api function', NULL, NULL, NULL, 'Function to upsert features', 'role_basic', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2594, 'gw_api_getmessage', 'utils', 'api function', NULL, NULL, NULL, 'Get message', 'role_basic', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2400, 'gw_fct_mincut_inv_flowtrace', 'ws', 'function', NULL, NULL, NULL, 'This function calculates the area afected by the mincut valve status', 'role_om', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2402, 'gw_fct_mincut_inv_flowtrace_engine', 'ws', 'function', NULL, NULL, NULL, 'Recursive function of mincut', 'role_om', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2318, 'gw_fct_pg2epa_pump_additional', 'ws', 'function', NULL, NULL, NULL, 'This function creates new flow lines for the same pump station as pump as user have been defined on the table inp_pump_additional.', 'role_epa', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2306, 'gw_fct_mincut_engine', 'ws', 'function', NULL, NULL, NULL, 'Recursive function of mincut', 'role_om', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2520, 'gw_fct_utils_csv2pg_import_epanet_rpt', 'ws', 'function', NULL, NULL, NULL, 'Function imports epanet model results from rpt file into database', 'role_epa', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2508, 'gw_fct_getinsertform_vdef', 'utils', 'function', NULL, NULL, NULL, 'Function to serve vdefault for user', 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2310, 'gw_fct_mincut_flowtrace_engine', 'ws', 'function', NULL, NULL, NULL, 'Recursive function of mincut', 'role_om', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2538, 'gw_fct_dinlet', 'ws', 'function', NULL, NULL, NULL, 'Function to identify inlets of network', 'role_om', false, true, 'Dynamic inlet', false);
INSERT INTO audit_cat_function VALUES (2230, 'gw_fct_repair_arc_searchnodes', 'ud', 'function', NULL, NULL, NULL, 'Massive repair function. All the arcs that are not connected with extremal node will be reconected using the parameter arc_searchnodes (from config table)', 'role_edit', false, true, 'Reconnect arcs to closer nodes', false);
INSERT INTO audit_cat_function VALUES (2320, 'gw_fct_repair_arc_searchnodes', 'ws', 'function', NULL, NULL, NULL, 'Massive repair function. All the arcs that are not connected with extremal node will be reconected using the parameter arc_searchnodes (from config table)', 'role_edit', false, true, 'Reconnect arcs to closer nodes', false);
INSERT INTO audit_cat_function VALUES (2308, 'gw_fct_mincut_flowtrace', 'ws', 'function', NULL, NULL, NULL, 'This function calculates what is the area afected for the mincut valve status', 'role_om', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2428, 'gw_fct_edit_element_multiplier', 'utils', 'function', NULL, NULL, NULL, 'This function multiplies on element assigned to multiple features using one unique assignation', 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2234, 'gw_fct_pg2epa_fill_data', 'ud', 'function', NULL, NULL, NULL, 'Function used to fill data from inventory tables to rpt_inp tables converting nod2arcs features from one node to two nodes and one arc', 'role_epa', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2236, 'gw_fct_pg2epa_join_virtual', 'ud', 'function', NULL, NULL, NULL, 'Function used to join arcs connecteds trhough on virtual arc in order to don''t send to the EPA model that virtual element', 'role_epa', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2238, 'gw_fct_pg2epa_nod2arc_data', 'ud', 'function', NULL, NULL, NULL, 'Function used to fill data for nod2arc features', 'role_epa', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2240, 'gw_fct_pg2epa_nod2arc_geom', 'ud', 'function', NULL, NULL, NULL, 'Function used to create new geometries for that nodarc with more than one element (additional flow regulators)', 'role_epa', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2242, 'gw_fct_cad_add_relative_point', 'utils', 'function', NULL, NULL, NULL, 'Function used as CAD assistant for edit user to place support points using relative coordinates', 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2328, 'gw_fct_pg2epa_fill_data', 'ws', 'function', NULL, NULL, NULL, 'Function used to fill data from inventory tables to rpt_inp tables converting nod2arcs features from one node to two nodes and one arc', 'role_epa', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1238, 'gw_trg_review_audit_connec', 'ud', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1210, 'gw_trg_edit_inp_node', 'ud', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1118, 'gw_trg_edit_om_visits', 'utils', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2546, 'gw_fct_admin_schema_update', 'utils', 'function', NULL, NULL, NULL, 'Deprecated function used to update schemas', 'role_admin', true, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2432, 'gw_fct_module_activate', 'utils', 'function', NULL, NULL, NULL, 'Deprecated function used to enable the possibility to activate modules', 'role_admin', true, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1316, 'gw_trg_edit_man_connec', 'ws', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1240, 'gw_trg_review_audit_gully', 'ud', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2542, 'gw_trg_arc_vnodelink_update', 'utils', 'trigger function', NULL, NULL, NULL, 'Function recreates link when arc was updated', 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2486, 'gw_trg_edit_review_arc', 'ws', 'trigger function', NULL, NULL, NULL, NULL, 'role_om', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2488, 'gw_trg_edit_review_audit_arc', 'ws', 'trigger function', NULL, NULL, NULL, NULL, 'role_om', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2436, 'gw_fct_plan_audit_check_data', 'utils', 'function', NULL, NULL, NULL, 'The function allows the possibility to find errors and data inconsistency before first budget calculation. It checks on PLAN feature tables prices and geometry mandatory data to enable the calculation.', 'role_master', false, true, 'Check plan missing/wrong data before prices', false);
INSERT INTO audit_cat_function VALUES (2534, 'gw_fct_repair_link', 'utils', 'function', NULL, NULL, NULL, 'Function allows to conected link geometries defined by user with the network', 'role_edit', false, true, 'To repair unconnected links', false);
INSERT INTO audit_cat_function VALUES (2530, 'gw_fct_utils_csv2pg_import_swmm_rpt', 'ud', 'function', NULL, NULL, NULL, 'Function imports swmm model results from rpt file into database', 'role_epa', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2528, 'gw_fct_utils_csv2pg_export_swmm_inp', 'ud', 'function', NULL, NULL, NULL, 'Function exports swmm model data from database into inp file', 'role_epa', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2524, 'gw_fct_utils_csv2pg_import_swmm_inp', 'ud', 'function', NULL, NULL, NULL, 'Function imports network data from swmm inp file into database', 'role_admin', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2532, 'gw_fct_utils_csv2pg_import_epa_inp', 'utils', 'function', NULL, NULL, NULL, 'Function indicates the correct inp data import depending on project type', 'role_epa', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2522, 'gw_fct_utils_csv2pg_import_epanet_inp', 'ws', 'function', NULL, NULL, NULL, 'Function imports network data from epanet inp file into database', 'role_admin', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2526, 'gw_fct_utils_csv2pg_export_epanet_inp', 'ws', 'function', NULL, NULL, NULL, 'Function exports epanet model data from database into inp file', 'role_epa', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2536, 'gw_fct_utils_csv2pg_import_epa_rpt', 'ws', 'function', NULL, NULL, NULL, 'Function indicates the correct rpt data import depending on project type', 'role_epa', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2302, 'gw_fct_anl_node_topological_consistency', 'ws', 'function', NULL, NULL, NULL, 'Check topology assistant. Helps user  to identify nodes with more /less arcs that must be connected in function of the num_arcs field (node_type table)', 'role_om', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2504, 'gw_fct_utils_csv2pg_importblock', 'utils', 'function', NULL, NULL, NULL, 'Enables the possibility to import dxf blocks', 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2126, 'gw_fct_node_replace', 'utils', 'function', NULL, NULL, NULL, 'Replace one node on service for another one, copying all attributes, setting old one on obsolete and reconnecting arcs to the new node', 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2316, 'gw_fct_pg2epa_nod2arc', 'ws', 'function', NULL, NULL, NULL, 'This functions transform node to arcs (in case of valve nodes and pump nodes). ', 'role_epa', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2554, 'gw_fct_admin_schema_utils_fk', 'utils', 'function', NULL, NULL, NULL, 'Function that creates foreign keys for utils schema', 'role_admin', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2506, 'gw_fct_create_utils_trigger', 'utils', 'function', NULL, NULL, NULL, 'Function to create fk to related tables on utils schema', 'role_admin', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2540, 'gw_fct_inlet_flowtrace', 'ws', 'function', NULL, NULL, NULL, 'Auxiliar function to calculate flowtrace of inlet', 'role_om', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2312, 'gw_fct_mincut_valve_unaccess', 'ws', 'function', NULL, NULL, NULL, 'Insert into anl_mincut_result_valve_unaccess valve non accessibles on a specific mincut.', 'role_om', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2124, 'gw_fct_connec_to_network', 'utils', 'function', NULL, NULL, NULL, 'Massive builder assistant. This function built as many link/vnodes as user connec/gully selects', 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2102, 'gw_fct_anl_arc_no_startend_node', 'utils', 'function', '{"featureType":"node", "durationType":"long"}', '[{"widgetname":"anl_arc_no_startend_node", "label":"anl_arc_no_startend_node:","widgettype":"text","datatype":"float","layout_name":"grl_option_parameters","layout_order":1,"value":""}]', NULL, 'Check topology assistant. To review how many arcs donâ€™t have start or end nodes', 'role_edit', false, true, 'Arcs without node start/end', true);
INSERT INTO audit_cat_function VALUES (2110, 'gw_fct_anl_node_orphan', 'utils', 'function', '{"featureType":"node", "durationType":"short"}', '[{"widgetname":"nodeOrphan", "label":"Node orphan:","widgettype":"text","datatype":"float","layout_name":"grl_option_parameters","layout_order":1,"value":""}]', NULL, 'Check topology assistant. To review how many nodes are disconnected of the network', 'role_edit', false, true, 'Nodes orphan', true);
INSERT INTO audit_cat_function VALUES (1234, 'gw_trg_node_update', 'ud', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2468, 'gw_trg_edit_review_audit_node', 'ud', 'trigger function', NULL, NULL, NULL, NULL, 'role_om', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2454, 'gw_fct_edit_node_switch_arc_id', 'utils', 'function', NULL, NULL, NULL, 'Deprecated function used to switch arc_id', 'role_edit', true, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2456, 'gw_fct_pg2epa_dscenario', 'ws', 'function', NULL, NULL, NULL, 'This function controls the demand scenario on epanet file exportation', 'role_epa', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2130, 'gw_fct_state_control', 'utils', 'function', '{"featureType":"node", "durationType":"short"}', '[{"widgetname":"stateControl", "label":"State Control:","widgettype":"text","datatype":"float","layout_name":"grl_option_parameters","layout_order":1,"value":""}]', NULL, 'To control permisions of users to manage with state=2 and check inconsistency of state updates for arc / nodes, dissabling the update to state=0 if there are arcs (for node) and connecs (for arcs) with state 1 or 2', 'role_admin', false, true, 'State control - NOT VALID', true);
INSERT INTO audit_cat_function VALUES (2132, 'gw_state_searchnodes', 'utils', 'function', '{"featureType":"node"}', '[{"widgetname":"stateSearchnodes", "label":"State Searchnodesl:","widgettype":"text","datatype":"float","layout_name":"grl_option_parameters","layout_order":1,"value":""}]', NULL, 'Deprecated function used to check extreme nodes from arcs acording the tolerance parameter defined by user (arc_searchnodes) and the state topologic rules', 'role_admin', true, true, 'State searcnhodes - NOT VALID', true);
INSERT INTO audit_cat_function VALUES (2128, 'gw_fct_plan_estimate_result', 'utils', 'function', '{"featureType":"node", "durationType":"short"}', '[{"widgetname":"estimateResult", "label":"Estimate Result:","widgettype":"text","datatype":"float","layout_name":"grl_option_parameters","layout_order":1,"value":""}]', NULL, 'Used to insert economic results from calculations on the plan_result_table', 'role_master', false, true, 'Plan estimate result - NOT VALID', true);
INSERT INTO audit_cat_function VALUES (2460, 'gw_trg_edit_man_connec_pol', 'ws', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2462, 'gw_trg_edit_man_node_pol', 'ws', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2470, 'gw_trg_edit_review_arc', 'ud', 'trigger function', NULL, NULL, NULL, NULL, 'role_om', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2472, 'gw_trg_edit_review_audit_arc', 'ud', 'trigger function', NULL, NULL, NULL, NULL, 'role_om', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2474, 'gw_trg_edit_review_connec', 'ud', 'trigger function', NULL, NULL, NULL, NULL, 'role_om', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2476, 'gw_trg_edit_review_audit_connec', 'ud', 'trigger function', NULL, NULL, NULL, NULL, 'role_om', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2478, 'gw_trg_edit_review_gully', 'ud', 'trigger function', NULL, NULL, NULL, NULL, 'role_om', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2480, 'gw_trg_edit_review_audit_gully', 'ud', 'trigger function', NULL, NULL, NULL, NULL, 'role_om', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2482, 'gw_trg_edit_review_node', 'ws', 'trigger function', NULL, NULL, NULL, NULL, 'role_om', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2484, 'gw_trg_edit_review_audit_node', 'ws', 'trigger function', NULL, NULL, NULL, NULL, 'role_om', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1134, 'gw_trg_review_audit_node', 'utils', 'trigger function', NULL, NULL, NULL, NULL, 'role_om', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1126, 'gw_trg_edit_vnode', 'utils', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1124, 'gw_trg_edit_sector', 'utils', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1122, 'gw_trg_edit_samplepoint', 'utils', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1120, 'gw_trg_edit_plan_psector', 'utils', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1128, 'gw_trg_man_addfields_control', 'utils', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1132, 'gw_trg_review_audit_arc', 'utils', 'trigger function', NULL, NULL, NULL, NULL, 'role_om', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2210, 'gw_fct_anl_node_sink', 'ud', 'function', NULL, NULL, NULL, 'Check topology assistant. Identifies nodes not disconnecteds without exit arcs.', 'role_edit', false, true, 'Nodes as a outfall without outlet arcs', false);
INSERT INTO audit_cat_function VALUES (2208, 'gw_fct_anl_node_flowregulator', 'ud', 'function', NULL, NULL, NULL, 'Check topology assistant.  Identifies nodes with more than one exit arc', 'role_edit', false, true, 'Nodes with more than one exit', false);
INSERT INTO audit_cat_function VALUES (2212, 'gw_fct_anl_node_topological_consistency', 'ud', 'function', NULL, NULL, NULL, 'Check topology assistant. Helps user  to identify nodes with more /less arcs that must be connected in function of the num_arcs field (node_type table)', 'role_edit', false, true, 'Topological consistency', false);
INSERT INTO audit_cat_function VALUES (2518, 'gw_fct_utils_csv2pg_export_epa_inp', 'utils', 'function', NULL, NULL, NULL, 'Function indicates the correct inp data export depending on project type', 'role_epa', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1130, 'gw_trg_plan_psector_x_arc', 'utils', 'trigger function', NULL, NULL, NULL, NULL, 'role_master', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2630, 'gw_api_getgeometry', 'utils', 'api function', NULL, NULL, NULL, 'Function called to pass geometry to client projects', 'role_basic', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2628, 'gw_api_gettoolbarbuttons', 'utils', 'api function', NULL, NULL, NULL, 'Function called to define toolbar on client projects', 'role_basic', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2622, 'gw_api_setvisit', 'utils', 'api function', NULL, NULL, NULL, 'Set new visit values', 'role_basic', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2620, 'gw_api_setsearch_add', 'utils', 'api function', NULL, NULL, NULL, 'Search address by defined fields', 'role_basic', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2466, 'gw_trg_edit_review_node', 'ud', 'trigger function', NULL, NULL, NULL, NULL, 'role_om', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2626, 'gw_fct_json_object_set_key', 'utils', 'function', NULL, NULL, NULL, 'Auxiliar function with goal to delete json keys', 'role_basic', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2624, 'gw_fct_json_object_delete_keys', 'utils', 'function', NULL, NULL, NULL, 'Auxiliar function with goal to delete json keys', 'role_basic', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2444, 'gw_trg_audit_log_feature', 'utils', 'trigger function', NULL, NULL, NULL, NULL, 'role_admin', true, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2416, 'gw_trg_edit_man_gully_pol', 'ud', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2418, 'gw_trg_edit_man_node_pol', 'ud', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2420, 'gw_trg_flw_regulator', 'ud', 'trigger function', NULL, NULL, NULL, NULL, 'role_epa', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2458, 'gw_trg_edit_cat_node', 'ws', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2452, 'gw_trg_selector_expl', 'utils', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2450, 'gw_trg_psector_selector', 'utils', 'trigger function', NULL, NULL, NULL, NULL, 'role_master', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2448, 'gw_trg_edit_psector_x_other', 'utils', 'trigger function', NULL, NULL, NULL, NULL, 'role_master', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2446, 'gw_trg_edit_psector', 'utils', 'trigger function', NULL, NULL, NULL, NULL, 'role_master', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2442, 'gw_trg_node_arc_divide', 'utils', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2228, 'gw_fct_pg2epa_dump_subcatch', 'ud', 'function', NULL, NULL, NULL, 'Exports the subcatchments in case user have been ckecked the checkbox on form of xportation', 'role_epa', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1112, 'gw_trg_edit_dma', 'utils', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1110, 'gw_trg_edit_dimensions', 'utils', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1108, 'gw_trg_connec_update', 'utils', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1106, 'gw_trg_connec_proximity', 'utils', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1104, 'gw_trg_arc_orphannode_delete', 'utils', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (1102, 'gw_trg_arc_noderotation_update', 'utils', 'trigger function', NULL, NULL, NULL, NULL, 'role_edit', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2304, 'gw_fct_mincut', 'ws', 'function', NULL, NULL, NULL, 'This function proposes what valves must be closed in a mincut operation', 'role_om', false, true, 'Massive mincut process', false);
INSERT INTO audit_cat_function VALUES (2118, 'gw_fct_built_nodefromarc', 'utils', 'function', NULL, NULL, NULL, 'Massive builder assistant. Built as many nodes as network need to achieve the topologic rules. To do this, all nodes are inserted using the default values of user (catalog, state...)', 'role_edit', false, true, 'Buid nodes from start/end of arc', false);
INSERT INTO audit_cat_function VALUES (2314, 'gw_fct_pg2epa', 'ws', 'function', NULL, NULL, NULL, 'This function starts the exportation process to inp file', 'role_epa', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2226, 'gw_fct_pg2epa_flowreg_additional', 'ud', 'function', NULL, NULL, NULL, 'Creates new flow regulator for the same node flow regulator (nodarc) as user have been defined on the tables enabled to do this (inp_flwreg-*)', 'role_epa', false, false, NULL, NULL);
INSERT INTO audit_cat_function VALUES (2108, 'gw_fct_anl_node_duplicated', 'utils', 'function', '{"featureType":"node", "durationType":"short"}', '[{"widgetname":"nodeTolerance", "label":"Node tolerance:", "widgettype":"spinbox","datatype":"float","layout_name":"grl_option_parameters","layout_order":1,"value":0},{"widgetname":"nodeTolerance2", "label":"Node tolerance2:", "widgettype":"text","datatype":"float","layout_name":"grl_option_parameters","layout_order":2,"value":""},{"label": "Headloss:","widgetname": "inp_options_headloss","value": "H-W","datatype": "text","widgettype": "combo","layout_order": 3,"layout_name": "grl_option_parameters","comboIds": ["C-M","D-W","H-W"],"selectedId": "H-W","comboNames": ["C-M","D-W","H-W"]}]', NULL, 'Check topology assistant. To review how many nodes are duplicated (using the parameter node duplicated tolerance)', 'role_edit', false, true, 'Nodes duplicated', true);
INSERT INTO audit_cat_function VALUES (2202, 'gw_fct_anl_arc_intersection', 'ud', 'function', NULL, NULL, NULL, 'Check topology assistant.  Identifies intersections againts on the arc table', 'role_edit', false, true, 'Arcs intersected one againts others', false);
