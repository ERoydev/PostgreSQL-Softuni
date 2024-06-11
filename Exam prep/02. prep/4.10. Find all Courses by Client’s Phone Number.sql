CREATE OR REPLACE FUNCTION fn_courses_by_client(phone_num VARCHAR(20))
RETURNS INT AS
$$
	DECLARE
		number_courses INT;
	BEGIN
		SELECT
			COUNT(*)
		FROM
			courses AS co
			JOIN clients AS cl
			ON co.client_id = cl.id
		
		WHERE phone_number = phone_num INTO number_courses;
		RETURN number_courses;
	END
$$
LANGUAGE plpgsql;
