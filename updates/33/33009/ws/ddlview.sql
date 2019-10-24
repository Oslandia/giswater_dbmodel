/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/


SET search_path = SCHEMA_NAME, public, pg_catalog;
  
CREATE OR REPLACE VIEW vi_options AS 
SELECT * FROM (
 SELECT a.idval AS parameter,
        CASE
            WHEN a.idval = 'UNBALANCED'::text AND b.value = 'CONTINUE'::text THEN concat(b.value, ' ', ( SELECT config_param_user.value
               FROM config_param_user
              WHERE config_param_user.parameter::text = 'inp_options_unbalanced_n'::text AND config_param_user.cur_user::name = "current_user"()))
            WHEN a.idval = 'QUALITY'::text AND b.value = 'TRACE'::text THEN concat(b.value, ' ', ( SELECT config_param_user.value
               FROM config_param_user
              WHERE config_param_user.parameter::text = 'inp_options_node_id'::text AND config_param_user.cur_user::name = "current_user"()))
            WHEN a.idval = 'HYDRAULICS'::text AND (b.value = 'USE'::text OR b.value = 'SAVE'::text) THEN concat(b.value, ' ', ( SELECT config_param_user.value
               FROM config_param_user WHERE config_param_user.parameter::text = 'inp_options_hydraulics_fname'::text AND config_param_user.cur_user::name = "current_user"()))
             WHEN a.idval = 'HYDRAULICS'::text AND (b.value = 'NONE') THEN NULL
            ELSE b.value
        END AS value
  FROM audit_cat_param_user a
  JOIN config_param_user b ON a.id = b.parameter::text
	WHERE (a.layoutname = ANY (ARRAY['grl_general_1'::text, 'grl_general_2'::text, 'grl_hyd_3'::text, 'grl_hyd_4'::text, 'grl_quality_5'::text, 'grl_quality_6'::text])) 
	AND (a.idval <> ALL (ARRAY['UNBALANCED_N'::text, 'NODE_ID'::text, 'HYDRAULICS_FNAME'::text])) 
	AND b.cur_user::name = "current_user"() 
	AND b.value IS NOT NULL 
	AND b.parameter::text <> 'PATTERN'::text 
	AND b.value <> 'NULLVALUE'::text)a 
	WHERE parameter !='HYDRAULICS' OR  (parameter ='HYDRAULICS' AND value IS NOT NULL);
  
  
CREATE OR REPLACE VIEW vi_curves AS 
 SELECT 
        CASE
            WHEN a.x_value IS NULL THEN a.curve_type::character varying(16)
            ELSE a.curve_id
        END AS curve_id,
    a.x_value::numeric(12,4) AS x_value,
    a.y_value::numeric(12,4) AS y_value,
    NULL::text AS other
   FROM 


   ( SELECT DISTINCT ON (inp_curve.curve_id) ( SELECT min(sub.id) AS min
                   FROM inp_curve sub
                  WHERE sub.curve_id::text = inp_curve.curve_id::text) AS id,
            inp_curve.curve_id,
            concat(';', inp_curve_id.curve_type, ':', inp_curve_id.descript) AS curve_type,
            NULL::numeric AS x_value,
            NULL::numeric AS y_value
           FROM inp_curve_id
             JOIN inp_curve ON inp_curve.curve_id::text = inp_curve_id.id::text
        UNION
         SELECT inp_curve.id,
            inp_curve.curve_id,
            inp_curve_id.curve_type,
            inp_curve.x_value,
            inp_curve.y_value
           FROM inp_curve
             JOIN inp_curve_id ON inp_curve.curve_id::text = inp_curve_id.id::text
  ORDER BY 1, 4 DESC) a

WHERE 
curve_id IN (SELECT curve_id FROM vi_tanks) OR
concat('HEAD ',curve_id) IN (SELECT head FROM vi_pumps) OR
concat('GPV ',curve_id) IN (SELECT setting FROM vi_valves) OR
curve_id IN (SELECT energyvalue FROM vi_energy WHERE idval = 'EFFIC');

  
  
