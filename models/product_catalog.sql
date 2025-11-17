
{{ config(materialized = 'table') }}

select
    product_id,
    product_name,
    category_id,
    category_name,
    subcategory_id,
    subcategory_name

from {{ source('data_lake', 'product_catalog_ext') }}