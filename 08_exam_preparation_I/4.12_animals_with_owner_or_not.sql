CREATE OR REPLACE PROCEDURE sp_animals_with_owners_or_not(IN animal_name VARCHAR(30), OUT result VARCHAR(30))
AS
$$
	BEGIN
		SELECT
			o.name
		FROM
			animals AS a
		LEFT JOIN
			owners AS o
		ON
			a.owner_id = o.id
		WHERE
			a.name = animal_name
		INTO
			result;
		IF result IS NULL THEN
			result := 'For adoption';
		END IF;
	END;
$$
LANGUAGE plpgsql;

CALL sp_animals_with_owners_or_not('Pumpkinseed Sunfish', '');

CALL sp_animals_with_owners_or_not('Hippo', '');

CALL sp_animals_with_owners_or_not('Brown bear', '');