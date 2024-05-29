SELECT
	t.town_id,
	t.name,
	a.address_text
FROM
	addresses AS a
	JOIN
		towns AS t 
	ON
		a.town_id = t.town_id

WHERE t.name IN ('San Francisco', 'Carnation', 'Sofia')
ORDER BY t.town_id, a.address_text