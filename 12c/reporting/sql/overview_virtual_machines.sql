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
