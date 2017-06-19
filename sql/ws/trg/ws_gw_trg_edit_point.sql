/*
This file is part of Giswater 2.0
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/


CREATE OR REPLACE FUNCTION "SCHEMA_NAME".gw_trg_edit_point()
  RETURNS trigger AS
$BODY$
DECLARE 

    inp_table varchar;
    man_table varchar;
    v_sql varchar;
    arc_id_seq int8;
	expl_id_int integer;

BEGIN

    EXECUTE 'SET search_path TO '||quote_literal(TG_TABLE_SCHEMA)||', public';
	        man_table:= TG_ARGV[0];
	
	
    IF TG_OP = 'INSERT' THEN
        			
		--Exploitation ID
            IF ((SELECT COUNT(*) FROM exploitation) = 0) THEN
                --PERFORM audit_function(125,340);
				RETURN NULL;				
            END IF;
            expl_id_int := (SELECT expl_id FROM exploitation WHERE ST_DWithin(NEW.the_geom, exploitation.the_geom,0.001) LIMIT 1);
            IF (expl_id_int IS NULL) THEN
                --PERFORM audit_function(130,340);
				RETURN NULL; 
            END IF;

       
        
    
        -- FEATURE INSERT
		IF man_table='point' THEN 

				INSERT INTO point (point_id, point_type,observ,text, link, the_geom, undelete, expl_id )
				VALUES (NEW.point_id, NEW.point_type, NEW.observ, NEW.text, NEW.link, NEW.the_geom, NEW.undelete, expl_id_int);
				
		
		ELSIF man_table='pond' THEN
						
				INSERT INTO pond (pond_id, connec_id, code_comercial, the_geom, expl_id)
				VALUES (NEW.pond_id, NEW.connec_id, NEW.code_comercial, NEW.the_geom, expl_id_int);
		
		ELSIF man_table='pool' THEN
			
				INSERT INTO pool(pool_id, connec_id, code_comercial, the_geom, expl_id)
				VALUES (NEW.pool_id, NEW.connec_id, NEW.code_comercial, NEW.the_geom, expl_id_int);
		
		ELSIF man_table='samplepoint' THEN 
				INSERT INTO samplepoint (sample_id, state, rotation, code_lab, element_type, workcat_id, workcat_id_end, street1, street2, place, element_code, cabinet, dma_id2, observations, the_geom, expl_id)
				VALUES (NEW.sample_id, NEW.state, NEW.rotation, NEW.code_lab, NEW.element_type, NEW.workcat_id, NEW.workcat_id_end, NEW.street1, NEW.street2, NEW.place, NEW.element_code, NEW.cabinet, NEW.dma_id2, 
				NEW.observations, NEW.the_geom, expl_id_int);
				
		END IF;
		RETURN NEW;
		
          
    ELSIF TG_OP = 'UPDATE' THEN

		
		IF man_table='point' THEN
			UPDATE point 
			SET point_id=NEW.point_id, point_type=NEW.point_type, observ=NEW.observ, text=NEW.text, link=NEW.link, the_geom=NEW.the_geom, undelete=NEW.undelete
			WHERE point_id=OLD.point_id;			
						
		ELSIF man_table='pond' THEN
			UPDATE pond
			SET pond_id=NEW.pond_id, connec_id=NEW.connec_id, code_comercial=NEW.code_comercial, the_geom=NEW.the_geom
			WHERE pond_id=OLD.pond_id;
		
		ELSIF man_table='pool' THEN
			UPDATE pool
			SET pool_id=NEW.pool_id, connec_id=NEW.connec_id, code_comercial=NEW.code_comercial, the_geom=NEW.the_geom
			WHERE pool_id=NEW.pool_id;
		
		ELSIF man_table='samplepoint' THEN
			UPDATE samplepoint 
			SET sample_id=NEW.sample_id, state=NEW.state, rotation=NEW.rotation, code_lab=NEW.code_lab, element_type=NEW.element_type, workcat_id=NEW.workcat_id, workcat_id_end=NEW.workcat_id_end, street1=NEW.street1, 
			street2=NEW.street2, place=NEW.place, element_code=NEW.element_code, cabinet=NEW.cabinet, dma_id2=NEW.dma_id2, observations=NEW.observations, the_geom=NEW.the_geom
			WHERE sample_id=NEW.sample_id;
		END IF;
		
        PERFORM audit_function(2,340); 
        RETURN NEW;

		 ELSIF TG_OP = 'DELETE' THEN  
			
			IF man_table='point' THEN
				DELETE FROM point WHERE point_id = OLD.point_id;
			
			ELSIF man_table='pond' THEN
				DELETE FROM pond WHERE pond_id=OLD.pond_id;
			
			ELSIF man_table='pool' THEN
				DELETE FROM pool WHERE pool_id=OLD.pool_id;
			
			ELSIF man_table='samplepoint' THEN
				DELETE FROM samplepoint WHERE sample_id=OLD.sample_id;
			
			END IF;
		
        PERFORM audit_function(3,340); 
        RETURN NULL;
     
     END IF;

END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
  

DROP TRIGGER IF EXISTS gw_trg_edit_point ON "SCHEMA_NAME".v_edit_point;
CREATE TRIGGER gw_trg_edit_point INSTEAD OF INSERT OR DELETE OR UPDATE ON "SCHEMA_NAME".v_edit_point FOR EACH ROW EXECUTE PROCEDURE "SCHEMA_NAME".gw_trg_edit_point('point');

DROP TRIGGER IF EXISTS gw_trg_edit_pond ON "SCHEMA_NAME".v_edit_pond;
CREATE TRIGGER gw_trg_edit_pond INSTEAD OF INSERT OR DELETE OR UPDATE ON "SCHEMA_NAME".v_edit_pond FOR EACH ROW EXECUTE PROCEDURE "SCHEMA_NAME".gw_trg_edit_point('pond');

DROP TRIGGER IF EXISTS gw_trg_edit_pool ON "SCHEMA_NAME".v_edit_pool;
CREATE TRIGGER gw_trg_edit_pool INSTEAD OF INSERT OR DELETE OR UPDATE ON "SCHEMA_NAME".v_edit_pool FOR EACH ROW EXECUTE PROCEDURE "SCHEMA_NAME".gw_trg_edit_point('pool');

DROP TRIGGER IF EXISTS gw_trg_edit_samplepoint ON "SCHEMA_NAME".v_edit_samplepoint;
CREATE TRIGGER gw_trg_edit_samplepoint INSTEAD OF INSERT OR DELETE OR UPDATE ON "SCHEMA_NAME".v_edit_samplepoint FOR EACH ROW EXECUTE PROCEDURE "SCHEMA_NAME".gw_trg_edit_point('samplepoint');
      