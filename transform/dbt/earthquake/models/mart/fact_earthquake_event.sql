{{
  config(
    materialized="incremental",
    unique_key="earthquake_id",
    incremental_strategy="delete+insert"
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
{% if is_incremental() %}
where updated_at > (select max(updated_at) from {{ this }})
{% endif %}