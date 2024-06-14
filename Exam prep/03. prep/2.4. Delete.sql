-- Tirq nai dalechnata do tablicata koqto trqbva da iztriq narechen addresses
DELETE FROM board_games
WHERE publisher_id IN (
	SELECT
	id
FROM publishers
WHERE address_id IN (
	SELECT 
		id 
	FROM addresses 
	WHERE SUBSTRING(town, 1, 1) = 'L'
	)
);

-- posle vtorata nai dalechna 
DELETE FROM publishers
WHERE address_id IN (
	SELECT id
	FROM addresses
	WHERE SUBSTRING(town, 1, 1) = 'L'
);

DELETE FROM addresses
WHERE SUBSTRING(town, 1, 1) = 'L';
