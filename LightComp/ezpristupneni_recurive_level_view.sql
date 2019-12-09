WITH RECURSIVE cte (level_view_id, parent_id, description) AS
(
	SELECT level_view_id, parent_id, description FROM level_view
	WHERE level_view_id = 4
	UNION DISTINCT
	SELECT lv.level_view_id, lv.parent_id, lv.description FROM cte
	JOIN level_view lv ON cte.level_view_id=lv.parent_id
)
SELECT * FROM cte