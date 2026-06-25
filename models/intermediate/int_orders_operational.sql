--Calculating operational margin per order by JOINing 'stg_raw__ship' and 'int_orders_margin'

SELECT
    orders_margin.orders_id
    ,orders_margin.date_date
    ,orders_margin.margin + ship.shipping_fee - ship.logcost - ship.ship_cost AS operational_margin
FROM {{ref('int_orders_margin')}} AS orders_margin
JOIN {{ref('stg_raw__ship')}} AS ship
    ON orders_margin.orders_id = ship.orders_id