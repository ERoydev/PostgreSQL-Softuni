CREATE TABLE items(
	id SERIAL PRIMARY KEY,
	status INT,
	created DATE
);

CREATE TABLE items_log(
	id SERIAL PRIMARY KEY,
	status INT,
	created DATE
);

-- Suzdavam trigger funciqta 
CREATE FUNCTION log_items()
RETURNS TRIGGER
AS
$$
	BEGIN
		INSERT INTO items_log(status, created)
            -- Imam new i old
			VALUES (new.status, new.created);
			RETURN new;
	END
$$
LANGUAGE plpgsql;

-- Realno AFTER insert v tablica items za vseki zapis execute-vam funciqta log_items
CREATE TRIGGER log_items_trigger
AFTER INSERT ON items
FOR EACH ROW
EXECUTE PROCEDURE log_items();
-- Tuk e PROCEDURE zaradi starite versii inache i FUNCTION shte raboti

-- Sega sled kato insertna v tablicata neshto to se insertva i v items_log
INSERT INTO items(status, created)
VALUES
	(1, now()),
	(2, now()),
	(3, now()),
	(4, now()),
	(5, now());

SELECT
	*
FROM
	items_log