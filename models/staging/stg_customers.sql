-- DELIBERATELY BROKEN: 'account_number' does not exist in raw_customers seed
-- Simulates upstream schema change breaking this model
with source as (
    select * from {{ ref('raw_customers') }}
)

select
    customer_id,
    customer_name,
    segment,
    account_number,  -- THIS COLUMN DOES NOT EXIST
    onboarded_date::date as onboarded_date
from source
