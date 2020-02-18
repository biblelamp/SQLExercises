WITH RECURSIVE cte (zobrazeni_urovne_id) AS
  (SELECT zu.zobrazeni_urovne_id FROM zobrazeni_urovne zu
   WHERE zu.rizeni_id = 1 AND zu.zobrazeni_urovne_id = 12
   UNION ALL
   SELECT zu.zobrazeni_urovne_id FROM cte
   JOIN zobrazeni_urovne zu ON cte.zobrazeni_urovne_id = zu.rodic_id)
SELECT * FROM cte
