SELECT  
  CAST (person_id AS INT ) person_key
  , CAST (full_name AS STRING ) full_name
  , CAST(search_name AS STRING) search_name
  , CAST(is_employee AS BOOLEAN) is_employee
  , CAST(is_salesperson AS BOOLEAN) is_salesperson
         
FROM `trangdang.dbt_project.application__people` 