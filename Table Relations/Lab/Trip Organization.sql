SELECT
	c.id,
	v.vehicle_type,
	CONCAT(c.first_name, ' ', c.last_name)
FROM
	campers AS c
	JOIN
	vehicles AS v
		ON
	c.id = v.driver_id