
-- THATS ONE WAY
CREATE OR REPLACE FUNCTION fn_get_department_id(IN department_name VARCHAR, OUT department_id_n INT)
AS
$$
	BEGIN
		SELECT department_id FROM departments WHERE department_name = name INTO department_id_n;
		
	END 
$$
LANGUAGE plpgsql;

SELECT * FROM fn_get_department_id('Sales')



-- THATS ANOTHER WAY OF SAME THING
CREATE OR REPLACE FUNCTION fn_get_department_id(department VARCHAR)
RETURNS INT AS
$$
	DECLARE
		department_id_number INT;
	BEGIN
		SELECT department_id FROM departments WHERE name = department INTO department_id_number;
		RETURN department_id_number;
	END
$$
LANGUAGE plpgsql;


SELECT * FROM fn_get_department_id('Marketing')


-- That's another way using placeholders
CREATE OR REPLACE FUNCTION fn_show_notice(msg VARCHAR(40), msg_2 VARCHAR(40))
RETURNS BOOL AS
$$
	BEGIN
		RAISE NOTICE 'The notice is %, %', msg, msg_2;
		RETURN TRUE;
	END
$$
LANGUAGE plpgsql;