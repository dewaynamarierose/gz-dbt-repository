
WITH operations_calc AS (
    SELECT
        orders_margin.orders_id
        ,orders_margin.date_date
        ,orders_margin.quantity
        ,orders_margin.revenue
        ,orders_margin.margin
        ,orders_margin.purchase_cost
        ,ship.ship_cost
        ,ship.log_cost 
        ,ship.shipping_fee
        ,orders_margin.margin + ship.shipping_fee - ship.log_cost - ship.ship_cost AS operational_margin
    FROM {{ref('int_orders_margin')}} AS orders_margin
    JOIN {{ref('stg_raw__ship')}} AS ship
        ON orders_margin.orders_id = ship.orders_id
)
--SECOND CTE: CREATING PRIMARY KEY 
, primary_key_add AS (
    SELECT DISTINCT
    date_date
    ,orders_id
    ,CONCAT(date_date, '_',orders_id) AS date_order_id --PRIMARY KEY
    ,quantity
    ,revenue
    ,margin
    ,purchase_cost
    ,ship_cost
    ,log_cost
    ,shipping_fee
    ,operational_margin
    FROM operations_calc
    WHERE date_date IS NOT NULL AND orders_id IS NOT NULL AND 3 IS NOT NULL
)
SELECT 
    *
FROM primary_key_add