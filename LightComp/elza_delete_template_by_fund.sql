DELETE FROM arr_output_template
WHERE output_id IN (SELECT o.output_id FROM arr_output o WHERE o.fund_id=2)