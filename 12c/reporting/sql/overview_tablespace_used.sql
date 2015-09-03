/* NAME:
 * overview_tablespace_used.sql
 *
 * DESC:
 *   Get the tablespace used by all databases that are registered in OEM. 
 *   This will provide an overview per host (host_name) / database 
 *   (target_name). Size is per MB. 
 * 
 * LOG:
 * VERSION---DATE--------NAME-------------COMMENT
 * 0.1       03SEP2015   Johan Louwers    Initial upload to github.com
 *
 * LICENSE:
 * Copyright (C) 2014  Johan Louwers
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
      HOST_NAME,
      TARGET_NAME,
      round(SUM(TABLESPACE_SIZE)/1024/1024,0) AS "DB_TABLESPACE_USED"
FROM 
    MGMT$DB_TABLESPACES
GROUP BY
        target_name,
        host_name
ORDER BY 
        host_name, 
        target_name
