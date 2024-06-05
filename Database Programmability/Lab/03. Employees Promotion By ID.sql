CREATE OR REPLACE PROCEDURE sp_increase_salary_by_id(id INT, OUT status VARCHAR(30))
AS
$$
	DECLARE
		employee_salary INT;
	BEGIN
		SELECT salary FROM employees WHERE employee_id = id INTO employee_salary;

		IF employee_salary IS NULL THEN
			status := 'This employee does not exists';
			RETURN;
		END IF;

		UPDATE employees SET salary = salary * 1.05 WHERE employee_id = id;
		employee_salary := employee_salary * 1.05;
		status := employee_salary::VARCHAR(40)
		COMMIT;
	END	
$$
LANGUAGE plpgsql;

CALL sp_increase_salary_by_id(17, NULL)
