
MODEL (
  name enrich.account,
  kind full ,
   cron '*/5 * * * *',
  audits (account_status,
  unique_values(columns := (account_id)))
);

Select
account_id,
account_number,
product_id,
account_origination_date as opening_date,
current_balance,
avg_monthly_balance,
avg_qtr_balance,
primary_account_holder_id as cust_id,
available_balance,
credit_card,
debit_card,
currency_code,
account_status,
source_channel,
campaign_id,
applied_interest_rate,
statement_date,
mode_of_statement
from raw.account
