SELECT
	mc.country_code,
	COUNT(mountain_range) AS mountain_range_count
FROM
	mountains AS m
JOIN 
	mountains_countries AS mc
		ON 
	m.id = mc.mountain_id

WHERE mc.country_code IN ('BG', 'US', 'RU')
GROUP BY mc.country_code
ORDER BY mountain_range_count DESC