AUDIT (
    name customer_id_null
);
SELECT *
FROM raw.customer
WHERE cust_id IS NULL;
