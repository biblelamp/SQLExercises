select * from ap_access_point where access_point_id in (183,184,185,203);
select * from ap_state where access_point_id in (183,184,185,203);

delete from db_databasechangelog where id='20220829133000';

select * from ap_cached_access_point where access_point_id = 184
delete from ap_cached_access_point where access_point_id = 184