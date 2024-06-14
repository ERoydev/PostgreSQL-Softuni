DELETE FROM distributors
WHERE id IN (
	SELECT
	id
FROM
	distributors
WHERE name ILIKE 'L%'
)