SELECT u.user_id, u.user, u.first_name, u.last_name, u.verified, COUNT(rs.research_sheet_id) FROM user u
LEFT JOIN research_sheet rs ON rs.user_id=u.user_id AND rs.rsstate='NEW'
GROUP BY u.user_id