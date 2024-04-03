SELECT
	id,
	CONCAT(first_name, ' ', last_name) AS "full_name",
	job_title
FROM employees
ORDER BY first_name ASC
LIMIT 50;


-- 
SELECT
	e.id,
	CONCAT(e.first_name, ' ', e.last_name) AS "full_name",
	e.job_title
FROM employees AS e
ORDER BY first_name ASC
LIMIT 50;