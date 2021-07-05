select * from ap_cached_access_point where access_point_id not in

delete from ap_cached_access_point where access_point_id not in
  (select p.access_point_id from ap_access_point p
    join ap_state s on s.access_point_id = p.access_point_id
  where s.delete_change_id is null)

delete from db_databasechangelog where id = '20210419133000'