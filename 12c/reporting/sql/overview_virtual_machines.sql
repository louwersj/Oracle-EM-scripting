/* NAME:
 *   overview_virtual_machines.sql
 *
 * DESC:
 *   Provides an overview of all VM's running on OVM from an OEM 
 *   point of view. This provides a quick view into your landscape
 *   and where VM's are located. 
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
   v_ovm_vm.ovm_display_name         AS VM_NAME,
   v_ovm_vm.kernel_ver               AS VM_KERNEL,
   v_ovm_serverpool.ovm_display_name AS VMSERVER_POOL,
   v_ovm_zone.ovm_display_name       AS VMSERVER_ZONE,
   v_ovm_server.OVM_DISPLAY_NAME     AS VMSERVER_SERVER
FROM 
   MGMT$VT_VM_SW_CFG v_ovm_vm,
   MGMT$VT_VSP_CONFIG v_ovm_serverpool,
   MGMT$VT_ZONE_CONFIG v_ovm_zone,
   MGMT$VT_VS_SW_CFG v_ovm_server
WHERE 
   v_ovm_vm.vsp_uuid = v_ovm_serverpool.vsp_uuid
   AND v_ovm_serverpool.zone_uuid = v_ovm_zone.zone_uuid
   AND v_ovm_vm.VS_UUID = v_ovm_server.vs_uuid
   ORDER BY 3,4,5,1
