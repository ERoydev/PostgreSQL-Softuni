SELECT
	department_id,
	MAX(salary) as max_salary
FROM
	employees
	
GROUP BY department_id
ORDER BY department_id