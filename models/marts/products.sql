with

products as (

    select
        product_id,
        product_name,
        product_type,
        product_description,
        product_price,
        is_food_item,
        is_drink_item
    from {{ ref('jaffle_shop_mesh_platform', 'stg_products') }}

)

select * from products
