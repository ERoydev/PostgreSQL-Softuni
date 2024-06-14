SELECT
	d.name AS distributor_name,
	i.name AS ingredient_name,
	p.name AS product_name,
	AVG(rate)
FROM
	distributors AS d
	JOIN ingredients AS i
	ON d.id = i.distributor_id
		JOIN products_ingredients AS pi
		ON pi.ingredient_id = i.id
			JOIN products AS p
			ON p.id = pi.product_id
				JOIN feedbacks AS f
				ON p.id = f.product_id

GROUP BY d.name, i.name, p.name
HAVING AVG(rate) >= 5 AND AVG(rate) <= 8
ORDER BY distributor_name ASC, ingredient_name ASC, product_name ASC