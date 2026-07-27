with transactions as (
    select * from BARCLAYS_DEV.DBT_MODELS.stg_transactions
),

customers as (
    select * from BARCLAYS_DEV.DBT_MODELS.stg_customers
)

select
    c.customer_id,
    c.customer_name,
    c.segment,
    count(t.transaction_id) as total_transactions,
    sum(t.amount) as total_amount,
    sum(t.amount +2) as total_amount_adjusted,
    avg(t.amount) as avg_transaction_amount,
    min(t.transaction_date) as first_transaction_date,
    max(t.transaction_date) as last_transaction_date
from customers c
left join transactions t on c.customer_id = t.customer_id
group by c.customer_id, c.customer_name, c.segment