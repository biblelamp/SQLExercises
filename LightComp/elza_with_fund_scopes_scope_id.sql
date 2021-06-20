WITH fund_scopes(scope_id) AS
  (SELECT scope_id AS scope FROM arr_fund_register_scope WHERE fund_id = 22)
SELECT scope_id from fund_scopes
UNION
SELECT connected_scope_id AS scope FROM ap_scope_relation WHERE scope_id IN
  (SELECT scope_id FROM fund_scopes)
