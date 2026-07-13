
WITH purchase_cost_calc AS(
    SELECT
         sales.date_date
        ,sales.products_id 
        ,sales.orders_id
        ,sales.revenue
        ,sales.quantity
        ,product.purchase_price 
       ,sales.quantity * product.purchase_price AS purchase_cost
    FROM {{ref('stg_raw__sales')}} AS sales
    JOIN {{ref('stg_raw__product')}} AS product
        ON sales.products_id = product.products_id
)
--SECOND CTE: Creating margin column with purchase_cost from first CTE
, margin_calc AS (
    SELECT
       date_date
       ,orders_id
       ,products_id
       ,CONCAT(orders_id,'_',products_id) AS order_product_id --PRIMARY KEY
       ,revenue
       ,quantity
       ,purchase_cost
       ,purchase_price
       ,ROUND((revenue - purchase_cost),2) AS margin
    FROM purchase_cost_calc
)
SELECT *
FROM margin_calc