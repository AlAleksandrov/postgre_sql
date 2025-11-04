SELECT
	i.name AS item_name,
	ROUND(AVG(r.rating), 2) AS average_rating,
	COUNT(r.created_at) AS total_reviews,
	b.name AS brand_name,
	c.name AS classification_name
FROM
	items AS i
JOIN
	reviews AS r
ON
	r.item_id = i.id
JOIN
	brands AS b
ON
	i.brand_id = b.id
JOIN
	classifications AS c
ON
	i.classification_id = c.id

GROUP BY
	i.name,
	b.name,
	c.name
HAVING
	COUNT(r.created_at) >= 3
ORDER BY
	average_rating DESC,
	i.name
LIMIT 3
;