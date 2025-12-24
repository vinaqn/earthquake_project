{{
  config(
    materialized='view'
  )
}}
select 
"ALPHA-2" as country_code_alpha_2,
"ALPHA-3" as country_code_alpha_3,
NAME as country,
REGION as region,
"SUB-REGION" as sub_region,
"INTERMEDIATE-REGION" as intermediate_region
from {{ source('all_countries_geocode', 'countries_regional_codes') }}