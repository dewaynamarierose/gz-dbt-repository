
SELECT DISTINCT
  orders_id
  ,date_date
  ,CONCAT(date_date, '_',orders_id) AS date_order_id --PRIMARY KEY
  ,ROUND(SUM(revenue),2) AS revenue
  ,ROUND(SUM(quantity),2) AS quantity
  ,ROUND(SUM(purchase_cost),2) AS purchase_cost
  ,ROUND(SUM(margin),2) AS margin
FROM {{ref('int_sales_margin')}}
-- WHERE orders_id = 1002561 AND date_date = '2021-09-30' 
GROUP BY 1, 2