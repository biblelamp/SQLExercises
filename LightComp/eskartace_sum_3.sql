-- from Informacni Balicek

SELECT
   SUM(IF(stav = 'ZALOZEN', 1, 0)) created,
   SUM(IF(stav = 'NAHRAN', 1, 0)) valid,
   SUM(IF(stav = 'CHYBA_VALIDACE', 1, 0)) invalid
FROM informacni_balicekuroven_popisu
WHERE rizeni_id = 4;