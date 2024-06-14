CREATE OR REPLACE FUNCTION fn_feedbacks_for_product(product_name VARCHAR(25))
RETURNS TABLE(
	customer_id INT,
	customer_name VARCHAR(75),
	feedback_description VARCHAR(255),
	feedback_rate NUMERIC(4, 2)
) AS
$$
	BEGIN
		RETURN QUERY (		
		SELECT
			f.customer_id,
			c.first_name AS customer_name,
			f.description AS feedback_description,
			f.rate AS feedback_rate
		FROM
			feedbacks AS f
			JOIN products AS p
			ON f.product_id = p.id
				JOIN customers AS c
				ON f.customer_id = c.id
		
		WHERE p.name = product_name
		ORDER BY f.customer_id ASC
		);
	END
$$
LANGUAGE plpgsql;