SELECT
	p.name AS product_name,
	TRUNC(AVG(price), 2) AS average_price,
	COUNT(f.id) AS total_feedbacks
FROM
	products AS p
	JOIN feedbacks AS f
	ON p.id = f.product_id
	
WHERE price > 15 
GROUP BY p.id 
HAVING COUNT(f.id) > 1
ORDER BY total_feedbacks ASC, average_price DESC