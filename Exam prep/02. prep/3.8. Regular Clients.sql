SELECT
	c.full_name,
	COUNT(co.id) AS count_of_cars,
	SUM(co.bill) AS total_sum
FROM
	clients AS c
	JOIN courses as co
	ON c.id = co.client_id

WHERE SUBSTRING(c.full_name, 2, 1) = 'a'
GROUP BY c.full_name
HAVING COUNT(co.id) > 1
ORDER BY c.full_name
