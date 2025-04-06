
WITH fact_sales_order_line__source AS (
SELECT 
  CAST(order_line_id AS INT) sales_order_line_key
  , CAST(order_id AS INT) sales_order_key
  , CAST(stock_item_id AS INT) product_key
  , CAST(package_type_id AS INT) package_type_key
  , CAST(quantity AS INT) quantity
  , CAST(unit_price AS NUMERIC) unit_price
  , CAST(unit_price * quantity AS NUMERIC)  gross_amount
 FROM trangdang.dbt_project.sales__order_lines
)
 SELECT 
  sales_order_line_key
  , fol.sales_order_key
  , fso.customer_key
  , fso.sales_person_person_key
  , FARM_FINGERPRINT(CONCAT(is_undersupply_backordered,",",package_type_key )) sales_order_line_indicator_key
  , fso.contact_person_key
  , product_key
  , quantity
  , unit_price
  , gross_amount
  , order_date
  , expected_delivery_date
FROM fact_sales_order_line__source fol
LEFT JOIN {{ref('stg_fact_sales_orders')}} fso 
ON  fol. sales_order_key = fso. sales_order_key