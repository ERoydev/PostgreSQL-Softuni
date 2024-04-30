SELECT
	CONCAT(m.mountain_range, ' ', p.peak_name) AS mountain_information,
	CHAR_LENGTH(CONCAT(m.mountain_range, ' ', p.peak_name)) AS characters_length,
	BIT_LENGTH(CONCAT(m.mountain_range, ' ', p.peak_name)) AS bits_of_a_string
FROM
	mountains AS m,
	peaks AS p
WHERE p.mountain_id = m."id"