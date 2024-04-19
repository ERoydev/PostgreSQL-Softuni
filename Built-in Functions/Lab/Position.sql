SELECT
	full_name,
	LEFT(full_name, POSITION(' ' IN full_name)) AS first_name,
	RIGHT(full_name, LENGTH(full_name) - POSITION(' ' IN full_name)) AS last_name,
FROM exercise