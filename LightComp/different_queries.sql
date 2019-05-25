-- Počet archivních souborů (= fund)

SELECT COUNT(*) FROM fund;

-- Archivní soubory bez tématické skupiny (= fund)

SELECT * FROM fund f
	LEFT JOIN fund_thema ft ON f.fund_id = ft.fund_id
WHERE ft.thematic_group_id is NULL

-- Archivy s uvedením počtu archivních pomůcek

SELECT a.archive_id, a.code, a.name, COUNT(a.archive_id) FROM archive a
	JOIN fund f ON a.archive_id = f.archive_id
   JOIN finding_aid fa ON f.fund_id = fa.fund_id
GROUP BY a.archive_id, a.code, a.name

-- Archivní soubory (= fund) s nejvíce badatelskými listy

SELECT f.fund_id, f.code, f.name, COUNT(f.fund_id) FROM fund f
	JOIN research_sheet rs ON f.archive_id = rs.archive_id
GROUP BY f.fund_id, f.code, f.name
ORDER BY 4 DESC

-- Fondy s právě jedním tématem

SELECT * FROM fund f
	JOIN fund_thema ft ON f.fund_id = ft.fund_id
GROUP BY f.fund_id
HAVING COUNT(f.fund_id) = 1

-- Výpis badatelských listů, které mají vazbu na fond, který není spravován archivem pro něž je badatelský list vydán

SELECT * FROM research_sheet rs
	JOIN accessible_fund af ON rs.research_sheet_id = af.research_sheet_id
	JOIN fund f ON af.fund_id = f.fund_id
WHERE rs.archive_id <> f.archive_id

-- U archivních souborů/fondů z archivu XY přidat tématickou skupiny Z pokud fond má tématickou skupinu V

SET @XY = 1;
SET @Z = "010000";
SET @V = "030100";

-- Ktere zaznamy?
-- hledame fund_id
-- where archive_id = 'Y' tg.code='V'

INSERT INTO fund_thema(fund_id, thematic_group_id)

SELECT f.fund_id, t.thematic_group_id
FROM fund f
	JOIN fund_thema ft ON ft.fund_id = f.fund_id
	JOIN thematic_group tg ON ft.thematic_group_id = tg.thematic_group_id
	JOIN (SELECT tg.thematic_group_id FROM thematic_group tg WHERE tg.CODE = @Z) t
WHERE f.archive_id = @XY AND tg.CODE = @V

-- méně optimální možnost

SELECT f.fund_id, (SELECT tg.thematic_group_id FROM thematic_group tg WHERE tg.CODE = @Z)
FROM fund f
	JOIN fund_thema ft ON ft.fund_id = f.fund_id
	JOIN thematic_group tg ON ft.thematic_group_id = tg.thematic_group_id
WHERE f.archive_id = @XY AND tg.code = @V

-- Výpis archivních souborů (fund) s počtem archivních pomůcek (finding aid) a počtem badatelských listů (research sheet)

SELECT f.fund_id, f.name, t1.count, t2.count FROM fund f
	LEFT JOIN (
		SELECT fa.fund_id, COUNT(fa.finding_aid_id) AS count
		FROM finding_aid fa
		GROUP BY fa.fund_id) t1
	ON f.fund_id = t1.fund_id
	LEFT JOIN (
		SELECT af.fund_id, COUNT(af.accessible_fund_id) AS count
		FROM accessible_fund af
		GROUP BY af.fund_id) t2
	ON f.fund_id = t2.fund_id

-- SELECT fa.fund_id, COUNT(fa.finding_aid_id) FROM finding_aid fa
-- GROUP BY fa.fund_id

-- SELECT f.fund_id AS id, COUNT(fa.fund_id) as count FROM fund f
-- 	LEFT JOIN finding_aid fa ON f.fund_id = fa.fund_id
-- GROUP BY f.fund_id, f.NAME
