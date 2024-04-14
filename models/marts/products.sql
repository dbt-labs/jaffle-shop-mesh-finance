with products as (

    select * from {{ ref('jaffle_shop_mesh_platform', 'stg_products') }}

),

supplies as (

    select * from {{ ref('jaffle_shop_mesh_platform', 'stg_supplies') }}

),

order_supplies_summary as (

    select
        product_id,
        boolor_agg(is_perishable_supply) as is_perishable,
        sum(supply_cost) as supply_cost

    from supplies

    group by 1

),

joined as (

    select

        products.*,
        order_supplies_summary.is_perishable,
        order_supplies_summary.supply_cost,
        (products.product_price - order_supplies_summary.supply_cost)
        / products.product_price as gross_margin

    from order_supplies_summary
    inner join products
        on order_supplies_summary.product_id = products.product_id

)

select * from joined
