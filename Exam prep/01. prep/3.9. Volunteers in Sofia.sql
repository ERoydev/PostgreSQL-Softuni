SELECT
	v.name,
	v.phone_number,
	SUBSTRING(TRIM(REPLACE(v.address, 'Sofia', '')), 3)
FROM
	volunteers AS v
	JOIN volunteers_departments AS vp
	ON v.department_id = vp.id

WHERE vp.department_name = 'Education program assistant' AND v.address LIKE '%Sofia%'
ORDER BY v.name ASC;