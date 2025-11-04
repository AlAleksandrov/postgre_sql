CREATE OR REPLACE FUNCTION udf_classification_items_count(classification_name VARCHAR(30))
RETURNS VARCHAR
AS
$$
	DECLARE
		result INT;
	BEGIN
		SELECT
			COUNT(i.id)
		INTO
			result
		FROM
			items AS i
		JOIN
			classifications AS c
		ON
			i.classification_id = c.id
		
		WHERE
			c.name = classification_name
		GROUP BY
			c.name;
			
		IF result <> 0 THEN 
			RETURN 'Found ' || result || ' items.';
		ELSE 
			RETURN 'No items found.';
		END IF;
	END;
$$
LANGUAGE plpgsql;

SELECT udf_classification_items_count('Nonexistent') AS message_text;

SELECT udf_classification_items_count('Laptops') AS message_text;