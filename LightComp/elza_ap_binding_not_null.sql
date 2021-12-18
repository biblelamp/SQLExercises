select * from ap_binding where value is null

UPDATE ap_binding SET value = 'missing_value_' || CAST(binding_id AS text)
WHERE value IS NULL

UPDATE ap_binding SET value = CONCAT('missing_value_', CAST(binding_id AS text))
WHERE value IS NULL

select * from ap_binding where value like 'missing%'