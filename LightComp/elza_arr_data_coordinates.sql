select data_id, ST_AsText(value) from arr_data_coordinates
where ST_GeometryType(value) = 'ST_Point'

select data_id, ST_X(value), ST_Y(value) from arr_data_coordinates where ST_GeometryType(value) = 'ST_Point'

insert into arr_data_coordinates (data_id, value) values (14, ST_Point(41.123, -9.456))

update arr_data_coordinates set value = ST_Point(ST_X(value), ST_Y(value))
where ST_GeometryType(value) = 'ST_Point'

WITH p AS
(SELECT value, ST_AsText(value), ST_X(value) x, ST_Y(value) y FROM arr_data_coordinates
 WHERE data_id IN (SELECT data_id FROM arr_data_coordinates WHERE ST_GeometryType(value) = 'ST_Point'))
SELECT * FROM p
  WHERE p.x > p.y
   AND (p.x BETWEEN 36 AND 70)
   AND (p.y BETWEEN -10 AND 40)

UPDATE arr_data_coordinates SET value = ST_Point(d.y, d.x)
FROM (WITH p AS
(SELECT data_id, ST_AsText(value), ST_X(value) x, ST_Y(value) y FROM arr_data_coordinates
  WHERE data_id IN (SELECT d.data_id FROM arr_data_coordinates d
	JOIN arr_item i ON i.data_id = d.data_id
	WHERE ST_GeometryType(d.value) = 'ST_Point'))
SELECT * FROM p
  WHERE p.x > p.y
    AND (p.x BETWEEN 36 AND 70)
    AND (p.y BETWEEN -10 AND 40)) AS d
WHERE arr_data_coordinates.data_id = d.data_id

UPDATE arr_data_coordinates SET value = ST_Point(d.y, d.x)
FROM (SELECT data_id, ST_AsText(value), ST_X(value) x, ST_Y(value) y FROM arr_data_coordinates
  WHERE data_id IN (SELECT d.data_id FROM arr_data_coordinates d
	JOIN arr_item i ON i.data_id = d.data_id
	WHERE ST_GeometryType(d.value) = 'ST_Point')
) AS d
WHERE arr_data_coordinates.data_id = d.data_id

DELETE FROM arr_cached_node

select data_id from arr_data where data_type_id = 7

select data_id from arr_item where data_id in (select data_id from arr_data where data_type_id = 7)
