AUDIT (
    name account_status
);
Select * from raw.account
where account_status not in ('Active', 'Dormant')