SELECT lv.zobrazeni_urovne_id, lv.typ, ld.popis, l.skartacni_znak, l.skartacni_lhuta, l.identifikator_puvodce
FROM zobrazeni_urovne lv
	JOIN popis_urovne ld ON lv.popis_urovne_id = ld.popis_urovne_id
	JOIN uroven_popisu l ON l.zobrazeni_urovne_id = lv.zobrazeni_urovne_id
WHERE lv.rizeni_id = 1 
	AND lv.zobrazeni_urovne_id = 81
	AND l.uroven_popisu_id = (SELECT MIN(uroven_popisu_id) FROM uroven_popisu WHERE zobrazeni_urovne_id = 81)