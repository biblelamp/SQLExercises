select MAX(u.change_id) from
	(select GREATEST(p.create_change_id, p.delete_change_id) as change_id 
	 from ap_part p where p.access_point_id = 134
	 union
	 select GREATEST(i.create_change_id, i.delete_change_id) as change_id
	 from ap_item i where i.part_id in
	 	(select p.part_id from ap_part p where p.access_point_id = 134)) u

select * from ap_part where access_point_id = 134