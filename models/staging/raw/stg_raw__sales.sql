--CTE used to create model from sales (orginally raw_gz_sales)
with 

source as (
--this is the first CTE that selects the dataset
    select * from {{ source('raw', 'sales') }}

),

renamed as (
-- this is the second CTE selecting specific the columns from the sales table 
    select
        date_date,
        orders_id,
        pdt_id AS products_id,
        revenue,
        quantity

    from source

)

select * from renamed