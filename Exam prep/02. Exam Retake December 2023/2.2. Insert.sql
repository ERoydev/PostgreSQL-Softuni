CREATE TABLE gift_recipients (
	"id" SERIAL PRIMARY KEY,
    -- Tuk ne mi e dadeno kak da q praq taq tablica i mi gurmeshe shtoto nqmah NOT NULL, imai go v predvid
	"name" VARCHAR(50) NOT NULL,
	country_id INT NOT NULL,
	gift_send BOOLEAN DEFAULT FALSE
);

INSERT INTO gift_recipients ("name", country_id, gift_send)
SELECT
	CONCAT(first_name, ' ', last_name) AS "name",
	country_id AS "country_id",
	CASE
		WHEN country_id IN (7, 8, 14, 17, 26) THEN TRUE
		ELSE FALSE
	END AS gift_send
FROM
	customers;

