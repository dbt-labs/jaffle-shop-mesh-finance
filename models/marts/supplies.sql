with

supplies as (

    select * from {{ ref('jaffle_shop_mesh_platform', 'stg_supplies') }}

)

select * from supplies