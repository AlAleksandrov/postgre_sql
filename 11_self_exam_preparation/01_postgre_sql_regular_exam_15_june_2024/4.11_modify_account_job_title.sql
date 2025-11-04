CREATE OR REPLACE PROCEDURE udp_modify_account(IN address_street VARCHAR(30), IN address_town VARCHAR(30))
AS
$$
	BEGIN
		UPDATE
			accounts AS acc
		SET
			job_title = CONCAT('(Remote) ', acc.job_title)
		FROM
			addresses AS add
		WHERE
			add.account_id = acc.id
				AND
			add.street = address_street
				AND
			add.town = address_town;
	END;
$$
LANGUAGE plpgsql;

CALL udp_modify_account('97 Valley Edge Parkway', 'Nonexistent');
SELECT a.username, a.gender, a.job_title FROM accounts AS a
WHERE a.job_title ILIKE '(Remote)%';

CALL udp_modify_account('97 Valley Edge Parkway', 'Divinópolis');
SELECT a.username, a.gender, a.job_title FROM accounts AS a
WHERE a.job_title ILIKE '(Remote)%';
