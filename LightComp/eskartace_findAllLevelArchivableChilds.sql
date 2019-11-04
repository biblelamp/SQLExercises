SELECT zobrazeni_urovne_id, rodic_id, list, computed_depth, typ, nazev_urovne, skartacni_znak, zamek, rozhodnuti
FROM (WITH RECURSIVE cte 
		(zobrazeni_urovne_id, rodic_id, poradi, expanded, sort_col, computed_depth, typ, list, nazev_urovne, skartacni_znak, zamek, rozhodnuti)
	AS (SELECT zu.zobrazeni_urovne_id, zu.rodic_id, zu.poradi, zu.zobrazeni_urovne_id IN (9223372036854775807) AS expanded,
			CAST(LPAD(poradi, 6, 0) AS CHAR(128)) AS sort_col,
         IF(zu.typ IN ('SPIS', 'DOKUMENT', 'KOMPONENTA'), 1, 0) computed_depth,
         	zu.typ, zu.list, zu.nazev_urovne, zu.skartacni_znak, zu.zamek, zu.rozhodnuti
         FROM zobrazeni_urovne zu
         WHERE zu.rodic_id = 6 AND zu.rizeni_id = 1
		UNION DISTINCT
			SELECT zu.zobrazeni_urovne_id, zu.rodic_id, zu.poradi, zu.zobrazeni_urovne_id IN (9223372036854775807),
				CONCAT(cte.sort_col, LPAD(zu.poradi, 6, '0')),
            IF(zu.typ IN ('SPIS', 'DOKUMENT', 'KOMPONENTA'), cte.computed_depth + 1, 0) computed_depth,
					zu.typ, zu.list, zu.nazev_urovne, zu.skartacni_znak, zu.zamek, zu.rozhodnuti
         FROM cte
       	JOIN zobrazeni_urovne zu ON zu.rodic_id = cte.zobrazeni_urovne_id
				WHERE (cte.computed_depth = 0 OR cte.expanded = TRUE) AND zu.typ IN ('SPIS', 'DOKUMENT', 'KOMPONENTA') AND zu.rizeni_id = 1
       )
	SELECT zobrazeni_urovne_id, rodic_id, list, computed_depth, typ, sort_col, nazev_urovne, skartacni_znak, zamek, rozhodnuti
	FROM cte
) x
	WHERE x.computed_depth > 0
   ORDER BY sort_col
