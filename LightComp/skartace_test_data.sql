-- DELETE FROM rizeni;
INSERT INTO rizeni
	(rizeni_id, typ, stav, cesta, cas_zalozeni, archiv_kod, archiv_nazev, puvodce_id, puvodce_nazev)
VALUE
	(1, "typ", "stav", "cesta", "2019-07-17", "1", "archiv", "1", "puvodce");

-- DELETE FROM informacni_balicek;
INSERT INTO informacni_balicek
	(informacni_balicek_id, rizeni_id, uuid, stav_komponent, stav_vyberu, cesta, velikost, stav)
VALUE
	(1, 1, "uuid", "S_KOMPONENTAMI", "A", "cesta", 1, "ZALOZEN");
	
-- DELETE FROM popis_urovne;
INSERT INTO popis_urovne
	(popis_urovne_id, rizeni_id, popis)
VALUE
	(1, 1, "popis");

-- DELETE FROM zobrazeni_urovne;
INSERT INTO zobrazeni_urovne
	(zobrazeni_urovne_id, rizeni_id, informacni_balicek_id, popis_urovne_id, hloubka, list, nazev_urovne, poradi, typ, zamek)
VALUE
	(1, 1, 1, 1, 1, 0, "nazev", 1, "KOMPONENTA", 0);
	
-- DELETE FROM uroven_popisu;
INSERT INTO uroven_popisu
	(uroven_popisu_id, rizeni_id, zobrazeni_urovne_id, rodic_id, informacni_balicek_id, popis_urovne_id, absolutni_poradi, hloubka, list, typ)
VALUES
	(1, 1, 1, 1, 1, 1, 1, 1, 0, "typ");

-- DELETE FROM digitalni_objekt;
INSERT INTO digitalni_objekt
	(digitalni_objekt_id, informacni_balicek_id, uroven_popisu_id, zobrazeni_urovne_id, soubor, mime, velikost, pozice)
VALUES
	(1, 1, 1, 1, "file", "text", 1, 0);
	
-- SELECT RECORDS

SELECT * FROM digitalni_objekt dao
	JOIN zobrazeni_urovne zu on zu.zobrazeni_urovne_id = dao.zobrazeni_urovne_id
	WHERE zu.zobrazeni_urovne_id = 1;
	
-- DELETE RECORDS

-- DELETE Dao
DELETE dao FROM digitalni_objekt dao
	INNER JOIN informacni_balicek ip ON dao.informacni_balicek_id = ip.informacni_balicek_id
	WHERE ip.rizeni_id = 1;

-- DELETE Level
UPDATE uroven_popisu SET rodic_id = NULL, zobrazeni_urovne_id = NULL WHERE rizeni_id = 1;
DELETE FROM uroven_popisu WHERE rizeni_id = 1;

-- DELETE LevelView
DELETE FROM zobrazeni_urovne WHERE rizeni_id = 1;

-- DELETE LevelDescription
DELETE FROM popis_urovne WHERE rizeni_id = 1;

-- DELETE InformacniBalicek
DELETE FROM informacni_balicek WHERE rizeni_id = 1;

-- DELETE Skartace
DELETE FROM rizeni WHERE rizeni_id = 1;
