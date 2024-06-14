SELECT
	name,
	recipe,
	price
FROM
	products

WHERE price >= 10 AND price <= 20
ORDER BY price DESC