SELECT
	v.name AS volunteers,
	v.phone_number,
	RIGHT(TRIM(v.address), -POSITION(', ' IN TRIM(v.address)) -1)
FROM
	volunteers AS v
JOIN
	volunteers_departments AS vd
ON
	vd.id = v.department_id
WHERE
	LEFT(LTRIM(v.address), 5) = 'Sofia'
		AND
	vd.department_name = 'Education program assistant'
ORDER BY
	v.name
;
