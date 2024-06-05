CREATE OR REPLACE PROCEDURE sp_transfer_money(
	IN sender_id INT,
	IN receiver_id INT,
	IN transfer_amount INT,
	OUT status VARCHAR(30)
)
AS
$$ 
	DECLARE
		sender_amount INT;
		receiver_amount INT;
		temp_val INT;
	BEGIN
		SELECT amount FROM bank WHERE id = sender_id INTO sender_amount;

		IF sender_amount < transfer_amount THEN
			status := 'Not enough money';
			RETURN;
		END IF;

		SELECT amount FROM bank WHERE id = receiver_id INTO receiver_amount;

		UPDATE bank SET amount = amount - transfer_amount WHERE id = sender_id;
		UPDATE bank SET amount = amount + transfer_amount WHERE id = receiver_id;

		SELECT amount FROM bank WHERE id = sender_id INTO temp_val;
		IF sender_amount - transfer_amount <> temp_val THEN
			status := 'Error in sender';
			ROLLBACK;		
			RETURN;
		END IF;

		SELECT amount FROM bank WHERE id = receiver_id INTO temp_val;
		IF receiver_amount + transfer_amount <> temp_val THEN
			status := 'Error in receiver';
			ROLLBACK;
			RETURN;
		END IF;

		status := 'Transaction successfull';
		COMMIT;
	END;
$$
LANGUAGE plpgsql;