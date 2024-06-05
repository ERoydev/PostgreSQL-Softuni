CREATE OR REPLACE FUNCTION fn_full_name(first_name VARCHAR, last_name VARCHAR)
-- RETURNS tuk ima S, a dolo veche vrushta RETURN
RETURNS varchar AS
$$
	DECLARE
		full_name VARCHAR(30);

	BEGIN
		IF first_name is NULL and last_name is NULL THEN
			full_name := NULL;

		ELSIF first_name IS NULL THEN
			full_name := last_name;

		ELSIF last_name IS NULL THEN 
			full_name := first_name;

		ELSE 
			full_name := CONCAT(first_name, ' ', last_name);
		END IF;
		RETURN full_name;
	END
$$
LANGUAGE plpgsql;

SELECT * FROM fn_full_name('Emil', NULL)

