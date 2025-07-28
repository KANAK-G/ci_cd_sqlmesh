AUDIT (
  name check_null_on_columns
);
SELECT * FROM @this_model
WHERE @column_name IS NULL;

