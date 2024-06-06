SELECT
	fil.country_name,
	fil.peak_name,
	fil.mountain_range,
	ROW_NUMBER() OVER (PARTITION BY fil.country_name ORDER BY fil.peak_name) AS ranking
FROM
	(
	SELECT
		c.country_name,
		p.peak_name,
		m.mountain_range
	FROM 
		countries AS c
		LEFT JOIN mountains_countries AS mc
			USING(country_code)
		LEFT JOIN mountains AS m
			ON mc.mountain_id = m.id
		LEFT JOIN peaks AS p 
			ON p.mountain_id = m.id
		
	) AS fil;