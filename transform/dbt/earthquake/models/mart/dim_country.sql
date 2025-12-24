{{
  config(
    materialized='table'
  )
}}
select
    country.country_code_alpha_2,
    country.country_code_alpha_3,
    country.country_name,
    country.country_region,
    country.sub_region,
    country.intermediate_region
from {{ ref ('staging_countries_codes') }} as country