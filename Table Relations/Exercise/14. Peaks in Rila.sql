SELECT
	m.mountain_range,
	p.peak_name,
	p.elevation
FROM
	mountains as m
	JOIN
		peaks as p
	ON
		m.id = p.mountain_id

WHERE mountain_range = 'Rila'
ORDER BY p.elevation DESC;
