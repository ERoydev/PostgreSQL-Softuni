SELECT
	COUNT(*) AS countries_without_mountains
FROM
	countries AS coun
	LEFT JOIN mountains_countries AS mc
	USING(country_code)

WHERE mountain_id IS NULL