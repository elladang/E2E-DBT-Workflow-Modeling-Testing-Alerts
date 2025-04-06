SELECT  
  CAST (state_province_id AS INT ) state_province_key
, CAST (state_province_name AS STRING ) postal_state_province_name
FROM `trangdang.dbt_project.application__state_provinces` 
