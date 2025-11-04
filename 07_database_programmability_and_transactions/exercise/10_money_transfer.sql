CREATE OR REPLACE PROCEDURE sp_transfer_money(sender_id INT, receiver_id INT, amount NUMERIC(4))
AS
$$
	DECLARE
		current_balance NUMERIC;
	BEGIN
		SELECT balance INTO current_balance FROM accounts WHERE id = sender_id;
		
		IF current_balance - amount >= 0 THEN
			CALL sp_withdraw_money(sender_id, amount);
			CALL sp_deposit_money(receiver_id, amount);
		END IF;
	END;
$$
LANGUAGE plpgsql;

SELECT * FROM accounts WHERE id = 2;
CALL sp_transfer_money(5, 1, 5000.0000);
CALL sp_transfer_money(10, 2, 1043.9000);
CALL sp_transfer_money(13, 15, 400.9000);