-- Počet archivních souborů

SELECT COUNT(*) FROM archive;

-- Archivní soubory bez tématické skupiny

SELECT * FROM archive a
	JOIN fund f ON a.archive_id = f.archive_id
	LEFT JOIN fund_thema ft ON f.fund_id = ft.fund_id
WHERE ft.thematic_group_id is NULL
GROUP BY a.CODE

-- Archivy s uvedením počtu archivních pomůcek

SELECT a.archive_id, a.code, a.name, COUNT(a.archive_id) FROM archive a
	JOIN fund f ON a.archive_id = f.archive_id
   JOIN finding_aid fa ON f.fund_id = fa.fund_id
GROUP BY a.archive_id

-- Archivní soubory s nejvíce badatelskými listy

SELECT a.archive_id, a.code, a.name, COUNT(a.archive_id) FROM archive a
	JOIN research_sheet rs ON a.archive_id = rs.archive_id
GROUP BY a.archive_id
ORDER BY 4 DESC

-- Fondy s právě jedním tématem


