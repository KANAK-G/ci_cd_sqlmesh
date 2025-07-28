
MODEL (
  name enrich.transactions,
  kind full ,
   cron '*/5 * * * *',
    Audits (unique_values(columns := (transaction_id)))

);


Select * from raw.transactions