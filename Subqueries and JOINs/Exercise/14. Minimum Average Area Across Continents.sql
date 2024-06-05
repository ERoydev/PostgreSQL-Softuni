
SELECT
	MIN(average_area)
FROM
(
SELECT
	continent_code,
	AVG(area_in_sq_km) AS average_area
FROM
	countries

GROUP BY continent_code
	
) AS average_information;
 