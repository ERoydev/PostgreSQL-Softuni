SELECT
	CONCAT(
		elevation,
		CONCAT(' ', REPEAT('-', 3), REPEAT('>', 2), ' '),
		peak_name
	) AS "Elevation -->> Peak Name"
FROM 
	peaks
WHERE 
	elevation >= 4884