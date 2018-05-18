/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/


SET search_path = SCHEMA_NAME, public, pg_catalog;


-----------------------
-- doc_x_psector table
-----------------------

CREATE TABLE doc_x_psector(
id serial NOT NULL PRIMARY KEY,
doc_id character varying(30),
psector_id integer 
);

ALTER TABLE doc_x_psector DROP CONSTRAINT IF EXISTS doc_x_psector_doc_id_fkey;
ALTER TABLE doc_x_psector DROP CONSTRAINT IF EXISTS doc_x_psector_psector_id_fkey;

ALTER TABLE doc_x_psector ADD CONSTRAINT doc_x_psector_doc_id_fkey FOREIGN KEY (doc_id) REFERENCES doc (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE doc_x_psector ADD CONSTRAINT doc_x_psector_psector_id_fkey FOREIGN KEY (psector_id) REFERENCES plan_psector (psector_id) ON DELETE CASCADE ON UPDATE CASCADE;


INSERT INTO audit_cat_table VALUES ('doc_x_psector', 'doc', 'Doc psector', 'role_basic', 0, NULL, NULL, 0, NULL,'doc_x_psector_id_seq', 'id');



-----------------------
--ext_rtc_hydrometer table
-----------------------

ALTER TABLE ext_rtc_hydrometer ADD COLUMN state int2;
ALTER TABLE ext_rtc_hydrometer ADD COLUMN expl_id integer;
ALTER TABLE ext_rtc_hydrometer ADD COLUMN connec_customer_code varchar (30);



-----------------------
--ext_rtc_hydrometer_state table
-----------------------

CREATE TABLE ext_rtc_hydrometer_state
(
  id serial PRIMARY KEY,
  name integer NOT NULL,
  observ text
);


INSERT INTO audit_cat_table VALUES ('ext_rtc_hydrometer_state', 'ext', 'hydrometers state catalog', 'role_basic', 0, NULL, NULL, 0, NULL,'ext_rtc_hydrometer_state_id_seq', 'id');


INSERT INTO ext_rtc_hydrometer_state VALUES (0, 'STATE0');
INSERT INTO ext_rtc_hydrometer_state VALUES (1, 'STATE1');
INSERT INTO ext_rtc_hydrometer_state VALUES (2, 'STATE2');
INSERT INTO ext_rtc_hydrometer_state VALUES (3, 'STATE3');
INSERT INTO ext_rtc_hydrometer_state VALUES (4, 'STATE4');


-----------------------
--selector_hydrometer table
-----------------------

CREATE TABLE selector_hydrometer
(
  id serial NOT NULL,
  state_id integer NOT NULL,
  cur_user text NOT NULL,
  CONSTRAINT selector_hydrometer_pkey PRIMARY KEY (id),
  CONSTRAINT selector_hydrometer_state_id_cur_user_unique UNIQUE (state_id, cur_user)
);

INSERT INTO audit_cat_table VALUES ('selector_hydrometer', 'System', 'Selector of hydrometers', 'role_basic', 0, NULL, NULL, 0, NULL,'selector_hydrometer_id_seq', 'id');


INSERT INTO ext_hydrometer_state VALUES (1, 'postgres');




-----------------------
--system variables
-----------------------

-- search







-- profile

