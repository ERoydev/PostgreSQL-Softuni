UPDATE coaches
SET salary = salary * coach_level
WHERE id IN (
	SELECT
		id
	FROM
		coaches AS c
		JOIN players_coaches AS pc
		ON c.id = pc.coach_id
		
	WHERE first_name ILIKE 'C%' 
	GROUP BY id
	
);
