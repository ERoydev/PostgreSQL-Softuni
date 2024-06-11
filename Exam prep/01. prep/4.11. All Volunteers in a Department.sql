CREATE OR REPLACE FUNCTION fn_get_volunteers_count_from_department(searched_volunteers_department VARCHAR(30))
RETURNS INT AS
$$
	DECLARE
		volunteer_count INT;
	BEGIN
		SELECT 
			COUNT(*)
		FROM
			volunteers AS v
			JOIN volunteers_departments AS vd
			ON v.department_id = vd.id
		
		WHERE department_name = searched_volunteers_department INTO volunteer_count


		RETURN volunteer_count;
	END
$$
LANGUAGE plpgsql;
