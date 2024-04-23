CREATE OR REPLACE VIEW 
	view_continents_countries_currencies_details AS
SELECT
	CONCAT(con.continent_name,': ', con.continent_code) AS "Continent Details",
	CONCAT_WS(' - ',coun.country_name, coun.capital, coun.area_in_sq_km, 'km2') AS "Country Information",
	CONCAT(curr.description, ' (',curr.currency_code,')') AS "Currencies"
FROM 
	continents AS con,
	countries AS coun,
	currencies AS curr
WHERE 
	con.continent_code = coun.continent_code
		AND
	coun.currency_code = curr.currency_code
ORDER BY 
	"Country Information" ASC,
	"Currencies" ASC;
	
SELECT * FROM view_continents_countries_currencies_details;