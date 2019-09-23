-- insert test data

-- DELETE FROM archive;
INSERT INTO archive
	(code, name, local_name, archive_type, city, description, street, zipcode)
VALUES
	("100000030", "Archiv ministerstva vnitra", "APT", "Archiv pro testování", "Praha 1", null, null, "11000"),
	("100000031", "Archiv pro testování #2", "APT", "Archiv pro testování", "Praha 1", null, null, "11000"),
	("100000032", "Archiv pro testování #3", "APT", "Archiv pro testování", "Praha 1", null, null, "11000"),
	("100000033", "Archiv pro testování #4", "APT", "Archiv pro testování", "Praha 1", null, null, "11000"),
	("100000034", "Archiv pro testování #5", "APT", "Archiv pro testování", "Praha 1", null, null, "11000");


-- DELETE FROM fund;
INSERT INTO fund
	(code, name, archive_id, period_from, period_to, internal_code, status, accessibility, fund_size, conservation_status)
VALUES
   -- ("100000010_352", "Administrace celních důchodků Praha", 1, "1805-01-01", "1830-12-31", "ACD", "Archivní soubory v přímé péči instituce, uložené v instituci", "Přístupný", "4,25 bm zpracováno (z toho 4,25 bm inventarizováno), 2,25 bm nezpracováno", "úplný"),
	("100000030_121", "Ministr vnitra Josef Kalamár", 1, "1920-01-01", "1935-12-31", "FPT", null, null, null, null),
	("100000030_122", "Fund pro testování #2", 1, "1920-01-01", "1935-12-31", "FPT", null, null, null, null),
	("100000030_123", "Fund pro testování #3", 2, "1920-01-01", "1935-12-31", "FPT", null, null, null, null),
	("100000030_124", "Fund pro testování #4", 2, "1920-01-01", "1935-12-31", "FPT", null, null, null, null),
	("100000030_125", "Fund pro testování #5", 2, "1920-01-01", "1935-12-31", "FPT", null, null, null, NULL),
   ("100000030_126", "Fund pro testování #6", 3, "1920-01-01", "1935-12-31", "FPT", null, null, null, null),
   ("100000030_127", "Fund pro testování #7", 3, "1920-01-01", "1935-12-31", "FPT", null, null, null, null),
   ("100000030_128", "Fund pro testování #8", 3, "1920-01-01", "1935-12-31", "FPT", null, null, null, null);

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
	("sergey", null, "Sergey", null, "1965-12-29", null, null, null, null, null, null, null);


-- DELETE FROM research_sheet;
INSERT INTO research_sheet
	(valid_to, archive_id, rstype, scope, legal_person, rsstate, approval_date, user_id)
VALUES
   (null, null, "PRIVATE", null, null, "VALID", null, 1),
	("2019-10-03", 1, "PRIVATE", null, null, "VALID", null, 1),
	("2019-10-03", 2, "PRIVATE", null, null, "NEW", null, 1);

-- DELETE FROM accessible_fund;
INSERT INTO accessible_fund
	(research_sheet_id, fund_id)
VALUE
	(1, 1), (2, 4);

-- DELETE FROM `order`;
INSERT INTO `order`
	(order_type, status, originator, fund_id, research_sheet_id, path, created, to_delete)
VALUE
   ("AIP", "PROCESSED", null, null, 1, null, CURRENT_DATE, null),
	("METADATA", "NEW", "Ministerstvo vnitra", 1, 1, "path", CURRENT_DATE, false);

-- DELETE FROM query;
INSERT INTO `query`
	(order_id, created, state, type)
VALUE
	(1, "2019-07-10", "RUNNING", "QUERY");

-- DELETE FROM downloadable_file;
INSERT INTO downloadable_file
	(order_id, mimetype, created, filename, size, description)
VALUES
	(1, "text/plain", CURRENT_DATE, "filename.txt", 1024, "file");

-- DELETE FROM information_package;
INSERT INTO information_package
	(information_package_id, order_id, uuid, path, size)
VALUES
	(1, 1, "1234567890abcdef", "path/to", 1024);

-- DELETE FROM level_view
INSERT INTO level_view
	(order_id, information_package_id, depth, leaf, hidden, description, position, type)
VALUE
	(1, null, 1, 1, 0, "description", 1, "type"),
	(1, 1, 1, 1, 0, "description", 1, "type");

-- DELETE FROM level
INSERT INTO `level`
	(level_id, order_id, level_view_id, information_package_id, description, position, depth, leaf)
VALUE
	(1, 1, 1, 1, "description", 1, 1, 1);

-- DELETE FROM dao;
INSERT INTO dao
	(dao_id, information_package_id, level_id, level_view_id, filename, mimetype, size, position)
VALUES
	(1, 1, 1, 1, "filename.txt", "plain/text", 1024, 1);

-- DELETE FROM `event`
INSERT INTO `event`
	(queue_name, category_name, state, inserted, order_id)
VALUES
	("delete", "1", "PRIPRAVENA", CURRENT_DATE, 1);
