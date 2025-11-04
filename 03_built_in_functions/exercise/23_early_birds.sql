SELECT
	user_id,
	AGE(b.starts_at, b.booked_at) AS "Early Birds"
FROM
	bookings AS b
WHERE
	b.starts_at - b.booked_at >= '10 months'
;