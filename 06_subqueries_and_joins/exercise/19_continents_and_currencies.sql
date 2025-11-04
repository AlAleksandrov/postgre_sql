CREATE VIEW
	continent_currency_usage
AS
SELECT
	ra.continent_code,
	ra.currency_code,
	ra.currency_usage
FROM	
	(SELECT
		cu.continent_code,
		cu.currency_code,
		cu.currency_usage,
		DENSE_RANK() OVER(PARTITION BY cu.continent_code
			ORDER BY cu.currency_usage DESC
		) AS ranked_usage
	FROM
		(SELECT
			continent_code,
			currency_code,
			COUNT(currency_code) AS currency_usage
		FROM
			countries
		GROUP BY
			continent_code,
			currency_code
		HAVING
			COUNT(currency_code) > 1) AS cu) AS ra
WHERE
	ra.ranked_usage = 1
ORDER BY
	ra.currency_usage DESC
;