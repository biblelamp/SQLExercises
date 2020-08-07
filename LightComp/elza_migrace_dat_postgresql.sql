UPDATE ap_access_point SET uuid = ?
FROM par_institution
WHERE par_institution.access_point_id = ap_access_point.access_point_id
AND par_institution.internal_code = ?
