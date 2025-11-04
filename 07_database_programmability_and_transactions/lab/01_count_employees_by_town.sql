CREATE OR REPLACE FUNCTION fn_count_employees_by_town(town_name varchar(20))
RETURNS INT AS
$$
	DECLARE
		count_of_employees INT;
	BEGIN
		SELECT
			COUNT(*) 
		FROM
			employees AS e
		JOIN
			addresses AS a
		USING
			(address_id)
		JOIN
			towns AS t
		USING
			(town_id)
		WHERE
			t.name = town_name
		INTO
			count_of_employees;
		RETURN count_of_employees; 
	END;
$$
LANGUAGE plpgsql;