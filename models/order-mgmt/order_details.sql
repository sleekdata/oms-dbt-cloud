select
    order_id,
    order_item_id,
    customer_id,
    product_id,
    product_name,
    order_date,
    order_status,
    quantity,
    unit_price,
    discount_percentage,
    expected_delivery_date,
    actual_delivery_date,
    shipping_country,

    -- Business logic 1: Total Amount
    quantity * unit_price
        * (1 - coalesce(discount_percentage, 0) / 100.0)
        as total_amount,

    -- Business logic 2: Delivery Performance Category
    case
        when actual_delivery_date < expected_delivery_date
            then 'Early'
        when actual_delivery_date = expected_delivery_date
            then 'On Time'
        when actual_delivery_date > expected_delivery_date
            then 'Late'
        else 'Unknown'
    end as delivery_performance_category

from {{ ref('order_line_items_joined') }}