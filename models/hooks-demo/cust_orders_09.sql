{{ config(
    materialized='table',
    post_hook=[
        "
        CALL analytics.transform.send_email(
            'sleekdatasolutions@gmail.com',
            'Customer Orders Completed',
            'Data loaded into customer_orders table successfully'
        )
        "
    ]
) }}

SELECT
    *,
    CASE WHEN amount > 500 THEN 'High' ELSE 'Normal' END AS order_category
FROM landing.customer_orders