SELECT
    date_date
    ,COUNT(*) AS nb_of_transactions
    ,ROUND(SUM(revenue),2) AS total_revenue
    ,ROUND(SUM(revenue) / COUNT(*),2) AS average_basket 
    ,ROUND(SUM(operational_margin),2)AS operational_margin
    ,ROUND(SUM(purchase_cost),2) AS total_purchase_cost
    ,ROUND(SUM(shipping_fee),2) AS total_shipping_fees
    ,ROUND(SUM(log_cost),2) AS total_log_cost
    ,ROUND(SUM(quantity),2) AS total_products_sold
FROM {{ref('int_orders_operational')}}
GROUP BY date_date 
HAVING date_date IS NOT NULL
ORDER BY date_date 
