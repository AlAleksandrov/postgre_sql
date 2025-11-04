SELECT
	add.name AS address,
	CASE 
		WHEN EXTRACT(HOUR FROM cou.start) BETWEEN 6 AND 20 THEN 'Day'
		ELSE 'Night'
	END AS day_time,
	cou.bill,
	cli.full_name,
	car.make,
	car.model,
	cat.name AS category_name
FROM
	courses AS cou
JOIN
	cars AS car
ON
	cou.car_id = car.id
JOIN
	categories AS cat
ON
	cat.id = car.category_id
JOIN
	clients AS cli
ON
	cou.client_id = cli.id
JOIN
	addresses AS add
ON
	cou.from_address_id = add.id
ORDER BY
	cou.id
;