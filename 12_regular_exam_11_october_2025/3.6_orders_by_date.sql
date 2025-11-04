SELECT
	id,
	TO_CHAR(created_at , 'DD-MM-YYYY') AS created_at,
	customer_id
FROM
	orders
WHERE
	created_at > '2025-01-01'
		AND
	customer_id between 15 AND 30
ORDER BY
	TO_CHAR(created_at , 'DD-MM-YYYY'),
	customer_id DESC,
	id
LIMIT 5
;