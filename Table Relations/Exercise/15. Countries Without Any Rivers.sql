SELECT
	COUNT(*) AS countries_without_rivers
FROM
	countries as c
	LEFT JOIN
		countries_rivers as r
	ON
		c.country_code = r.country_code

WHERE r.river_id IS NULL
