SELECT
	e.employee_id,
	CONCAT_WS(' ', e.first_name, e.last_name) as full_name,
	p.project_id,
	p.name AS project_name
FROM
	employees AS e
	JOIN employees_projects AS ep
		USING(employee_id)
	        JOIN projects as p
		        USING(project_id)

WHERE project_id = 1