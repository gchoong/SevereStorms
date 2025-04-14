{{ config(
    materialized='table',
    partition_by={
        'field': 'event_begin_time',
        'data_type': 'timestamp'
    },
    cluster_by=['event_type', 'state', 'event_year']
) }}

WITH main AS (
  SELECT
    event_id,
    UPPER(state) AS state,
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

SELECT *
FROM main
ORDER BY total_deaths DESC
