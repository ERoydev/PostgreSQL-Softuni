CREATE TABLE logs(
	id SERIAL PRIMARY KEY,
	account_id INT,
	old_sum NUMERIC,
	new_sum NUMERIC
);

CREATE OR REPLACE FUNCTION trigger_fn_insert_new_entry_into_logs()
RETURNS TRIGGER
AS
$$
	BEGIN
		INSERT INTO logs(account_id, old_sum, new_sum)
		VALUES (OLD.id, OLD.balance, NEW.balance);
		RETURN NEW;
	END
$$
LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tr_account_balance_change
-- Samo kogato sum promenil balance shte se trigerne
AFTER UPDATE OF balance ON accounts
FOR EACH ROW
WHEN
	-- I imam uslovie samo kogato balancite sa promeneni
	(NEW.balance <> OLD.balance)
EXECUTE PROCEDURE trigger_fn_insert_new_entry_into_logs();

