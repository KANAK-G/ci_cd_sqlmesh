AUDIT (
  name check_date_format
);

select * from @this_model
where @column_name not like '____-__-__' limit 10;
