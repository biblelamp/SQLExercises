WITH RECURSIVE cte (n, fact) AS 
(SELECT 0, 1 -- Initial Subquery
  UNION ALL 
 SELECT n+1, (n+1)*fact FROM cte -- Recursive Subquery 
        WHERE n < 9)
SELECT * FROM cte;