SELECT *
FROM informacni_balicek ib
WHERE ib.informacni_balicek_id = (SELECT MIN(ib.informacni_balicek_id) FROM informacni_balicek ib WHERE ib.prejimka_id=2);

SELECT *
FROM zobrazeni_urovne lv
JOIN uroven_popisu l 
    ON l.zobrazeni_urovne_id=lv.zobrazeni_urovne_id
	     AND l.informacni_balicek_id = (SELECT MIN(ib.informacni_balicek_id) FROM informacni_balicek ib WHERE ib.prejimka_id=2)
WHERE lv.prejimka_id=2 AND lv.rodic_id=2;
