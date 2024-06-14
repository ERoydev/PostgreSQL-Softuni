
SELECT
	CONCAT(first_name, ' ', last_name) AS full_name,
	email,
	MAX(rating) AS rating
FROM
	creators AS c
	JOIN creators_board_games AS cbg
	ON c.id = cbg.creator_id
		JOIN board_games AS bg
		ON bg.id = cbg.board_game_id

WHERE email LIKE '%.com'
GROUP BY full_name, email
ORDER BY full_name ASC;