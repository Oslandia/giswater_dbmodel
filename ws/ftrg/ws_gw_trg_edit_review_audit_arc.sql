/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/


--FUNCTION NUMBER: 2488


CREATE OR REPLACE FUNCTION "SCHEMA_NAME".gw_trg_edit_review_audit_arc()
  RETURNS trigger AS
$BODY$

DECLARE
	v_review_status integer;
	
BEGIN
EXECUTE 'SET search_path TO '||quote_literal(TG_TABLE_SCHEMA)||', public';

	IF TG_OP = 'UPDATE' THEN
	
		SELECT review_status INTO v_review_status FROM review_audit_arc WHERE arc_id=NEW.arc_id;
		
		IF NEW.is_validated = 0 THEN
			DELETE FROM review_arc WHERE arc_id = NEW.arc_id;
			UPDATE review_audit_arc SET is_validated=NEW.is_validated WHERE arc_id=NEW.arc_id;

		ELSIF NEW.is_validated = 1 THEN

			IF NEW.new_arccat_id IS NULL THEN
				EXECUTE 'SELECT gw_fct_getmessage($${"client":{"device":4, "infoType":1, "lang":"ES"},"feature":{},
        			"data":{"message":"3056", "function":"2488","debug_msg":"'||NEW.arc_id'"}}$$);';
			END IF;
			
			UPDATE review_audit_arc SET new_arccat_id=NEW.new_arccat_id, is_validated=NEW.is_validated WHERE arc_id=NEW.arc_id;
			
			IF v_review_status=1 AND NEW.arc_id NOT IN (SELECT arc_id FROM arc) THEN 

				INSERT INTO v_edit_arc (arc_id,  arccat_id, annotation, observ, expl_id, the_geom)
				VALUES (NEW. arc_id, NEW.new_arccat_id, NEW.annotation, NEW.observ, NEW.expl_id, NEW.the_geom); 
				
		
			ELSIF v_review_status=2 THEN
				UPDATE v_edit_arc SET the_geom=NEW.the_geom, arccat_id=NEW.new_arccat_id,  annotation=NEW.annotation, observ=NEW.observ WHERE arc_id=NEW.arc_id;
					
			ELSIF v_review_status=3 THEN

				UPDATE v_edit_arc SET  arccat_id=NEW.new_arccat_id,  annotation=NEW.annotation, observ=NEW.observ
				WHERE arc_id=NEW.arc_id;
	
			END IF;	
			
			DELETE FROM review_arc WHERE arc_id = NEW.arc_id;

		ELSIF NEW.is_validated = 2 THEN
			
			UPDATE review_arc SET field_checked=FALSE, is_validated=2 WHERE arc_id=NEW.arc_id;
			UPDATE review_audit_arc SET is_validated=NEW.is_validated WHERE arc_id=NEW.arc_id;

		END IF;
		
	END IF;	

RETURN NEW;

END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;