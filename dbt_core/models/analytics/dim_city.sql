WITH dim_city__source AS (
SELECT  
  CAST (city_id AS INT ) city_key
  , CAST (city_name AS STRING ) city_name
  , CAST (state_province_id AS INT ) state_province_key
FROM `trangdang.dbt_project.application__cities`
 )

SELECT 
   city_key
    , city_name
    , ds.state_province_key 
    , CAST(sp.postal_state_province_name AS STRING) state_province_name
FROM dim_city__source ds
LEFT JOIN {{ref('dim_state_province')}} sp
ON ds.state_province_key = sp.state_province_key


fhhuis