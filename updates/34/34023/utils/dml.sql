/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/


SET search_path = SCHEMA_NAME, public, pg_catalog;


-- 2020/10/19
UPDATE config_form_fields SET iseditable = true WHERE columnname in ('state_type', 'expl_id') AND formname like 'v_edit_inp%';

INSERT INTO config_form_fields
SELECT 'v_edit_inp_connec', formtype, columnname, layoutorder, datatype, widgettype, label, widgetdim, tooltip, placeholder, ismandatory, 
isparent, iseditable, isautoupdate, dv_querytext, dv_orderby_id, dv_isnullvalue, dv_parent_id, dv_querytext_filterc,
widgetfunction, linkedaction, stylesheet, listfilterparam, layoutname, widgetcontrols, hidden
FROM config_form_fields WHERE columnname in ('state_type') AND formname like 'v_edit_inp_junction%';