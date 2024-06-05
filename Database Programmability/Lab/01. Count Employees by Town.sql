CREATE OR REPLACE FUNCTION fn_count_employees_by_town(town_name VARCHAR(20))
RETURNS INT AS
$$
	DECLARE
		town_count INT;
	BEGIN
		SELECT 
			COUNT(e.employee_id)
		FROM 
			towns AS t
		JOIN addresses AS a
			USING(town_id)
				JOIN employees AS e
					USING(address_id)
		
		WHERE t.name = town_name
		INTO town_count;	

		RETURN town_count;
	END
$$
LANGUAGE plpgsql;

SELECT * FROM fn_count_employees_by_town('Varna') AS count

