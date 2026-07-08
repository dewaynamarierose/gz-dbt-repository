
SELECT 
  orders_id
  ,date_date
  ,revenue
  ,quantity
  ,purchase_cost
  ,margin
FROM {{ref('int_sales_margin')}}
-- WHERE orders_id = 1002561 AND date_date = '2021-09-30' AND revenue = 896.95