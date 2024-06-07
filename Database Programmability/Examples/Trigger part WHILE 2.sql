CREATE OR REPLACE FUNCTION delete_last_itemslog()
RETURNS TRIGGER
AS
$$
	BEGIN
		WHILE (SELECT count(*) FROM items_log) > 10 LOOP
			DELETE FROM items_log WHERE id = (SELECT MIN(id) FROM items_log);
		END LOOP;
		RETURN new;
	END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER clear_items_log_trigger
AFTER INSERT ON items_log
FOR EACH STATEMENT
EXECUTE PROCEDURE delet_last_itemslog;