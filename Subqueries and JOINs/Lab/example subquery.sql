SELECT
	SUM(average_salary)
FROM (
	SELECT AVG(salary) AS average_salary
	FROM employees
	GROUP BY job_title
) AS a