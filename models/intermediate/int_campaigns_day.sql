
SELECT
    date_date 
    ,ROUND(SUM(ads_cost),2) AS ads_cost
    ,ROUND(SUM(impression),2) AS impression
    ,ROUND(SUM(click),2) AS clicks
FROM {{ref('int_campaigns')}} 
WHERE date_date IS NOT NULL 
GROUP BY 1
ORDER BY date_date DESC