  
/* NAME:
 *   database_indexation.sql
 *
 * DESC:
 *   Provides an overview of all registered databases
 * 
 * LOG:
 * VERSION---DATE--------NAME-------------COMMENT
 * 0.1       20APR2020   Johan Louwers    Initial upload to github.com
 *
 * LICENSE:
 * Copyright (C) 2020  Johan Louwers
 * 
 * This code is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 * 
 * This code is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this code; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 * 
 */

SELECT
db.target_name                                          AS database_name,
db.type_qualifier1                                      AS database_versioncategory,
(SELECT tprops.property_value
 FROM   sysman.mgmt$target_properties tprops
 WHERE  TPROPS.target_guid = db.target_guid
        AND tprops.property_name = 'DBVersion')         AS Database_version,
(SELECT tprops.property_value
 FROM   sysman.mgmt$target_properties tprops
 WHERE  tprops.target_guid = db.target_guid
        AND tprops.property_name = 'RACOption')         AS database_rac,
(SELECT tprops.property_value
 FROM   sysman.mgmt$target_properties tprops
 WHERE  TPROPS.target_guid = db.target_guid
        AND tprops.property_name = 'RACInstNum')        AS Database_RACInstNum,
(SELECT tprops.property_value
 FROM   sysman.mgmt$target_properties tprops
 WHERE  TPROPS.target_guid = db.target_guid
        AND tprops.property_name = 'orcl_gtp_platform') AS Database_proctype,
(SELECT tprops.property_value
 FROM   sysman.mgmt$target_properties tprops
 WHERE  TPROPS.target_guid = db.target_guid
        AND tprops.property_name = 'CPUCount')          AS Database_procount,              
os.target_name                                          AS server_name,
os.type_qualifier1                                      AS server_os,
os.type_qualifier2                                      AS server_os_version
FROM   sysman.mgmt$target db,
       sysman.mgmt$target os
WHERE  db.host_name = os.target_name
       AND db.target_type = 'oracle_database'
       AND os.target_type = 'host'
ORDER  BY 1;
