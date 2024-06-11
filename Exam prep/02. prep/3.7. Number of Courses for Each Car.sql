SELECT
	c.id AS car_id,
	c.make,
	c.mileage,
	COUNT(cou.car_id) AS count_of_courses,
	ROUND(AVG(cou.bill), 2) AS average_bill
FROM
	cars AS c
	LEFT JOIN courses AS cou
	ON c.id = cou.car_id

-- ZABELEJI grupiram samo po ID i kogato gi smachkvam to si e edin zapis i ne stava error che ne grupiram i drugite
GROUP BY c.id
HAVING COUNT(cou.car_id) <> 2
ORDER BY count_of_courses DESC, c.id