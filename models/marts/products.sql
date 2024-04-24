with

products as (

    select * from {{ ref('jaffle_shop_mesh_platform', 'stg_products') }}

)

select * from products