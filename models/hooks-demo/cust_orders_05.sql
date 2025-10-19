{{ config(
    materialized='table',
    post_hook=[
        "GRANT USAGE ON DATABASE {{ this.database }} TO ROLE analytics_team",
        "GRANT USAGE ON SCHEMA {{ this.schema }} TO ROLE analytics_team",
        "GRANT SELECT ON {{ this }} TO ROLE analytics_team"
    ]
) }}

SELECT
    order_id,
    customer_id,
    amount,
    CASE WHEN amount > 500 THEN 'High' ELSE 'Normal' END AS order_category
FROM landing.customer_orders