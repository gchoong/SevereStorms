{{ config(materialized='table') }}

with main as (
SELECT
  event_id,
  UPPER(state) as state,
  SAFE_CAST(state_fips_code AS INT64) AS state_fips,
  INITCAP(event_type) AS event_type,
  event_begin_time,
  event_end_time,
  EXTRACT(YEAR FROM event_begin_time) AS event_year,
  EXTRACT(MONTH FROM event_begin_time) AS event_month,
  injuries_direct + injuries_indirect AS total_injuries,
  deaths_direct + deaths_indirect AS total_deaths,
  damage_property,
  damage_crops,
  damage_property + damage_crops AS total_damage,
  source,
  magnitude,
  magnitude_type,
  tor_f_scale,
  CAST(event_latitude AS FLOAT64) AS lat,
  CAST(event_longitude AS FLOAT64) AS lon
FROM {{ ref('stg_storms_fact') }}
)
select * from main order by total_deaths desc
