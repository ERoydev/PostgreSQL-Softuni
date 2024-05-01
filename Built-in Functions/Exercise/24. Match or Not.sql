SELECT
	companion_full_name,
	email
FROM users
WHERE
	LOWER(companion_full_name) LIKE '%and%'
		AND
	LOWER(email) NOT LIKE '%@gmail'
	

SELECT
	companion_full_name,
	email
FROM users
WHERE
	companion_full_name ILIKE '%aNd%'
		AND
	email NOT ILIKE '%@gmail'
	