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



-- Výpis archivních souborů (fund) s počtem archivních pomůcek (finding aid) a počtem badatelských listů (research sheet)

SELECT f.fund_id, f.NAME, 
	(SELECT COUNT(fa.finding_aid_id) FROM finding_aid fa 
		WHERE fa.fund_id = f.fund_id) AS faCount,
	(SELECT COUNT(rs.research_sheet_id) FROM research_sheet rs
		JOIN accessible_fund af ON rs.research_sheet_id = af.research_sheet_id
		WHERE f.fund_id = af.fund_id) AS rsCount
FROM fund f

