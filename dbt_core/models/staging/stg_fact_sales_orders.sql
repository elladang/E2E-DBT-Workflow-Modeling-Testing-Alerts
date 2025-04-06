SELECT 
  CAST(order_id AS INT) sales_order_key
  , CAST(customer_id AS INT) customer_key
  , CAST(salesperson_person_id AS INT) sales_person_person_key
  , CAST(picked_by_person_id AS INT) picked_by_person_key
  , CAST(contact_person_id AS INT) contact_person_key
  , CAST(order_date AS DATE) order_date
  , CAST(expected_delivery_date AS DATE) expected_delivery_date
  , CAST(	is_undersupply_backordered AS BOOLEAN) is_undersupply_backordered
FROM trangdang.dbt_project.sales__orders
