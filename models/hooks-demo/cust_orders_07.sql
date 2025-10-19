{{ config(
    materialized='table',
    post_hook=[
        "
        COPY INTO @landing.oms_analytics_stage/exports/customer_orders_{{ run_started_at.strftime('%Y%m%d%H%M%S') }}.csv
        FROM landing.customer_orders
        FILE_FORMAT=(TYPE='CSV' FIELD_OPTIONALLY_ENCLOSED_BY='\"')
        "
    ]
) }}

SELECT
    *,
    CASE WHEN amount > 500 THEN 'High' ELSE 'Normal' END AS order_category
FROM landing.customer_orders
