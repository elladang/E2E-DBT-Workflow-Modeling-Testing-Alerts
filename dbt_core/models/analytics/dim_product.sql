WITH dim_product__source AS (
    SELECT 
        CAST(stock_item_id AS INT) product_key
        , CAST(stock_item_name AS STRING) product_name
        , CAST(COALESCE(brand, "Undefined") AS STRING) brand_name
        , CAST( supplier_id AS INT ) supplier_key
    FROM `trangdang.dbt_project.warehouse__stock_items` 
)

SELECT 
    dp.product_key
    , dp.product_name
    , dp.brand_name
    , dp.supplier_key
    , ds.supplier_name
    , ds.supplier_category_key
    , ds.supplier_category_name
FROM dim_product__source dp
LEFT JOIN {{ref('dim_supplier')}} ds
ON dp.supplier_key = ds.supplier_key