/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/


SET search_path = SCHEMA_NAME, public, pg_catalog;

CREATE OR REPLACE VIEW v_state_gully AS 
(
         SELECT gully.gully_id, arc_id
           FROM selector_state,
            selector_expl,
            gully
          WHERE gully.state = selector_state.state_id AND gully.expl_id = selector_expl.expl_id AND selector_state.cur_user = "current_user"()::text AND selector_expl.cur_user = "current_user"()::text
        EXCEPT
         SELECT plan_psector_x_gully.gully_id, plan_psector_x_gully.arc_id
           FROM selector_psector,
            selector_expl,
            plan_psector_x_gully
             JOIN plan_psector ON plan_psector.psector_id = plan_psector_x_gully.psector_id
          WHERE plan_psector_x_gully.psector_id = selector_psector.psector_id AND selector_psector.cur_user = "current_user"()::text AND plan_psector_x_gully.state = 0 AND plan_psector.expl_id = selector_expl.expl_id AND selector_expl.cur_user = "current_user"()::text
) UNION
 SELECT plan_psector_x_gully.gully_id, plan_psector_x_gully.arc_id
   FROM selector_psector,
    selector_expl,
    plan_psector_x_gully
     JOIN plan_psector ON plan_psector.psector_id = plan_psector_x_gully.psector_id
  WHERE plan_psector_x_gully.psector_id = selector_psector.psector_id AND selector_psector.cur_user = "current_user"()::text AND plan_psector_x_gully.state = 1 AND plan_psector.expl_id = selector_expl.expl_id AND selector_expl.cur_user = "current_user"()::text;

  
  
 
CREATE OR REPLACE VIEW v_edit_connec AS 
 SELECT connec.connec_id,
    connec.code,
    connec.customer_code,
    connec.top_elev,
    connec.y1,
    connec.y2,
    connec.connecat_id,
    connec.connec_type,
    connec_type.type AS sys_type,
    connec.private_connecat_id,
    cat_connec.matcat_id AS cat_matcat_id,
    connec.sector_id,
    sector.macrosector_id,
    connec.demand,
    connec.state,
    connec.state_type,
    connec.connec_depth,
    connec.connec_length,
    v_state_connec.arc_id,
    connec.annotation,
    connec.observ,
    connec.comment,
    cat_connec.label,
    connec.dma_id,
    connec.soilcat_id,
    connec.function_type,
    connec.category_type,
    connec.fluid_type,
    connec.location_type,
    connec.workcat_id,
    connec.workcat_id_end,
    connec.buildercat_id,
    connec.builtdate,
    connec.enddate,
    connec.ownercat_id,
    connec.muni_id,
    connec.postcode,
    connec.streetaxis_id,
    connec.postnumber,
    connec.postcomplement,
    connec.streetaxis2_id,
    connec.postnumber2,
    connec.postcomplement2,
    connec.descript,
    cat_connec.svg,
    connec.rotation,
    concat(connec_type.link_path, connec.link) AS link,
    connec.verified,
    connec.the_geom,
    connec.undelete,
    connec.featurecat_id,
    connec.feature_id,
    connec.label_x,
    connec.label_y,
    connec.label_rotation,
    connec.accessibility,
    connec.diagonal,
    connec.publish,
    connec.inventory,
    connec.uncertain,
    dma.macrodma_id,
    connec.expl_id,
    connec.num_value
   FROM connec
     JOIN v_state_connec ON connec.connec_id::text = v_state_connec.connec_id::text
     JOIN cat_connec ON connec.connecat_id::text = cat_connec.id::text
     LEFT JOIN ext_streetaxis ON connec.streetaxis_id::text = ext_streetaxis.id::text
     LEFT JOIN dma ON connec.dma_id = dma.dma_id
     LEFT JOIN sector ON connec.sector_id = sector.sector_id
     LEFT JOIN connec_type ON connec.connec_type::text = connec_type.id::text; 

	 

CREATE OR REPLACE VIEW v_edit_gully AS 
 SELECT gully.gully_id,
    gully.code,
    gully.top_elev,
    gully.ymax,
    gully.sandbox,
    gully.matcat_id,
    gully.gully_type,
    gully_type.type AS sys_type,
    gully.gratecat_id,
    cat_grate.matcat_id AS cat_grate_matcat,
    gully.units,
    gully.groove,
    gully.siphon,
    gully.connec_arccat_id,
    gully.connec_length,
    gully.connec_depth,
    v_state_gully.arc_id,
    gully.sector_id,
    sector.macrosector_id,
    gully.state,
    gully.state_type,
    gully.annotation,
    gully.observ,
    gully.comment,
    cat_grate.label,
    gully.dma_id,
    gully.soilcat_id,
    gully.function_type,
    gully.category_type,
    gully.fluid_type,
    gully.location_type,
    gully.workcat_id,
    gully.workcat_id_end,
    gully.buildercat_id,
    gully.builtdate,
    gully.enddate,
    gully.ownercat_id,
    gully.muni_id,
    gully.postcode,
    gully.streetaxis_id,
    gully.postnumber,
    gully.postcomplement,
    gully.streetaxis2_id,
    gully.postnumber2,
    gully.postcomplement2,
    gully.descript,
    cat_grate.svg,
    gully.rotation,
    concat(gully_type.link_path, gully.link) AS link,
    gully.verified,
    gully.the_geom,
    gully.undelete,
    gully.featurecat_id,
    gully.feature_id,
    gully.label_x,
    gully.label_y,
    gully.label_rotation,
    gully.publish,
    gully.inventory,
    gully.expl_id,
    dma.macrodma_id,
    gully.uncertain,
    gully.num_value
   FROM gully
     JOIN v_state_gully ON gully.gully_id::text = v_state_gully.gully_id::text
     LEFT JOIN cat_grate ON gully.gratecat_id::text = cat_grate.id::text
     LEFT JOIN ext_streetaxis ON gully.streetaxis_id::text = ext_streetaxis.id::text
     LEFT JOIN dma ON gully.dma_id = dma.dma_id
     LEFT JOIN sector ON gully.sector_id = sector.sector_id
     LEFT JOIN gully_type ON gully.gully_type::text = gully_type.id::text;
  

-- View: v_edit_link

-- DROP VIEW v_edit_link;

CREATE OR REPLACE VIEW v_edit_link AS 
 SELECT link.link_id,
    link.feature_type,
    link.feature_id,
    sector.macrosector_id,
    dma.macrodma_id,
    link.exit_type,
    link.exit_id,
        CASE
            WHEN link.feature_type::text = 'CONNEC'::text THEN v_edit_connec.sector_id
            ELSE vnode.sector_id
        END AS sector_id,
        CASE
            WHEN link.feature_type::text = 'CONNEC'::text THEN v_edit_connec.dma_id
            ELSE vnode.dma_id
        END AS dma_id,
        CASE
            WHEN link.feature_type::text = 'CONNEC'::text THEN v_edit_connec.expl_id
            ELSE vnode.expl_id
        END AS expl_id,
    link.state,
    st_length2d(link.the_geom) AS gis_length,
    link.userdefined_geom,
        CASE
            WHEN plan_psector_x_connec.link_geom IS NULL THEN link.the_geom
            ELSE plan_psector_x_connec.link_geom
        END AS the_geom,
        CASE
            WHEN plan_psector_x_connec.link_geom IS NULL THEN false
            ELSE true
        END AS ispsectorgeom
   FROM link
     LEFT JOIN vnode ON link.feature_id::text = vnode.vnode_id::text AND link.feature_type::text = 'VNODE'::text
     JOIN v_edit_connec ON link.feature_id::text = v_edit_connec.connec_id::text
     JOIN arc USING (arc_id)
     JOIN sector ON sector.sector_id::text = v_edit_connec.sector_id::text
     JOIN dma ON dma.dma_id::text = v_edit_connec.dma_id::text OR dma.dma_id::text = vnode.dma_id::text
     LEFT JOIN plan_psector_x_connec USING (arc_id, connec_id)
UNION
 SELECT link.link_id,
    link.feature_type,
    link.feature_id,
    sector.macrosector_id,
    dma.macrodma_id,
    link.exit_type,
    link.exit_id,
        CASE
            WHEN link.feature_type::text = 'GULLY'::text THEN v_edit_gully.sector_id
            ELSE vnode.sector_id
        END AS sector_id,
        CASE
            WHEN link.feature_type::text = 'GULLY'::text THEN v_edit_gully.dma_id
            ELSE vnode.dma_id
        END AS dma_id,
        CASE
            WHEN link.feature_type::text = 'GULLY'::text THEN v_edit_gully.expl_id
            ELSE vnode.expl_id
        END AS expl_id,
    link.state,
    st_length2d(link.the_geom) AS gis_length,
    link.userdefined_geom,
        CASE
            WHEN plan_psector_x_gully.link_geom IS NULL THEN link.the_geom
            ELSE plan_psector_x_gully.link_geom
        END AS the_geom,
        CASE
            WHEN plan_psector_x_gully.link_geom IS NULL THEN false
            ELSE true
        END AS ispsectorgeom
   FROM link
     LEFT JOIN vnode ON link.feature_id::text = vnode.vnode_id::text AND link.feature_type::text = 'VNODE'::text
     JOIN v_edit_gully ON link.feature_id::text = v_edit_gully.gully_id::text
     JOIN arc USING (arc_id)
     JOIN sector ON sector.sector_id::text = v_edit_gully.sector_id::text
     JOIN dma ON dma.dma_id::text = v_edit_gully.dma_id::text OR dma.dma_id::text = vnode.dma_id::text
     LEFT JOIN plan_psector_x_gully USING (arc_id, gully_id);




CREATE OR REPLACE VIEW v_edit_vnode AS 
 SELECT vnode.vnode_id,
    vnode.vnode_type,
    vnode.sector_id,
    vnode.dma_id,
    vnode.state,
    vnode.annotation,
    case when vnode_geom IS NULL THEN vnode.the_geom ELSE vnode_geom END AS the_geom, 
    vnode.expl_id
   FROM vnode 
   JOIN v_edit_link ON exit_id::integer=vnode_id AND exit_type='VNODE'
   join v_edit_connec ON v_edit_link.feature_id=connec_id
   join arc USING (arc_id)
   left join plan_psector_x_connec USING (arc_id, connec_id)
   UNION
 SELECT vnode.vnode_id,
    vnode.vnode_type,
    vnode.sector_id,
    vnode.dma_id,
    vnode.state,
    vnode.annotation,
    case when vnode_geom IS NULL THEN vnode.the_geom ELSE vnode_geom END, 
    vnode.expl_id
   FROM vnode 
   JOIN v_edit_link ON exit_id::integer=vnode_id AND exit_type='VNODE'
   join v_edit_gully ON v_edit_link.feature_id=gully_id
   join arc USING (arc_id)
   left join plan_psector_x_gully USING (arc_id, gully_id) ;
   
   
  
 CREATE OR REPLACE VIEW v_edit_subcatchment AS 
 SELECT subcatchment.subc_id,
    subcatchment.node_id,
    subcatchment.rg_id,
    subcatchment.area,
    subcatchment.imperv,
    subcatchment.width,
    subcatchment.slope,
    subcatchment.clength,
    subcatchment.snow_id,
    subcatchment.nimp,
    subcatchment.nperv,
    subcatchment.simp,
    subcatchment.sperv,
    subcatchment.zero,
    subcatchment.routeto,
    subcatchment.rted,
    subcatchment.maxrate,
    subcatchment.minrate,
    subcatchment.decay,
    subcatchment.drytime,
    subcatchment.maxinfil,
    subcatchment.suction,
    subcatchment.conduct,
    subcatchment.initdef,
    subcatchment.curveno,
    subcatchment.conduct_2,
    subcatchment.drytime_2,
    subcatchment.sector_id,
    subcatchment.hydrology_id,
    subcatchment.the_geom,
    subcatchment.parent_id,
    subcatchment.descript
   FROM inp_selector_sector,
    inp_selector_hydrology,
    subcatchment
  WHERE subcatchment.sector_id = inp_selector_sector.sector_id AND inp_selector_sector.cur_user = "current_user"()::text 
  AND subcatchment.hydrology_id = inp_selector_hydrology.hydrology_id AND inp_selector_hydrology.cur_user = "current_user"()::text;

 
 
 
CREATE OR REPLACE VIEW vi_coverages AS 
 SELECT v_edit_subcatchment.subc_id,
    inp_coverage_land_x_subc.landus_id,
    inp_coverage_land_x_subc.percent
   FROM inp_coverage_land_x_subc
     JOIN v_edit_subcatchment ON inp_coverage_land_x_subc.subc_id::text = v_edit_subcatchment.subc_id::text
	 JOIN  (SELECT DISTINCT ON (subc_id) subc_id, v_node.node_id FROM 
		   (SELECT json_array_elements_text(subcatchment.node_id::json) AS node_array, * 
			FROM subcatchment where left (node_id,1)='[' ) a JOIN v_node ON v_node.node_id::text = a.node_array::text) b 
			ON v_edit_subcatchment.subc_id=b.subc_id;
		

CREATE OR REPLACE VIEW vi_groundwater AS 
 SELECT inp_groundwater.subc_id,
    inp_groundwater.aquif_id,
    inp_groundwater.node_id,
    inp_groundwater.surfel,
    inp_groundwater.a1,
    inp_groundwater.b1,
    inp_groundwater.a2,
    inp_groundwater.b2,
    inp_groundwater.a3,
    inp_groundwater.tw,
    inp_groundwater.h
   FROM v_edit_subcatchment
     JOIN inp_groundwater ON inp_groundwater.subc_id::text = v_edit_subcatchment.subc_id::text
	 	 JOIN  (SELECT DISTINCT ON (subc_id) subc_id, v_node.node_id FROM 
		   (SELECT json_array_elements_text(subcatchment.node_id::json) AS node_array, * 
			FROM subcatchment where left (node_id,1)='[' ) a JOIN v_node ON v_node.node_id::text = a.node_array::text) b 
			ON v_edit_subcatchment.subc_id=b.subc_id;

  

CREATE OR REPLACE VIEW vi_infiltration AS 
 SELECT v_edit_subcatchment.subc_id,
    v_edit_subcatchment.curveno AS other1,
    v_edit_subcatchment.conduct_2 AS other2,
    v_edit_subcatchment.drytime_2 AS other3,
    NULL::integer AS other4,
    NULL::double precision AS other5
   FROM v_edit_subcatchment
     JOIN cat_hydrology ON cat_hydrology.hydrology_id = v_edit_subcatchment.hydrology_id
	 	 JOIN  (SELECT DISTINCT ON (subc_id) subc_id, v_node.node_id FROM 
		   (SELECT json_array_elements_text(subcatchment.node_id::json) AS node_array, * 
			FROM subcatchment where left (node_id,1)='[' ) a JOIN v_node ON v_node.node_id::text = a.node_array::text) b 
			ON v_edit_subcatchment.subc_id=b.subc_id
  WHERE cat_hydrology.infiltration::text = 'CURVE_NUMBER'::text
UNION
 SELECT v_edit_subcatchment.subc_id,
    v_edit_subcatchment.suction AS other1,
    v_edit_subcatchment.conduct AS other2,
    v_edit_subcatchment.initdef AS other3,
    NULL::integer AS other4,
    NULL::double precision AS other5
   FROM v_edit_subcatchment
     JOIN cat_hydrology ON cat_hydrology.hydrology_id = v_edit_subcatchment.hydrology_id
	 	 JOIN  (SELECT DISTINCT ON (subc_id) subc_id, v_node.node_id FROM 
		   (SELECT json_array_elements_text(subcatchment.node_id::json) AS node_array, * 
			FROM subcatchment where left (node_id,1)='[' ) a JOIN v_node ON v_node.node_id::text = a.node_array::text) b 
			ON v_edit_subcatchment.subc_id=b.subc_id
  WHERE cat_hydrology.infiltration::text = 'GREEN_AMPT'::text
UNION
 SELECT v_edit_subcatchment.subc_id,
    v_edit_subcatchment.maxrate AS other1,
    v_edit_subcatchment.minrate AS other2,
    v_edit_subcatchment.decay AS other3,
    v_edit_subcatchment.drytime AS other4,
    v_edit_subcatchment.maxinfil AS other5
   FROM v_edit_subcatchment
     JOIN cat_hydrology ON cat_hydrology.hydrology_id = v_edit_subcatchment.hydrology_id
	 	 JOIN  (SELECT DISTINCT ON (subc_id) subc_id, v_node.node_id FROM 
		   (SELECT json_array_elements_text(subcatchment.node_id::json) AS node_array, * 
			FROM subcatchment where left (node_id,1)='[' ) a JOIN v_node ON v_node.node_id::text = a.node_array::text) b 
			ON v_edit_subcatchment.subc_id=b.subc_id
  WHERE cat_hydrology.infiltration::text = 'MODIFIED_HORTON'::text OR cat_hydrology.infiltration::text = 'HORTON'::text
  ORDER BY 2;
 
 
CREATE OR REPLACE VIEW vi_lid_usage AS 
 SELECT inp_lidusage_subc_x_lidco.subc_id,
    inp_lidusage_subc_x_lidco.lidco_id,
    inp_lidusage_subc_x_lidco.number::integer AS number,
    inp_lidusage_subc_x_lidco.area,
    inp_lidusage_subc_x_lidco.width,
    inp_lidusage_subc_x_lidco.initsat,
    inp_lidusage_subc_x_lidco.fromimp,
    inp_lidusage_subc_x_lidco.toperv::integer AS toperv,
    inp_lidusage_subc_x_lidco.rptfile
   FROM v_edit_subcatchment
     JOIN inp_lidusage_subc_x_lidco ON inp_lidusage_subc_x_lidco.subc_id::text = v_edit_subcatchment.subc_id::text
	 	 JOIN  (SELECT DISTINCT ON (subc_id) subc_id, v_node.node_id FROM 
		   (SELECT json_array_elements_text(subcatchment.node_id::json) AS node_array, * 
			FROM subcatchment where left (node_id,1)='[' ) a JOIN v_node ON v_node.node_id::text = a.node_array::text) b 
			ON v_edit_subcatchment.subc_id=b.subc_id;

 
 
CREATE OR REPLACE VIEW vi_loadings AS 
 SELECT inp_loadings_pol_x_subc.subc_id,
    inp_loadings_pol_x_subc.poll_id,
    inp_loadings_pol_x_subc.ibuildup
   FROM v_edit_subcatchment
     JOIN inp_loadings_pol_x_subc ON inp_loadings_pol_x_subc.subc_id::text = v_edit_subcatchment.subc_id::text
	 	 JOIN  (SELECT DISTINCT ON (subc_id) subc_id, v_node.node_id FROM 
		   (SELECT json_array_elements_text(subcatchment.node_id::json) AS node_array, * 
			FROM subcatchment where left (node_id,1)='[' ) a JOIN v_node ON v_node.node_id::text = a.node_array::text) b 
			ON v_edit_subcatchment.subc_id=b.subc_id;

 
 
 CREATE OR REPLACE VIEW vi_subareas AS 
 SELECT v_edit_subcatchment.subc_id,
    v_edit_subcatchment.nimp,
    v_edit_subcatchment.nperv,
    v_edit_subcatchment.simp,
    v_edit_subcatchment.sperv,
    v_edit_subcatchment.zero,
    v_edit_subcatchment.routeto,
    v_edit_subcatchment.rted
   FROM v_edit_subcatchment
   	 JOIN  (SELECT DISTINCT ON (subc_id) subc_id, v_node.node_id FROM 
		   (SELECT json_array_elements_text(subcatchment.node_id::json) AS node_array, * 
			FROM subcatchment where left (node_id,1)='[' ) a JOIN v_node ON v_node.node_id::text = a.node_array::text) b 
			ON v_edit_subcatchment.subc_id=b.subc_id;

 
 
 drop VIEW vi_subcatchments;
 CREATE OR REPLACE VIEW vi_subcatchments AS 
 SELECT v_edit_subcatchment.subc_id,
    v_edit_subcatchment.rg_id,
        CASE
            WHEN v_edit_subcatchment.parent_id IS NULL THEN b.node_id
            ELSE v_edit_subcatchment.parent_id
        END AS node_id,
    v_edit_subcatchment.area,
    v_edit_subcatchment.imperv,
    v_edit_subcatchment.width,
    v_edit_subcatchment.slope,
    v_edit_subcatchment.clength,
    v_edit_subcatchment.snow_id
   FROM v_edit_subcatchment
	 JOIN  (SELECT DISTINCT ON (subc_id) subc_id, v_node.node_id FROM 
		   (SELECT json_array_elements_text(subcatchment.node_id::json) AS node_array, * 
			FROM subcatchment where left (node_id,1)='[' ) a JOIN v_node ON v_node.node_id::text = a.node_array::text) b 
			ON v_edit_subcatchment.subc_id=b.subc_id;


--28/06/2019
CREATE OR REPLACE VIEW v_ui_event_x_gully AS
SELECT om_visit_event.id AS event_id,
   om_visit.id AS visit_id,
   om_visit.ext_code AS code,
   om_visit.visitcat_id,
   om_visit.startdate AS visit_start,
   om_visit.enddate AS visit_end,
   om_visit.user_name,
   om_visit.is_done,
   date_trunc('second'::text, om_visit_event.tstamp) AS tstamp,
   om_visit_x_gully.gully_id,
   om_visit_event.parameter_id,
   om_visit_parameter.parameter_type,
   om_visit_parameter.feature_type,
   om_visit_parameter.form_type,
   om_visit_parameter.descript,
   om_visit_event.value,
   om_visit_event.xcoord,
   om_visit_event.ycoord,
   om_visit_event.compass,
   om_visit_event.event_code,
       CASE
           WHEN a.event_id IS NULL THEN false
           ELSE true
       END AS gallery,
       CASE
           WHEN b.visit_id IS NULL THEN false
           ELSE true
       END AS document
  FROM om_visit
    JOIN om_visit_event ON om_visit.id = om_visit_event.visit_id
    JOIN om_visit_x_gully ON om_visit_x_gully.visit_id = om_visit.id
    JOIN om_visit_parameter ON om_visit_parameter.id::text = om_visit_event.parameter_id::text
    LEFT JOIN gully ON gully.gully_id::text = om_visit_x_gully.gully_id::text
    LEFT JOIN ( SELECT DISTINCT om_visit_event_photo.event_id
          FROM om_visit_event_photo) a ON a.event_id = om_visit_event.id
    LEFT JOIN ( SELECT DISTINCT doc_x_visit.visit_id
          FROM doc_x_visit) b ON b.visit_id = om_visit.id
 ORDER BY om_visit_x_gully.gully_id;
