select s.item_spec_id, s.code, s.name, sz.item_spec_id, sz.code, sz.name, sl.item_spec_id, sl.code, sl.name from rul_item_spec s
left join rul_item_spec sz on sz.name=s.name and sz.code like 'ZP2015_LANGUAGE%'
left join rul_item_spec sl on sl.name=s.name and sl.code like 'LNG_%'
where (s.code like 'ZP2015_LANGUAGE_%' or s.code like 'LNG_%')
   and (sz.code is null or sl.code is null)
order by s.code

select s.item_spec_id, s.code, s.name, sz.item_spec_id, sz.code, sz.name from rul_item_spec s
left join rul_item_spec sz on lower(s.name)=lower(sz.name)
where s.code like 'ZP2015_LANGUAGE_%' and sz.code like 'LNG_%'
order by s.item_spec_id

-- oprava názvů jazyků pro speciální případy
UPDATE rul_item_spec SET name='blíže neurčený eskymácko-aleutský jazyk' WHERE code='ZP2015_LANGUAGE_154';
UPDATE rul_item_spec SET name='blíže neurčený izolovaný jazyk' WHERE code='ZP2015_LANGUAGE_157';

-- je nutné vytvořit migrační tabulku jazyků s mapováním
CREATE TABLE mig_lng_table (src_spec_id INTEGER NOT NULL PRIMARY KEY, trg_spec_id INTEGER);
INSERT INTO mig_lng_table
	SELECT s.item_spec_id, sz.item_spec_id FROM rul_item_spec s
	LEFT JOIN rul_item_spec sz ON lower(s.name)=lower(sz.name)
	WHERE s.code LIKE 'ZP2015_LANGUAGE_%' AND sz.code like 'LNG_%'
	ORDER BY s.item_spec_id;

-- v tabulce rul_item_type je nutné změnit package_id z zp2015 na cz_base?
UPDATE rul_item_type SET package_id = (SELECT package_id FROM rul_package WHERE code = 'CZ_BASE')
    WHERE code = 'ZP2015_LANGUAGE';

-- v tabulce rul_item_type_spec_assign je nutné změnit přiřazení specifikací na nové dle migrační tabulky
--BEGIN TRANSACTION;
UPDATE rul_item_type_spec_assign rul SET item_spec_id = mig.trg_spec_id
    FROM mig_lng_table mig
    WHERE mig.src_spec_id=rul.item_spec_id;
--ROLLBACK;

-- v tabulce arr_item je nutné změnit hodnoty ve sloupci item_spec_id dle migrační tabulky
--BEGIN TRANSACTION;
UPDATE arr_item i SET item_spec_id = mig.trg_spec_id
    FROM mig_lng_table mig
    WHERE mig.src_spec_id=i.item_spec_id;
--ROLLBACK;

-- delete old records
SELECT * FROM rul_item_spec WHERE item_spec_id IN (SELECT src_spec_id FROM mig_lng_table);
