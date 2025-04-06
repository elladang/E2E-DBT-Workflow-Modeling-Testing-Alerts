WITH dim_date__generate as (
SELECT 
*
FROM unnest(generate_date_array('2010-01-01', '2030-12-31', interval 1 day)) as date
), dim_date__enrich as (
SELECT 
*, 
FORMAT_DATE('%A', date ) date_of_week, 
FORMAT_DATE('%a', date ) date_of_week_short, 
DATE_TRUNC(date, MONTH) year_month, 
FORMAT_DATE('%B', date) month, 
EXTRACT(YEAR FROM date) year_number
FROM dim_date__generate
) 
SELECT 
*, 
CASE WHEN date_of_week_short in ('Mon', 'Tue', 'Wed', 'Thu', 'Fri') THEN "Weekday"
     WHEN date_of_week_short in ('Sat', 'Sun') THEN 'Weekend'
     else 'Invalid' end is_weekday_or_weekend
FROM dim_date__enrich