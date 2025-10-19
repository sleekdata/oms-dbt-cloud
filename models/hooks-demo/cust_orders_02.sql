
{{ config(
    pre_hook=[
        "CREATE OR REPLACE TABLE BACKUP.customer_orders AS SELECT * FROM {{ this }}"
    ]
) }}


SELECT
    *,
    CASE WHEN amount > 500 THEN 'High' ELSE 'Normal' END AS order_category
FROM landing.customer_orders
