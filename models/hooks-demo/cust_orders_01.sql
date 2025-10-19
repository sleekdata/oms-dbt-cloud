{{ config(
    materialized='table',
    pre_hook=[
        "
        COPY INTO landing.customer_orders
        FROM @landing.oms_analytics_stage/customer_orders.csv
        FILE_FORMAT=(TYPE='CSV' SKIP_HEADER=1)
        "
    ]
) }}

SELECT
    *,
    CASE WHEN amount > 500 THEN 'High' ELSE 'Normal' END AS order_category
FROM landing.customer_orders