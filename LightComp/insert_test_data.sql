-- insert test data

-- DELETE FROM archive;
INSERT INTO archive
	(code, name, local_name, archive_type, city, description, street, zipcode)
VALUES
	("100000030", "Archiv pro testování #1", "APT", "Archiv pro testování", "Praha 1", null, "Na Poříčí", "11000"),
	("100000031", "Archiv pro testování #2", "APT", "Archiv pro testování", "Praha 1", null, "Na Poříčí", "11000"),
	("100000032", "Archiv pro testování #3", "APT", "Archiv pro testování", "Praha 1", null, "Na Poříčí", "11000"),
	("100000033", "Archiv pro testování #4", "APT", "Archiv pro testování", "Praha 1", null, "Na Poříčí", "11000"),
	("100000034", "Archiv pro testování #5", "APT", "Archiv pro testování", "Praha 1", null, "Na Poříčí", "11000");


-- DELETE FROM fund;
INSERT INTO fund
	(code, name, archive_id, period_from, period_to, internal_code, status, accessibility, fund_size, conservation_status)
VALUES
   ("100000010_352", "Administrace celních důchodků Praha", 1, "1805-01-01", "1830-12-31", "ACD", "Archivní soubory v přímé péči instituce, uložené v instituci", "Přístupný", "4,25 bm zpracováno (z toho 4,25 bm inventarizováno), 2,25 bm nezpracováno", "úplný"),
	("100000030_121", "Fund pro testování #1", 1, "1920-01-01", "1935-12-31", "FPT", null, null, null, null),
	("100000030_122", "Fund pro testování #2", 1, "1920-01-01", "1935-12-31", "FPT", null, null, null, null),
	("100000030_123", "Fund pro testování #3", 2, "1920-01-01", "1935-12-31", "FPT", null, null, null, null),
	("100000030_124", "Fund pro testování #4", 2, "1920-01-01", "1935-12-31", "FPT", null, null, null, null),
	("100000030_125", "Fund pro testování #5", 2, "1920-01-01", "1935-12-31", "FPT", null, null, null, NULL),
   ("100000030_126", "Fund pro testování #6", 3, "1920-01-01", "1935-12-31", "FPT", null, null, null, null),
   ("100000030_127", "Fund pro testování #7", 3, "1920-01-01", "1935-12-31", "FPT", null, null, null, null),
   ("100000030_128", "Fund pro testování #8", 3, "1920-01-01", "1935-12-31", "FPT", null, null, null, NULL);

-- DELETE FROM fund_thema;
INSERT INTO fund_thema
	(fund_id, thematic_group_id)
VALUES
	(1, 43), (2, 43), (2, 44);

-- DELETE FROM finding_aid;
INSERT INTO finding_aid
	(fund_id, code, name)
VALUES
	(1, "apn1", "Archivní pomůcka #1"),
	(1, "apn2", "Archivní pomůcka #2"),
	(1, "apn3", "Archivní pomůcka #3"),
	(2, "apn4", "Archivní pomůcka #4"),
	(2, "apn5", "Archivní pomůcka #5"),
	(3, "apn6", "Archivní pomůcka #6"),
	(3, "apn7", "Archivní pomůcka #7"),
	(4, "apn8", "Archivní pomůcka #8");
	
-- DELETE FROM user;
INSERT INTO user
	(user, first_name, last_name, maid_name, birth_date, birth_place, address, delivery_address, citizenship, idcard_no, phone, email)
VALUES
	("user", null, "LastName", null, null, null, null, null, null, null, null, NULL);


-- DELETE FROM research_sheet;
INSERT INTO research_sheet
	(valid_to, archive_id, rstype, scope, legal_person, rsstate, approval_date, user_id)
VALUES
	(null, 1, "rstype", "výzkumu", null, "rsstate", null, 1),
	(null, 1, "rstype", "výzkumu", null, "rsstate", null, 1),
	(null, 2, "rstype", null, null, "rsstate", null, 1),
	(null, 2, "rstype", null, null, "rsstate", null, 1),
	(null, 2, "rstype", null, null, "rsstate", null, 1),
	(null, 3, "rstype", null, null, "rsstate", null, 1),
	(null, 3, "rstype", null, null, "rsstate", null, 1),
	(null, 3, "rstype", null, null, "rsstate", null, 1),
	(null, 3, "rstype", null, null, "rsstate", null, 1);

-- DELETE FROM accessible_fund;
INSERT INTO accessible_fund
	(research_sheet_id, fund_id)
VALUE
	(1, 1), (2, 4);