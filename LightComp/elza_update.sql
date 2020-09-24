select * from rul_item_spec where name = 'ET_MARRIAGE'
select * from rul_item_spec where name = 'NT_ACCEPTED'

select * from rul_item_type where name = 'NM_TYPE'

SELECT * FROM ap_item ai, rul_item_spec ris, rul_item_type rit
WHERE ai.item_spec_id = ris.item_spec_id
  AND ai.item_type_id = rit.item_type_id
  AND ris.name = 'ET_MARRIAGE' AND rit.name = 'NM_TYPE';

UPDATE ap_item ai
SET item_spec_id = (SELECT item_spec_id FROM rul_item_spec WHERE code = 'NT_ACCEPTED')
FROM rul_item_spec ris, rul_item_type rit
WHERE ai.item_spec_id = ris.item_spec_id
  AND ai.item_type_id = rit.item_type_id
  AND ris.code = 'NT_ACCEPTED'
  AND rit.code = 'NM_TYPE';
