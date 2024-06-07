CREATE OR REPLACE PROCEDURE sp_transfer_money(sender_id INT, receiver_id INT, amount NUMERIC)
AS
$$
	DECLARE 
		current_status BOOLEAN;
	BEGIN
        -- Za da assigna v promenliva stoinostta na procedura, koqto naprimer vrushta BOOLEAN, az go podavam kato parametura na koito procedurata shte vurne OUT stoinostta
		CALL sp_withdraw_money(sender_id, amount, current_status);

		IF NOT current_status THEN
			ROLLBACK;
			RETURN;
		END IF;

		CALL sp_deposit_money(receiver_id, amount);
		COMMIT;
	END
$$
LANGUAGE plpgsql;