/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/


SET search_path = SCHEMA_NAME, public, pg_catalog;

--28/11/2019
SELECT setval('SCHEMA_NAME.config_api_form_fields_id_seq', (SELECT max(id) FROM config_api_form_fields), true);

INSERT INTO config_api_typevalue(typevalue, id, idval)
VALUES ('layout_name_typevalue', 'other_layout', 'other_layout');

INSERT INTO config_api_form_fields (formname, formtype, column_id, layout_id, layout_order, isenabled, 
       datatype, widgettype, label, ismandatory, isparent, iseditable, 
       isautoupdate, isreload, layout_name, hidden)
VALUES ('dimensioning', 'catalog','observ',1,1,true,'string', 'text', 'observations',false,false,true,false,false,
'other_layout',false);

INSERT INTO config_api_form_fields (formname, formtype, column_id, layout_id, layout_order, isenabled, 
       datatype, widgettype, label, ismandatory, isparent, iseditable, 
       isautoupdate, isreload, layout_name, hidden)
VALUES ('dimensioning', 'catalog','comment',1,2,true,'string', 'text', 'comment',false,false,true,false,false,
'other_layout',false);