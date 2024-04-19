SELECT
	REPLACE(title, 'The', '***') AS title
FROM 
    books
WHERE 
    SUBSTRING(title, 1, 3) = 'The'

-- -------------------------------------------

SELECT
	REPLACE(title, 'The', '***') AS title
FROM 
	books
WHERE 
	LEFT(title, 3) = 'The'
