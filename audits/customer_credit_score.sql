AUDIT (
    name customer_credit_score
);
Select * from raw.customer
where cibil_score > 900;