CREATE OR REPLACE FUNCTION fn_courses_by_client(phone_num VARCHAR(20))
RETURNS INT
AS
$$
	DECLARE
		num_of_courses INT;
	BEGIN
		SELECT
			COUNT(*)
		INTO
			num_of_courses
		FROM
			courses AS c
		JOIN
			clients AS cl
		ON
			cl.id = c.client_id
		WHERE
			cl.phone_number = phone_num;
			
		RETURN num_of_courses;
	END;
$$
LANGUAGE plpgsql;

SELECT * FROM fn_courses_by_client('(803) 6386812');