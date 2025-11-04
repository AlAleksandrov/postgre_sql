SELECT
	i.name,
	CONCAT(UPPER(b.name), '/', LOWER(c.name)) AS promotion,
	CONCAT('On sale: ', i.description),
	i.quantity
FROM
	items AS i
JOIN
	brands AS b
ON
	i.brand_id = b.id
JOIN
	classifications AS c
ON
	i.classification_id = c.id
LEFT JOIN
	orders_items AS oi
ON
	i.id = oi.item_id
WHERE
	oi.item_id IS NULL
ORDER BY
	i.quantity DESC,
	i.name
;