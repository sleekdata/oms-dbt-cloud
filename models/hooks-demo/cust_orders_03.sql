{{ config(
    materialized='table',
    pre_hook = [
        "ALTER SESSION SET TIMEZONE = 'UTC'",
        "ALTER SESSION SET QUERY_TAG = 'oms_dbt'"
    ]
) }}

SELECT
    *,
    CASE WHEN amount > 500 THEN 'High' ELSE 'Normal' END AS order_category
FROM landing.customer_orders
