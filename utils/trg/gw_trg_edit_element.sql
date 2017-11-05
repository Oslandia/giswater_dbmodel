﻿
-- DROP FUNCTION "SCHEMA_NAME".gw_trg_edit_element();

CREATE OR REPLACE FUNCTION "SCHEMA_NAME".gw_trg_edit_element()
  RETURNS trigger AS
$BODY$
DECLARE 
	element_seq int8;
	expl_id_int integer;

BEGIN

    EXECUTE 'SET search_path TO '||quote_literal(TG_TABLE_SCHEMA)||', public';

-- INSERT

	IF TG_OP = 'INSERT' THEN

		-- Cat element
		IF (NEW.elementcat_id IS NULL) THEN
			NEW.elementcat_id:= (SELECT "value" FROM config_param_user WHERE "parameter"='elementcat_vdefault' AND "cur_user"="current_user"() LIMIT 1);
		END IF;
		IF (NEW.elementcat_id IS NULL) THEN
			NEW.elementcat_id:= (SELECT id FROM cat_element LIMIT 1);
		END IF;
		IF (NEW.elementcat_id IS NULL) THEN
			RAISE EXCEPTION 'There are not values on the cat_element table. Before continue inserting one element please fill it';
		END IF;
	
	
		-- Verified
		IF (NEW.verified IS NULL) THEN
			NEW.verified := (SELECT "value" FROM config_param_user WHERE "parameter"='verified_vdefault' AND "cur_user"="current_user"() LIMIT 1);
			IF (NEW.verified IS NULL) THEN
				NEW.verified := (SELECT id FROM value_verified limit 1);
			END IF;
		END IF;
		
	
		-- State
		IF (NEW.state IS NULL) THEN
			NEW.state := (SELECT "value" FROM config_param_user WHERE "parameter"='state_vdefault' AND "cur_user"="current_user"());
			IF (NEW.state IS NULL) THEN
				NEW.state := (SELECT id FROM value_state limit 1);
			END IF;
		END IF;
				

		-- Exploitation
		IF (NEW.expl_id IS NULL) THEN
			NEW.expl_id := (SELECT "value" FROM config_param_user WHERE "parameter"='exploitation_vdefault' AND "cur_user"="current_user"());
			IF (NEW.expl_id IS NULL) THEN
				NEW.expl_id := (SELECT expl_id FROM exploitation WHERE ST_DWithin(NEW.the_geom, exploitation.the_geom,0.001) LIMIT 1);
				IF (NEW.expl_id IS NULL) THEN
					RAISE EXCEPTION 'You are trying to insert a new element out of any exploitation, please review your data!';
				END IF;		
			END IF;
		END IF;		
				
		--Element ID		
		IF (NEW.element_id IS NULL) THEN
			NEW.element_id:= (SELECT nextval('urn_id_seq'));
		END IF;


		-- FEATURE INSERT      

		INSERT INTO element (element_id, code, elementcat_id, serial_number, "state", state_type, observ, "comment", function_type, category_type, location_type, 
		workcat_id, workcat_id_end, buildercat_id, builtdate, enddate, ownercat_id, rotation, link, verified, the_geom, label_x, label_y, label_rotation, publish, 
		inventory, undelete, expl_id, num_elements)
		VALUES (NEW.element_id, NEW.code, NEW.elementcat_id, NEW.serial_number, NEW."state", NEW.state_type, NEW.observ, NEW."comment", 
		NEW.function_type, NEW.category_type, NEW.location_type, NEW.workcat_id, NEW.workcat_id_end, NEW.buildercat_id, NEW.builtdate, NEW.enddate, 
		NEW.ownercat_id, NEW.rotation, NEW.link, NEW.verified, NEW.the_geom, NEW.label_x, NEW.label_y, NEW.label_rotation, NEW.publish, 
		NEW.inventory, NEW.undelete, NEW.expl_id, NEW.num_elements);
			
		RETURN NEW;
						

	-- UPDATE
	ELSIF TG_OP = 'UPDATE' THEN

		UPDATE element
		SET element_id=NEW.element_id, code=NEW.code,  elementcat_id=NEW.elementcat_id, serial_number=NEW.serial_number, "state"=NEW."state", state_type=NEW.state_type, annotation=NEW.annotation, observ=NEW.observ, "comment"=NEW."comment", 
		function_type=NEW.function_type, category_type=NEW.category_type,  location_type=NEW.location_type, workcat_id=NEW.workcat_id, workcat_id_end=NEW.workcat_id_end, 
		buildercat_id=NEW.buildercat_id, builtdate=NEW.builtdate, enddate=NEW.enddate, ownercat_id=NEW.ownercat_id, rotation=NEW.rotation, link=NEW.link, verified=NEW.verified, 
		the_geom=NEW.the_geom, label_x=NEW.label_x, label_y=NEW.label_y, label_rotation=NEW.label_rotation, publish=NEW.publish, inventory=NEW.inventory, undelete=NEW.undelete,expl_id=NEW.expl_id, num_elements=NEW.num_elements
		WHERE element_id=OLD.element_id;

        RETURN NEW;
    

	-- DELETE
	ELSIF TG_OP = 'DELETE' THEN
		DELETE FROM element WHERE element_id=OLD.element_id;

        RETURN NULL;
   
	END IF;
    
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
  
  

DROP TRIGGER IF EXISTS gw_trg_edit_element ON "SCHEMA_NAME".v_edit_element;
CREATE TRIGGER gw_trg_edit_element INSTEAD OF INSERT OR DELETE OR UPDATE ON "SCHEMA_NAME".v_edit_element FOR EACH ROW EXECUTE PROCEDURE "SCHEMA_NAME".gw_trg_edit_element('element');


