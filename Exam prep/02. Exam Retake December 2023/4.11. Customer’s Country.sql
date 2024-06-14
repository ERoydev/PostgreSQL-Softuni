CREATE OR REPLACE PROCEDURE sp_customer_country_name(IN customer_full_name VARCHAR(50), OUT country_name VARCHAR(50)) 
AS
$$
	BEGIN
		SELECT
			co.name
		FROM
			customers AS ct
			JOIN countries AS co
			ON ct.country_id = co.id
		
		WHERE CONCAT(first_name, ' ', last_name) = customer_full_name
		INTO country_name;
	END
$$
LANGUAGE plpgsql;