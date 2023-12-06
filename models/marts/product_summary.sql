select
    count(
        distinct product_id
    ) as number_of_products,
    count(
        case when
            is_food_item then 1 end
    ) as number_of_food_items,
    count(
        case when
            is_drink_item then 1 end
    ) as number_of_drink_items
from {{ ref('products') }}
