WITH dim_supplier__source AS (
SELECT 
  CAST(supplier_id AS INT) supplier_key
  , CAST(supplier_name AS STRING) supplier_name
  , CAST(supplier_category_id AS INT) supplier_category_key
  
FROM `trangdang.dbt_project.purchasing__suppliers`
)

SELECT 
  ds.supplier_key
  , ds.supplier_name
  , ds.supplier_category_key
  , dc.supplier_category_name
FROM dim_supplier__source ds
LEFT JOIN {{ref('stg_dim_supplier_category')}} dc
ON ds.supplier_category_key = dc.supplier_category_key