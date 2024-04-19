UPDATE books
SET
	title = REPLACE(title, 'The', '***')
WHERE SUBSTRING(title, 1, 3) = 'The'
RETURNING title