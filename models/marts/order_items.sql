with

order_items as (

    select * from {{ ref('jaffle_shop_mesh_platform', 'stg_order_items') }}

),


orders as (

    select * from {{ ref('jaffle_shop_mesh_platform', 'stg_orders') }}
),

products as (

    select * from {{ ref('products') }}

),

joined as (
    select
        order_items.*,
        products.product_price,
        products.supply_cost,
        products.gross_margin,
        products.is_food_item,
        products.is_drink_item,
        orders.ordered_at

    from order_items

    left join orders on order_items.order_id = orders.order_id

    left join products on order_items.product_id = products.product_id

)

select * from joined
