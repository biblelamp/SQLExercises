SELECT ap.access_point_id, ap.uuid FROM ap_state s 
  JOIN ap_access_point ap ON s.access_point_id = ap.access_point_id
  WHERE s.create_change_id > 3 OR s.delete_change_id > 3
UNION
SELECT ap.access_point_id, ap.uuid FROM ap_part p 
  JOIN ap_access_point ap ON p.access_point_id = ap.access_point_id
  WHERE p.create_change_id > 3 OR p.delete_change_id > 3
UNION
SELECT ap.access_point_id, ap.uuid FROM ap_item i
  JOIN ap_part p ON i.part_id = p.part_id
  JOIN ap_access_point ap ON p.access_point_id = ap.access_point_id
  WHERE i.create_change_id > 3 OR i.delete_change_id > 3
UNION
SELECT ap.access_point_id, ap.uuid FROM ap_binding_state b 
  JOIN ap_access_point ap ON b.access_point_id = ap.access_point_id
  WHERE b.create_change_id > 3 OR b.delete_change_id > 3
