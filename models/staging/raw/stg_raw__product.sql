--CTE used to create model from product (orginally raw_gz_product)
with 

source as (

    select * from {{ source('raw', 'product') }}

),

renamed as (
-- this is the second CTE selecting specific the columns from the products table 
    select
        products_id,
        CAST(purchse_price AS FLOAT64) AS purchase_price -- changed purchse_price name with alias and CASTED into FLOAT64 data type 

    from source

)

select * from renamed