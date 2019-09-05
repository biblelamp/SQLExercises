SELECT do.digitalni_objekt_id, do.soubor, lv.zobrazeni_urovne_id FROM digitalni_objekt do
JOIN
(WITH recursive cte (zobrazeni_urovne_id, rodic_id) AS
(
	SELECT zobrazeni_urovne_id, rodic_id FROM zobrazeni_urovne
	WHERE rizeni_id = 2 AND informacni_balicek_id = 4 AND typ='BALICEK'
	UNION
	SELECT zu.zobrazeni_urovne_id, zu.rodic_id FROM cte
	JOIN zobrazeni_urovne zu ON cte.zobrazeni_urovne_id = zu.rodic_id
)
SELECT * FROM cte) lv
ON do.zobrazeni_urovne_id = lv.zobrazeni_urovne_id
