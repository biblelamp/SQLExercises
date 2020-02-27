-- DELETE FROM rizeni;
INSERT INTO rizeni
	(rizeni_id, typ, stav, cesta, cas_zalozeni, archiv_kod, archiv_nazev, puvodce_id, puvodce_nazev, smazat)
VALUE
	(1, "VOLNA", "VYTVORENA", "C:\temp", "2019-07-17", "1", "archiv", "1", "puvodce", 0);

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
	(1, 1, 1, 1, 1, 0, "nazev", 1, "ZDROJ", 0);
	
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
	
-- TEST FinalizedService.generateCsvReportSip

INSERT INTO `event`
	(queue_name, category_name, operation, state, inserted, context, rizeni_id)
VALUES
	("finalized", "validation_report_1", "generateValidationReport", "PRIPRAVENA", CURRENT_TIMESTAMP, "1", 1);

-- TEST ExcelReportService.updateSelection

INSERT INTO `event`
	(queue_name, category_name, operation, state, inserted, rizeni_id)
VALUES
	("editor", "update_result_1.xlsx", "UPDATE_RESULT", "PRIPRAVENA", CURRENT_TIMESTAMP, 1);

--- TEST NotificationService.creatInformationFilled

INSERT INTO `event`
	(queue_name, category_name, operation, state, inserted, rizeni_id)
VALUES
	("cro", "send_1", "INFORMACE_DOPLNENY", "PRIPRAVENA", CURRENT_TIMESTAMP, 1);

-- TEST InputFiles

INSERT INTO `event`
	(event_id, queue_name, category_name, operation, state, inserted, CONTEXT, rizeni_id)
VALUES
	(1, "input", "category_name", "files", "PRIPRAVENA", CURRENT_TIMESTAMP, "1", 1);
	
-- TEST ZipProcessor

INSERT INTO `event`
	(queue_name, category_name, state, inserted, rizeni_id, informacni_balicek_id)
VALUES
	("zip", "zip_package", "PRIPRAVENA", CURRENT_TIMESTAMP, 4, 1);
	
-- TEST FOR zipPackages

SELECT COUNT(*)
FROM
	informacni_balicek
WHERE
	informacni_balicek_id IN (1, 2, 3)
GROUP BY rizeni_id

-- TEST DELETE balicek

INSERT INTO `event`
	(event_id, queue_name, category_name, operation, state, inserted, CONTEXT, rizeni_id, informacni_balicek_id)
VALUES
	(1, "delete", "category_name", "delete_package", "PRIPRAVENA", CURRENT_TIMESTAMP, "1", 1, 1);

-- SELECT RECORDS

SELECT * FROM digitalni_objekt dao
	INNER JOIN zobrazeni_urovne zu ON zu.zobrazeni_urovne_id = dao.zobrazeni_urovne_id
	WHERE zu.zobrazeni_urovne_id = 1;
	
SELECT COUNT(*) FROM zobrazeni_urovne zu
	WHERE zu.typ IN ('VECNA_SKUPINA', 'DOKUMENT', 'SPIS')
	AND (zu.rozhodnuti = 'V' OR zu.rozhodnuti IS NULL)
	AND rizeni_id = 1

SELECT * FROM (
	SELECT * FROM rizeni
		WHERE archiv_nazev LIKE '%ar1c%'
	UNION DISTINCT
	SELECT r.* FROM rizeni r
	   JOIN opravneni o ON r.rizeni_id = o.opravneni_id
	   WHERE r.rizeni_id = 2
) x

SELECT * FROM rizeni r
   JOIN opravneni o ON r.rizeni_id = o.opravneni_id
	WHERE r.archiv_nazev LIKE '%arc%'
	
-- SELECT LevelView (1+1)

SELECT * FROM zobrazeni_urovne
WHERE rizeni_id = 3 AND informacni_balicek_id = 5

-- +

SELECT * FROM zobrazeni_urovne zu
WHERE zu.rizeni_id = 3 AND zu.rodic_id = 466

-- =

SELECT * FROM zobrazeni_urovne
WHERE rodic_id IN (SELECT zobrazeni_urovne_id FROM zobrazeni_urovne WHERE rizeni_id = 3 AND informacni_balicek_id = 5)

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

-- DELETE FROM osoba;
INSERT INTO osoba
	(entita_id, pref_name)
VALUE
	("piter", "Piter"),
	("karel", "Karel"),
	("sergey", "Sergey"),
	("firma", "Firma")

-- DELETE from uzivatel;
INSERT INTO uzivatel
	(user, email, osoba_id)
VALUE
	("piter", "piter@email.cz", 1),
	("karel", "karel@email.cz", 2),
	("sergey", "sergey@email.cz", 3)

-- DELETE FROM role_uzivatele;
INSERT INTO role_uzivatele
	(uzivatel_id, kod_role)
VALUES
	(1, "ADMIN"),
	(1, "VEDOUCI"),
	(2, "PREDAVAJICI")
	
-- DELETE FROM role_osoba;
INSERT INTO role_osoba
	(osoba_id, role_uzivatele_id)
VALUES
   (2, 3),
   (3, 3)
