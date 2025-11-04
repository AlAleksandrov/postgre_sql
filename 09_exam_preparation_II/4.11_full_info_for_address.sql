CREATE TABLE search_results (
    id SERIAL PRIMARY KEY,
    address_name VARCHAR(50),
    full_name VARCHAR(100),
    level_of_bill VARCHAR(20),
    make VARCHAR(30),
    condition CHAR(1),
    category_name VARCHAR(50)
);

CREATE OR REPLACE PROCEDURE sp_courses_by_address(address_name VARCHAR(100))
AS
$$
	BEGIN
		TRUNCATE search_results;

		INSERT INTO
			search_results(address_name, full_name, level_of_bill, make, condition, category_name)
		SELECT
			add.name AS address_name,
			cli.full_name,
			CASE 
				WHEN cou.bill <= 20 THEN 'Low'
				WHEN cou.bill > 30 THEN 'High'
				ELSE 'Medium'
			END AS level_of_bill,
			car.make,
			car.condition,
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
		WHERE
			add.name = address_name
		ORDER BY
			car.make,
			cli.full_name;		
	END;
$$
LANGUAGE plpgsql;

CALL sp_courses_by_address('700 Monterey Avenue');

SELECT * FROM search_results;

CALL sp_courses_by_address('66 Thompson Drive');

SELECT * FROM search_results;
