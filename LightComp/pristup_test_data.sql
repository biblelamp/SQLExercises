-- DELETE FROM dotaz;
INSERT INTO dotaz
	(stav, format_odpovedi, uzivatel_id, cas_prijeti, XML, archivar_id, role)
VALUES
	("ANONYMIZACE", "METADATA", "sergey", CURRENT_TIMESTAMP, "xml", "archivar1", "UZIVATEL")

-- DELETE FROM udalost;
INSERT INTO udalost
	(dotaz_id, nazev_fronty, nazev_tridy, operace, stav, vlozeno)
VALUES
	(1, "cro", "mail", "MAIL_CEKAJICI_ANONYMIZACE", "PRIPRAVENA", CURRENT_TIMESTAMP)