CREATE OR REPLACE PROCEDURE udp_update_loyalty_status(min_orders INT)
AS
$$
	BEGIN
		UPDATE
			customers AS c
		SET
			loyalty_card = TRUE
		FROM
			orders AS o
		WHERE
			o.customer_id = (
				SELECT
					customer_id
				FROM 
					orders AS o 
				WHERE 
					c.id = o.customer_id
				GROUP BY
					o.customer_id
				HAVING
					COUNT(*) >= min_orders
		);
	END;
$$
LANGUAGE plpgsql;

CALL udp_update_loyalty_status(4);

SELECT c.id, c.first_name, c.last_name, c.loyalty_card FROM customers AS c JOIN orders AS o ON c.id = o.customer_id GROUP BY c.id, c.first_name, c.last_name, c.loyalty_card HAVING COUNT(*) >= 4;