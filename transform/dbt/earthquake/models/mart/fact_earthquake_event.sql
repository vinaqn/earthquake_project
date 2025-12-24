{{
  config(
    materialized='table'
  )
}}

select
    earthquake_id,
    occurred_at,
    updated_at,
    magnitude,
    earthquake_place,
    longitude,
    latitude,
    depth_km,
    page_title,
    web_url
from {{ ref('staging_earthquake') }}