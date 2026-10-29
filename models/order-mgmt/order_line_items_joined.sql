select
    o.order_id,
    oi.order_item_id,
    o.customer_id,
    oi.product_id,
    oi.product_name,
    o.order_date,
    o.order_status,
    oi.quantity,
    oi.unit_price,
    oi.discount_percentage,
    o.expected_delivery_date,
    o.actual_delivery_date,
    o.shipping_country

from {{ source('landing', 'orders') }} o

inner join {{ source('landing', 'orderitems') }} oi
    on o.order_id = oi.order_id