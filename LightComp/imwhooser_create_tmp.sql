-- create table
CREATE TABLE tmp(id_osoba NUMERIC,
  ent_uuid UUID NOT NULL,
  PRIMARY KEY (id_osoba));

-- fill table data from file
COPY tmp(ent_uuid, id_osoba)
FROM '/tmp/clo_binding.csv'
DELIMITER ','
CSV HEADER;

select p.id_osoba,t.ent_uuid as new_uuid,e.ent_uuid  from imc_person p
join imw_entity e using(entity_id)
join tmp t using(id_osoba);

-- change uuid from file by id_osoba
update imw_entity ent
set ent_uuid = d.new_uuid
from (select p.id_osoba,t.ent_uuid as new_uuid,e.ent_uuid from imc_person p
	join imw_entity e using(entity_id)
	join tmp t using(id_osoba) 
) d
where ent.ent_uuid = d.ent_uuid;

select * from imc_person where id_osoba = 3200
select * from imw_rev where entity_id = 2563

update imw_rev set delete_date = now() where rev_id = 36830;

select * from elza_queue;
insert into elza_queue (entity_id) values (3200);
insert into elza_queue (entity_id) select entity_id from imw_entity;
select count(*) from elza_queue;
delete from elza_queue;

select count(*) from imw_entity;
