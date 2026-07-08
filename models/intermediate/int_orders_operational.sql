

SELECT
    orders_margin.orders_id
    ,orders_margin.date_date
    ,orders_margin.quantity
    ,orders_margin.revenue
    ,orders_margin.margin
    ,orders_margin.purchase_cost
    ,ship.ship_cost
    ,ship.logcost AS log_cost
    ,ship.shipping_fee
    ,orders_margin.margin + ship.shipping_fee - ship.logcost - ship.ship_cost AS operational_margin
FROM {{ref('int_orders_margin')}} AS orders_margin
JOIN {{ref('stg_raw__ship')}} AS ship
    ON orders_margin.orders_id = ship.orders_id