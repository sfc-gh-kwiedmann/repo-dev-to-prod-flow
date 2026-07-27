with source as (
    select * from BARCLAYS_DEV.DBT_MODELS.raw_customers
)

select
    customer_id,
    customer_name,
    segment,
    onboarded_date::date as onboarded_date
from source