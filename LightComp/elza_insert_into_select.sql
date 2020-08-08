-- insert record from result of select
INSERT INTO arr_output_template (output_id, template_id)
SELECT o.output_id, o.template_id
FROM arr_output o;

-- added record in db_hibernate_sequences table
INSERT INTO db_hibernate_sequences (sequence_name, next_val)
SELECT 'arr_output_template|output_template_id', COALESCE(MAX(output_template_id),0)+1
FROM arr_output_template;