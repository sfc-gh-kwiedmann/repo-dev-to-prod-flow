-- Depends ONLY on stg_transactions → should PASS even if stg_customers fails
-- This model tests whether independent DAG paths continue after a failure
with transactions as (
    select * from {{ ref('stg_transactions') }}
)

select
    currency,
    count(transaction_id) as transaction_count,
    sum(amount) as total_amount,
    avg(amount) as avg_amount
from transactions
group by currency
