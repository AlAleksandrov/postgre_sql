CREATE OR REPLACE FUNCTION fn_get_volunteers_count_from_department(searched_volunteers_department VARCHAR(30))
RETURNS INT
AS
$$
	DECLARE
		count_of_volunteers INT;
	BEGIN
		count_of_volunteers := (
		SELECT
			COUNT(*)
		FROM
			volunteers AS v
		JOIN
			volunteers_departments AS vd
		ON
			v.department_id = vd.id
		WHERE
			vd.department_name = searched_volunteers_department
		);
		RETURN count_of_volunteers;
	END;
$$
LANGUAGE plpgsql;


SELECT * FROM fn_get_volunteers_count_from_department('Education program assistant');
SELECT * FROM fn_get_volunteers_count_from_department('Guest engagement');
SELECT * FROM fn_get_volunteers_count_from_department('Zoo events');
