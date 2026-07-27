with source as (
    select * from {{ ref('raw_transactions') }}
)

select
    transaction_id,
    customer_id,
    amount,
    currency,
    transaction_date::date as transaction_date,
    status,
    current_timestamp() as loaded_at
from source
where status != 'failed'
