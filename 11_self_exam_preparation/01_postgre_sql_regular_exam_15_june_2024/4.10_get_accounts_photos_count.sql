CREATE OR REPLACE FUNCTION udf_accounts_photos_count(account_username VARCHAR(30))
RETURNS INT
AS
$$
	DECLARE
		photos_count INT;
	BEGIN
		photos_count = (
		SELECT
			COUNT(*)
		FROM
			accounts AS a
		JOIN
			accounts_photos AS ap
		ON
			ap.account_id = a.id
		WHERE
			a.username = account_username
		);
		RETURN photos_count;
	END;
$$
LANGUAGE plpgsql;

SELECT udf_accounts_photos_count('ssantryd') AS photos_count;