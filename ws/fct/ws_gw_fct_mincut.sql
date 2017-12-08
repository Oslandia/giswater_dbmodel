﻿/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/

--FUNCTION CODE: 2304

DROP FUNCTION IF EXISTS ws.gw_fct_mincut(character varying, character varying, integer, text);
CREATE OR REPLACE FUNCTION ws.gw_fct_mincut(    element_id_arg character varying,    type_element_arg character varying,    result_id_arg integer,    cur_user_var text)
RETURNS integer AS
$BODY$
DECLARE
    node_1_aux		text;
    node_2_aux		text;
    controlValue	integer;
    exists_id		text;
    polygon_aux		public.geometry;
    polygon_aux2	public.geometry;
    arc_aux         public.geometry;
    node_aux        public.geometry;    
    srid_schema		text;
    expl_id_arg         integer;
    macroexpl_id_arg	integer;

BEGIN

    -- Search path
    SET search_path = "ws", public;
	

    -- Delete previous data from same result_id
    DELETE FROM "anl_mincut_result_node" where result_id=result_id_arg;
    DELETE FROM "anl_mincut_result_arc" where result_id=result_id_arg;
    DELETE FROM "anl_mincut_result_polygon" where result_id=result_id_arg;
    DELETE FROM "anl_mincut_result_connec" where result_id=result_id_arg;
    DELETE FROM "anl_mincut_result_hydrometer" where result_id=result_id_arg; 
    DELETE FROM "anl_mincut_result_valve" where result_id=result_id_arg;

    raise notice 'prova1';

    DELETE FROM "anl_mincut_result_selector" where cur_user=cur_user_var;
    INSERT INTO "anl_mincut_result_selector" (result_id, cur_user) VALUES (result_id_arg, cur_user_var);

    -- Identification of exploitation and macroexploitation
    IF type_element_arg='node' THEN
	SELECT expl_id INTO expl_id_arg FROM node WHERE node_id=element_id_arg;
    ELSE
	SELECT expl_id INTO expl_id_arg FROM arc WHERE arc_id=element_id_arg;
    END IF;
    
    SELECT macroexpl_id INTO macroexpl_id_arg FROM exploitation WHERE expl_id=expl_id_arg;

    UPDATE anl_mincut_result_cat SET expl_id=expl_id_arg;
    UPDATE anl_mincut_result_cat SET macroexpl_id=macroexpl_id_arg;

    raise notice 'prova2';
    
    -- Start process
    INSERT INTO anl_mincut_result_valve (result_id, node_id, unaccess, closed, broken, the_geom) 
    SELECT result_id_arg, node.node_id, false::boolean, closed, broken, node.the_geom
    FROM v_anl_mincut_selected_valve
    JOIN node on node.node_id=v_anl_mincut_selected_valve.node_id
    JOIN exploitation ON node.expl_id=exploitation.expl_id
    WHERE macroexpl_id=macroexpl_id_arg;

    -- Identify unaccess valves
    UPDATE anl_mincut_result_valve SET unaccess=true WHERE result_id=result_id_arg AND node_id IN 
    (SELECT node_id FROM anl_mincut_result_valve_unaccess WHERE result_id=result_id_arg);


     -- The element to isolate could be an arc or a node
    IF type_element_arg = 'arc' THEN
raise notice 'prova3';
        -- Check an existing arc
        SELECT COUNT(*) INTO controlValue FROM v_edit_arc JOIN value_state_type ON state_type=value_state_type.id 
        WHERE (arc_id = element_id_arg) AND (is_operative IS TRUE);
        IF controlValue = 1 THEN

            -- Select public.geometry
            SELECT the_geom INTO arc_aux FROM v_edit_arc WHERE arc_id = element_id_arg;

            -- Insert arc id
            INSERT INTO "anl_mincut_result_arc" (arc_id, the_geom, result_id) VALUES (element_id_arg, arc_aux, result_id_arg);
        
            -- Run for extremes node
            SELECT node_1, node_2 INTO node_1_aux, node_2_aux FROM v_edit_arc WHERE arc_id = element_id_arg;

            -- Check extreme being a valve
            SELECT COUNT(*) INTO controlValue FROM anl_mincut_result_valve 
            WHERE node_id = node_1_aux AND (unaccess = FALSE) AND (broken  = FALSE) AND (closed = FALSE) AND result_id=result_id_arg;
            IF controlValue = 1 THEN
                -- Set proposed valve
                UPDATE anl_mincut_result_valve SET proposed = TRUE WHERE node_id=node_1_aux AND result_id=result_id_arg;
                
            ELSE
                -- Compute the tributary area using DFS
                PERFORM gw_fct_mincut_engine(node_1_aux, result_id_arg);
            END IF;

            -- Check other extreme being a valve
            SELECT COUNT(*) INTO controlValue FROM anl_mincut_result_valve 
            WHERE node_id = node_2_aux AND (unaccess = FALSE) AND (broken  = FALSE) AND (closed = FALSE) AND result_id=result_id_arg;
            IF controlValue = 1 THEN

                -- Check if the valve is already computed
               SELECT node_id INTO exists_id FROM anl_mincut_result_valve 
               WHERE node_id = node_2_aux AND (proposed = TRUE) AND result_id=result_id_arg;

                -- Compute proceed
                IF NOT FOUND THEN
			-- Set proposed valve
			UPDATE anl_mincut_result_valve SET proposed = TRUE 
			WHERE node_id=node_2_aux AND result_id=result_id_arg;
                END IF;
                
            ELSE
                -- Compute the tributary area using DFS
                PERFORM gw_fct_mincut_engine(node_2_aux, result_id_arg);

            END IF;

        -- The arc_id was not found
        ELSE 
            PERFORM audit_function(1082,2304,element_id_arg);
        END IF;

    ELSE

        -- Check an existing node
        SELECT COUNT(*) INTO controlValue FROM v_edit_node JOIN value_state_type ON state_type=value_state_type.id  
        WHERE node_id = element_id_arg AND (is_operative IS TRUE);
        IF controlValue = 1 THEN
            -- Compute the tributary area using DFS
            PERFORM gw_fct_mincut_engine(element_id_arg, result_id_arg);
        -- The arc_id was not found
        ELSE 
            PERFORM audit_function(1084,2304);
        END IF;

    END IF;

    -- Contruct concave hull for included lines
    polygon_aux := ST_Multi(ST_ConcaveHull(ST_Collect(ARRAY(SELECT the_geom FROM anl_mincut_result_arc WHERE result_id=result_id_arg)), 0.80));

    -- Concave hull for not included lines
    polygon_aux2 := ST_Multi(ST_Buffer(ST_Collect(ARRAY(SELECT the_geom FROM v_edit_arc 
    WHERE arc_id NOT IN (SELECT arc_id FROM anl_mincut_result_arc WHERE result_id=result_id_arg) 
    AND ST_Intersects(the_geom, polygon_aux))), 1, 'join=mitre mitre_limit=1.0'));

    --RAISE EXCEPTION 'Polygon = %', polygon_aux2;

    -- Substract
    IF polygon_aux2 IS NOT NULL THEN
        polygon_aux := ST_Multi(ST_Difference(polygon_aux, polygon_aux2));
    ELSE
        polygon_aux := polygon_aux;
    END IF;

    -- Insert into polygon table
    IF geometrytype(polygon_aux)='MULTIPOLYGON' THEN
	INSERT INTO anl_mincut_result_polygon (polygon_id, the_geom, result_id) 
	VALUES((select nextval('ws.anl_mincut_result_polygon_polygon_seq'::regclass)),polygon_aux, result_id_arg);
    ELSE 
	INSERT INTO anl_mincut_result_polygon (polygon_id,  result_id) 
	VALUES((select nextval('ws.anl_mincut_result_polygon_polygon_seq'::regclass)), result_id_arg);
    END IF;

    -- Compute flow trace on network using the tanks and sources that belong on the macroexpl_id
   raise notice 'prova5';

   /*
   PERFORM gw_fct_mincut_inverted_flowtrace (result_id_arg);

   -- Update the rest of the values of not proposed valves to FALSE
   UPDATE anl_mincut_result_valve SET proposed=FALSE WHERE proposed IS NULL AND result_id=result_id_arg;

    -- Update result valves with two dry sides to proposed=false
   UPDATE ws.anl_mincut_result_valve SET proposed=FALSE WHERE result_id=result_id_arg AND node_id IN
   (
	SELECT node_1 FROM ws.anl_mincut_result_arc JOIN ws.arc ON anl_mincut_result_arc.arc_id=arc.arc_id 
	JOIN ws.anl_mincut_result_valve ON node_id=node_1 WHERE anl_mincut_result_arc.result_id=result_id_arg AND proposed IS TRUE
		INTERSECT
	SELECT node_2 FROM ws.anl_mincut_result_arc JOIN ws.arc ON anl_mincut_result_arc.arc_id=arc.arc_id 
	JOIN ws.anl_mincut_result_valve ON node_id=node_2 WHERE anl_mincut_result_arc.result_id=result_id_arg AND proposed IS TRUE
   );

   -- Check tempopary overlap control against other planified mincuts 
   PERFORM gw_fct_mincut_result_overlap(result_id_arg, cur_user_var);

*/ 
   RETURN 1;


END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;