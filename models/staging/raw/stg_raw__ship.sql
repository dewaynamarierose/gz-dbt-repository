--first CTE used to create model from ship (orginally raw_gz_ship)
with 

source as (

    select * from {{ source('raw', 'ship') }}

),

renamed as (
-- this is the second CTE selecting specific the columns from the ship table
    select
        orders_id,
        shipping_fee,
        logcost,
        CAST(ship_cost AS INT64) AS ship_cost -- changed data type from string to INT data type 

    from source

)

select * from renamed