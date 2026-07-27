
    
    

select
    customer_id as unique_field,
    count(*) as n_records

from BARCLAYS_DEV.DBT_MODELS.mart_customer_summary
where customer_id is not null
group by customer_id
having count(*) > 1


