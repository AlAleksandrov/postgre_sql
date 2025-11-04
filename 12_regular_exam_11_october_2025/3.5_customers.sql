SELECT
	id,
	last_name,
	loyalty_card
FROM
	customers
WHERE
	(last_name LIKE '%M%'
		OR
	last_name LIKE'%m%')
		AND
	loyalty_card = 'true'
ORDER BY
	last_name DESC
;