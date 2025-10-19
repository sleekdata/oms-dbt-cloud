
SELECT
    order_id,
    customer_id,
    amount,
    CASE WHEN amount > 500 THEN 'High' ELSE 'Normal' END AS order_category
FROM landing.customer_orders
