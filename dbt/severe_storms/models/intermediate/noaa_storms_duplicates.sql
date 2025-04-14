SELECT
  pk,
  COUNT(*) AS record_count
FROM {{ ref('stg_storms_fact') }}
GROUP BY pk
HAVING COUNT(*) > 1
