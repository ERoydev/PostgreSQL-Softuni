UPDATE players_ranges
SET max_players = max_players + 1
WHERE id IN (
	SELECT
		id
	FROM
		players_ranges
	WHERE max_players = 2
);

UPDATE board_games
SET name = CONCAT(name, ' ', 'V2')
WHERE id IN (
	SELECT id FROM board_games WHERE release_year >= 2020
);
	