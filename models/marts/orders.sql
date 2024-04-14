with

orders as (

    select * from {{ ref('jaffle_shop_mesh_platform', 'stg_orders') }}

),

order_items_table as (

    select * from {{ ref('order_items') }}

),

order_items_summary as (

    select

        order_id,
        count(case when is_food_item then 1 else 0 end)
            as count_food_items,
        count(case when is_drink_item then 1 else 0 end)
            as count_drink_items,

        sum(supply_cost) as order_cost,
        sum(product_price - supply_cost) / sum(product_price) as gross_margin

    from order_items_table

    group by 1

),


compute_booleans as (
    select

        orders.*,
        coalesce(order_items_summary.order_cost, 0) as order_cost,
        coalesce(order_items_summary.gross_margin, 0) as gross_margin,
        coalesce(order_items_summary.count_food_items > 0, 0) as is_food_order,
        coalesce(order_items_summary.count_drink_items > 0, 0) as is_drink_order

    from orders

    left join
        order_items_summary
        on orders.order_id = order_items_summary.order_id
)

select * from compute_booleans
