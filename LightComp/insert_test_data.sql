-- insert test data

-- DELETE FROM archive;
INSERT INTO archive
	(code, name, local_name, archive_type, city, description, street, zipcode)
VALUES
	("100000030", "Archiv pro testování", "APT", "Archiv pro testování", "Praha 1", null, "Na Poříčí", "11000"),
	("100000031", "Archiv pro testování", "APT", "Archiv pro testování", "Praha 1", null, "Na Poříčí", "11000"),
	("100000032", "Archiv pro testování", "APT", "Archiv pro testování", "Praha 1", null, "Na Poříčí", "11000"),
	("100000033", "Archiv pro testování", "APT", "Archiv pro testování", "Praha 1", null, "Na Poříčí", "11000"),
	("100000034", "Archiv pro testování", "APT", "Archiv pro testování", "Praha 1", null, "Na Poříčí", "11000");


-- DELETE FROM fund;
INSERT INTO fund
	(code, name, archive_id, period_from, period_to, internal_code, status, accessibility, fund_size, conservation_status)
VALUES
   ("100000010_352", "Administrace celních důchodků Praha", 1, "1805-01-01", "1830-12-31", "ACD", "Archivní soubory v přímé péči instituce, uložené v instituci", "Přístupný", "4,25 bm zpracováno (z toho 4,25 bm inventarizováno), 2,25 bm nezpracováno", "úplný"),
	("100000030_121", "Fund pro testování", 1, "1920-01-01", "1935-12-31", "FPT", null, null, null, null),
	("100000030_122", "Fund pro testování", 1, "1920-01-01", "1935-12-31", "FPT", null, null, null, null),
	("100000030_123", "Fund pro testování", 1, "1920-01-01", "1935-12-31", "FPT", null, null, null, null),
	("100000030_124", "Fund pro testování", 1, "1920-01-01", "1935-12-31", "FPT", null, null, null, null),
	("100000030_125", "Fund pro testování", 1, "1920-01-01", "1935-12-31", "FPT", null, null, null, NULL),
   ("100000030_126", "Fund pro testování", 1, "1920-01-01", "1935-12-31", "FPT", null, null, null, null),
   ("100000030_126", "Fund pro testování", 1, "1920-01-01", "1935-12-31", "FPT", null, null, null, null),
   ("100000030_126", "Fund pro testování", 1, "1920-01-01", "1935-12-31", "FPT", null, null, null, NULL);
   
-- DELETE FROM fund_thema;
INSERT INTO fund_thema
	(fund_id, thematic_group_id)
VALUES (1, 43);

-- DELETE FROM finding_aid;
INSERT INTO finding_aid
	(fund_id, name)
VALUES
	(1, "Archivní pomůcka #1"),
	(1, "Archivní pomůcka #2"),
	(1, "Archivní pomůcka #3"),
	(1, "Archivní pomůcka #4"),
	(1, "Archivní pomůcka #5"),
	(1, "Archivní pomůcka #6"),
	(1, "Archivní pomůcka #7"),
	(1, "Archivní pomůcka #8");
	
-- DELETE FROM user;
INSERT INTO user
	(user, first_name, last_name, middle_name, birth_date, birth_place, address, delivery_address, citizenship, idcard_no, phone, email)
VALUES
	("user", null, "LastName", null, null, null, null, null, null, null, null, NULL);


-- DELETE FROM research_sheet;
INSERT INTO research_sheet
	(valid_to, archive_id, rstype, scope, legal_person, rsstate, approval_date, user_id)
VALUES
	(null, 1, "rstype", null, null, "rsstate", null, 1),
	(null, 1, "rstype", null, null, "rsstate", null, 1),
	(null, 1, "rstype", null, null, "rsstate", null, 1),
	(null, 1, "rstype", null, null, "rsstate", null, 1),
	(null, 1, "rstype", null, null, "rsstate", null, 1),
	(null, 1, "rstype", null, null, "rsstate", null, 1),
	(null, 1, "rstype", null, null, "rsstate", null, 1),
	(null, 1, "rstype", null, null, "rsstate", null, 1);
