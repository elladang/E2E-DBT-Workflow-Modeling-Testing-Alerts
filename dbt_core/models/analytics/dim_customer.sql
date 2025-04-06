WITH dim_customer__source AS(
SELECT  
    CAST (customer_id AS INT ) customer_key
  , CAST (customer_name AS STRING ) customer_name
  , CAST (is_statement_sent AS BOOLEAN ) is_statement_sent
  , CAST (is_on_credit_hold AS BOOLEAN ) is_on_credit_hold
  , CAST (credit_limit AS NUMERIC ) credit_limit
  , CAST (standard_discount_percentage AS NUMERIC ) standard_discount_percentage
  , CAST (payment_days AS INT ) payment_days
  , CAST (account_opened_date AS TIMESTAMP ) account_opened_date
  , CAST (customer_category_id AS INT ) customer_category_key
  , CAST (delivery_city_id AS INT ) delivery_city_key
  , CAST (postal_city_id AS INT ) postal_city_key
  , CAST (COALESCE(buying_group_id,0) AS INT ) buying_group_key
  , CAST (primary_contact_person_id AS INT ) primary_contact_person_key
  , CAST (COALESCE(alternate_contact_person_id,0) AS INT ) alternate_contact_person_key

FROM `trangdang.dbt_project.sales__customers` )


SELECT 
  dc.customer_key
  , dc.customer_name
  , CASE 
      WHEN dc.is_statement_sent IS TRUE THEN "Sent"
      WHEN dc.is_statement_sent IS FALSE THEN "Not Sent"
      ELSE "Invalid" END is_statement_sent
  , CASE 
      WHEN dc.is_on_credit_hold IS TRUE THEN "On Credit Hold"
      WHEN dc.is_on_credit_hold IS FALSE THEN "Not On Credit Hold"
      ELSE "Invalid" END is_on_credit_hold
  , dc.credit_limit
  , dc.standard_discount_percentage
  , dc.payment_days
  , dc.account_opened_date
  , dc.customer_category_key
  , dcat.customer_category_name
  , dc.buying_group_key
  , db.buying_group_name
  , dc.delivery_city_key
  , dim_deli.city_name delivery_city_name
  , dim_deli.state_province_key delivery_state_province_key
  , dim_deli.state_province_name delivery_state_province_name
  , dc.postal_city_key
  , dim_pst.city_name postal_city_name
  , dim_pst.state_province_key postal_state_province_key
  , dim_pst.state_province_name postal_state_province_name
  , dc.primary_contact_person_key
  , dper.full_name primary_contact_full_name
  , dc.alternate_contact_person_key
  , dpa.full_name alternate_contact_full_name

FROM dim_customer__source dc
LEFT JOIN {{ref('stg_dim_customer_category')}} dcat 
ON dc.customer_category_key = dcat.customer_category_key
LEFT JOIN {{ref('stg_dim_buying_group')}} db
ON dc.buying_group_key = db.buying_group_key
LEFT JOIN {{ref('dim_city')}}dim_deli
ON dc.delivery_city_key = dim_deli.city_key
LEFT JOIN {{ref('dim_city')}}dim_pst
ON dc.postal_city_key = dim_pst.city_key
LEFT JOIN {{ref('dim_person')}} dper
ON dc.primary_contact_person_key = dper.person_key
LEFT JOIN {{ref('dim_person')}} dpa
ON dc.alternate_contact_person_key = dpa.person_key
