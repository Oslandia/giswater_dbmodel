/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/


SET search_path = SCHEMA_NAME, public, pg_catalog;

-- 2020/09/30

ALTER TABLE cat_mat_roughness DROP CONSTRAINT IF EXISTS inp_cat_mat_roughness_unique;
ALTER TABLE cat_mat_roughness
  ADD CONSTRAINT cat_mat_roughness_unique UNIQUE(matcat_id, init_age, end_age);

ALTER TABLE cat_mat_roughness DROP CONSTRAINT IF EXISTS inp_cat_mat_roughness_matcat_id_fkey;
ALTER TABLE cat_mat_roughness
  ADD CONSTRAINT cat_mat_roughness_matcat_id_fkey FOREIGN KEY (matcat_id)
      REFERENCES cat_mat_arc (id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE cat_mat_roughness DROP CONSTRAINT IF EXISTS inp_cat_mat_roughness_pkey;

ALTER TABLE cat_mat_roughness ADD CONSTRAINT cat_mat_roughness_pkey PRIMARY KEY(id);

