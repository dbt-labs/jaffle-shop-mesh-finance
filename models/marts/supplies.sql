with

supplies as (

    select * from {{ ref('cirque_du_jaffle', 'stg_supplies') }}

)

select * from supplies