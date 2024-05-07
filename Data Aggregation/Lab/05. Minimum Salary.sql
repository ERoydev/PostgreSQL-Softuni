SELECT
	department_id,
	MIN(salary) as min_salary
FROM
	employees
	
GROUP BY department_id
ORDER BY department_id