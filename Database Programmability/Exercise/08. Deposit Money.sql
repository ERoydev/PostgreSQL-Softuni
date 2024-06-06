CREATE OR REPLACE PROCEDURE sp_deposit_money(account_id INT, money_amount NUMERIC)
AS
$$
	BEGIN
		UPDATE accounts
		SET balance = balance + money_amount
		WHERE id = account_id;
		COMMIT;
	END
$$
LANGUAGE plpgsql;


-- WITH validation
CREATE OR REPLACE PROCEDURE sp_deposit_money(account_id INT, money_amount NUMERIC)
AS
$$
	BEGIN
		IF (SELECT id FROM accounts WHERE id = account_id) IS NULL THEN
			RAISE NOTICE 'Account with this id does not exists';
			RETURN;
		END IF;
	
		UPDATE accounts
		SET balance = balance + money_amount
		WHERE id = account_id;
		COMMIT;
	END
$$
LANGUAGE plpgsql;

CALL sp_deposit_money(2, 200);

