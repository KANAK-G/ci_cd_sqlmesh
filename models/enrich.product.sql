
MODEL (
  name enrich.product,
  kind full ,
  cron '*/5 * * * *',
  audits(
  unique_values(columns := (product_id)),
   account_status,
  check_null_on_columns(column_name := product_id)
  )
);

With product_cte as (
Select "key"
type,
name,
currency_code,
status,
credit_interest_rate,
debit_interest_rate,
credit_line_amount,
created_at,
modified_at,
id as product_id
from raw.product
)


,total_account_per_product as(
Select product_id,
count(Distinct account_id ) as total_account,
count(primary_account_holder_id) as total_customer,
count(account_id) filter (where account_status = 'Active' ) as total_Active_account,
count(account_id) filter (where account_status = 'Dormant' ) as total_Dormant_account
from raw.account
group by 1
order by product_id)

, current_holding_ammount as (
Select product_id, sum(current_balance) as total_balance from raw.account
group by 1
order by product_id)

Select pp.*,
total_account,
total_customer,
total_Active_account,
total_Dormant_account,
total_balance
from
product_cte pp
left join total_account_per_product tp on tp.product_id = pp.product_id
left join current_holding_ammount ch on ch.product_id = pp.product_id
