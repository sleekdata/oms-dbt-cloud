{{ config(
    
    post_hook=[
        "CREATE OR REPLACE TABLE dev_transform.{{ this.table }} CLONE {{ this }}"
    ]
) }}

SELECT
    *,
    CASE WHEN amount > 500 THEN 'High' ELSE 'Normal' END AS order_category
FROM landing.customer_orders
