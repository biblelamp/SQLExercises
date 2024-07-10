select * from rul_item_spec where code = 'ZP2015_ENTITY_ROLE_1';
select * from arr_item where item_spec_id =
	(select item_spec_id from rul_item_spec where code = 'ZP2015_ENTITY_ROLE_1');
select * from arr_node_conformity_missing where item_spec_id =
	(select item_spec_id from rul_item_spec where code = 'ZP2015_ENTITY_ROLE_1');


update arr_item set item_spec_id = 
	(select item_spec_id from rul_item_spec where code = 'ZP2015_ENTITY_ROLE_11')
	where item_spec_id = (select item_spec_id from rul_item_spec where code = 'ZP2015_ENTITY_ROLE_1');
update arr_node_conformity_missing set item_spec_id = 
	(select item_spec_id from rul_item_spec where code = 'ZP2015_ENTITY_ROLE_11')
	where item_spec_id = (select item_spec_id from rul_item_spec where code = 'ZP2015_ENTITY_ROLE_1');

select * from rul_item_type_spec_assign
select * from rul_item_aptype

DELETE from rul_item_spec WHERE code IN (
    'ZP2015_ENTITY_ROLE_1', 'ZP2015_ENTITY_ROLE_4', 'ZP2015_ENTITY_ROLE_13', 'ZP2015_ENTITY_ROLE_14',
	'ZP2015_ENTITY_ROLE_35', 'ZP2015_ENTITY_ROLE_51', 'ZP2015_ENTITY_ROLE_54', 'ZP2015_ENTITY_ROLE_55',
	'ZP2015_ENTITY_ROLE_59');

DELETE FROM arr_cached_node WHERE node_id IN (
    SELECT node_id FROM arr_desc_item di
    JOIN arr_item i ON i.item_id = di.item_id
    JOIN rul_item_spec sp ON sp.item_spec_id = i.item_spec_id
    WHERE sp.code IN ('ZP2015_ENTITY_ROLE_1'));