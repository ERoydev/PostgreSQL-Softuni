DELETE FROM clients
WHERE id IN 
	(SELECT
		c.id
	FROM
		clients AS c
		LEFT JOIN courses AS cou
		ON cou.client_id = c.id
	
	WHERE cou.client_id IS NULL AND LENGTH(c.full_name) > 3
	)

-- OTHER WAY
DELETE FROM clients
WHERE 
	LENGTH(full_name) > 3
		AND
	id NOT IN (
		SELECT
			client_id
		FROM
			courses
	)