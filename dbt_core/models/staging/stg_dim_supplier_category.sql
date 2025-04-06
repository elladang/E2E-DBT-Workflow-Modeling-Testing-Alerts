SELECT 
  CAST(supplier_category_id AS INT) supplier_category_key
  , CAST(supplier_category_name AS STRING) supplier_category_name
FROM `trangdang.dbt_project.purchasing__supplier_categories` 