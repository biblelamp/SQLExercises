WITH RECURSIVE cte (uuid, filename, level_view_id, parent_id, description) AS
(
	SELECT i.uuid, d.filename, l.level_view_id, l.parent_id, l.description FROM level_view l
	  JOIN cart_item c ON c.level_view_id=l.level_view_id
	  JOIN information_package i ON i.information_package_id=l.information_package_id
	  JOIN dao d ON d.level_view_id=l.level_view_id
  	WHERE c.cart_order_id = 6
	UNION DISTINCT
	SELECT  cte.uuid, cte.filename, lv.level_view_id, lv.parent_id, lv.description FROM cte
	  JOIN level_view lv ON cte.level_view_id=lv.parent_id
)
SELECT * FROM cte