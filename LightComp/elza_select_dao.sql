SELECT d.* FROM arr_dao d
JOIN arr_dao_package p ON d.dao_package_id = p.dao_package_id
JOIN arr_fund f ON f.fund_id = p.fund_id
WHERE f.fund_id = 1 AND d.valid IS TRUE
AND EXISTS(
	SELECT l from arr_dao_link l
	JOIN arr_node a ON a.node_id = l.node_id
	WHERE a.node_id = 4 AND l.dao_id = 1 AND l.delete_change_id IS NULL
)