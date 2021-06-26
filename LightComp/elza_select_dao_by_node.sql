SELECT EXISTS(
	SELECT d.* FROM arr_dao d
	JOIN arr_dao_link l ON l.dao_id = d.dao_id
	WHERE l.node_id = 45 AND d.dao_type = 'LEVEL' AND l.delete_change_id IS NULL
)