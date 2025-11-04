CREATE VIEW
	view_continents_countries_currencies_details
AS
SELECT
	CONCAT(con.continent_name, ': ', con.continent_code) AS continent_details,
	CONCAT(coun.country_name, ' - ', coun.capital, ' - ', coun.area_in_sq_km, ' - km2') AS country_information,
	CONCAT(curr.description, ' ', '(', curr.currency_code, ')') AS currencies
FROM
	continents AS con
JOIN
	countries AS coun
ON
	con.continent_code = coun.continent_code
JOIN
	currencies AS curr
ON
	coun.currency_code = curr.currency_code
ORDER BY country_information ASC, currencies ASC
;