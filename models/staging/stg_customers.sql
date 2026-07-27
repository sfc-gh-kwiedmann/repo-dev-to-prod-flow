with source as (
    select * from {{ ref('raw_customers') }}
)

select
    customer_id,
    customer_name,
    segment,
    onboarded_date::date as onboarded_date
from source
