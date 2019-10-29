SELECT *
FROM uroven_popisu l
WHERE l.rizeni_id = 1 AND l.uroven_popisu_id = (SELECT MIN(uroven_popisu_id) FROM uroven_popisu WHERE zobrazeni_urovne_id = 81)