
AUDIT (
    name transactions_amt
);
Select * from raw.transactions
where transaction_amnt < 1;