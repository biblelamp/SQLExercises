update ap_part p set last_change_id = (
	select MAX(GREATEST(i.create_change_id, i.delete_change_id)) from ap_item i where i.part_id=p.part_id
)

update ap_part p set last_change_id = null where p.part_id=1

select * from ap_item where part_id=17
select * from ap_part where access_point_id=7
select * from ap_access_point
select p.part_id,p.last_change_id from ap_part p where p.part_id=1
