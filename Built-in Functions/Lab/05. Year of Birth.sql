SELECT
	first_name,
	last_name,
	SUBSTRING(born::VARCHAR(50), 1, 4)
FROM authors

------------------------------------------

SELECT
	first_name,
	last_name,
	EXTRACT('year' FROM born) AS year
FROM authors