-- Meta data for my database

SELECT
	tablename,
	indexname,
	indexdef
FROM pg_indexes

WHERE schemaname = 'public'
ORDER BY 
	tablename ASC,
	indexname ASC;