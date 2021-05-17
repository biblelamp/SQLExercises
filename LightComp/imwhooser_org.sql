select count(*) from imw_entity where reload is true

select * from imw_org_jednotka where entity_id = 324510

select * from imw_org_jednotka o
  join imw_entity e on e.entity_id = o.entity_id
  where e.reload is true