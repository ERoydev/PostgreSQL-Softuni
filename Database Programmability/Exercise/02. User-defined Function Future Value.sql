CREATE OR REPLACE FUNCTION fn_calculate_future_value(initial_sum DECIMAL(20, 8), yearly_interest_rate DECIMAL(10, 8), number_of_years INT)
RETURNS DECIMAL AS
$$
	DECLARE
		result DECIMAL(20, 8);
	BEGIN
		result := initial_sum;
		FOR I IN 1..number_of_years LOOP
			result := result + (result * yearly_interest_rate);
		END LOOP;
		RETURN TRUNC(result, 4);
	END
$$
LANGUAGE plpgsql;

SELECT * FROM fn_calculate_future_value(500, 0.25, 10)	

-- OTHER WAY
CREATE OR REPLACE FUNCTION fn_calculate_future_value(initial_sum DECIMAL(20, 8), yearly_interest_rate DECIMAL(10, 8), number_of_years INT)
RETURNS DECIMAL AS
$$
	BEGIN
		RETURN TRUNC(initial_sum * POWER(1 + yearly_interest_rate, number_of_years), 4);
	END
$$
LANGUAGE plpgsql;

SELECT * FROM fn_calculate_future_value(500, 0.25, 10)	