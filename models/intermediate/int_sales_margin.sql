--Calculating margin per product by JOINing 'stg_raw__sales' and 'stg_raw__product' models

--FIRST CTE: Creating purchase_cost column and adding all necessary columns
WITH purchase_cost_calc AS(
    SELECT
        sales.date_date
        ,sales.products_id 
        ,sales.orders_id
        ,sales.revenue
        ,sales.quantity
       ,sales.quantity * product.purchase_price AS purchase_cost
    FROM {{ref('stg_raw__sales')}} AS sales
    JOIN {{ref('stg_raw__product')}} AS product
        ON sales.products_id = product.products_id
)
--SECOND CTE: Creating margin column with purchase_cost from first CTE
, margin_calc AS (
    SELECT
        sales.date_date
        ,sales.orders_id
        ,sales.products_id 
        ,sales.revenue
        ,sales.quantity
        ,pc.purchase_cost
       ,sales.revenue - purchase_cost AS margin
    FROM {{ref('stg_raw__sales')}} AS sales
    JOIN purchase_cost_calc AS pc
        ON sales.products_id = pc.products_id
)
SELECT *
FROM margin_calc