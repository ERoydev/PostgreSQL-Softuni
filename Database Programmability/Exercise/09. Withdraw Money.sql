CREATE OR REPLACE PROCEDURE sp_withdraw_money(account_id INT, money_amount NUMERIC)
AS
$$
	BEGIN
		IF (SELECT balance FROM accounts WHERE id = account_id) < money_amount THEN
			RAISE NOTICE 'Insufficient balance to withdraw %', ROUND(money_amount, 4);
			RETURN;
		END IF;

		UPDATE accounts
		SET balance = balance - money_amount
		WHERE id = account_id;
	END
$$
LANGUAGE plpgsql;