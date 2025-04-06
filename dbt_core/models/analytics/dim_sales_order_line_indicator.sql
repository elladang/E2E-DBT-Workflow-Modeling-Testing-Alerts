
WITH dim_is_undersupply_backordered AS (
  SELECT
    TRUE AS is_undersupply_backordered_boolean
    , 'Undersupply Backordered' AS is_undersupply_backordered
  UNION ALL
  SELECT
    FALSE AS is_undersupply_backordered_boolean
    , 'Not Undersupply Backordered' AS is_undersupply_backordered
)
SELECT 
    FARM_FINGERPRINT(CONCAT(is_undersupply_backordered_boolean,",",package_type_key )) sales_order_line_indicator_key
    , is_undersupply_backordered
    , package_type_name
FROM dim_is_undersupply_backordered db
CROSS JOIN {{ref('dim_package_type')}} pt
ORDER BY 1,3