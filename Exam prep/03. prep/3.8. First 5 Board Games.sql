SELECT
	bg.name,
	bg.rating,
	c.name AS category_name
FROM 
	board_games AS bg
	LEFT JOIN categories AS c
	ON bg.category_id = c.id
	LEFT JOIN players_ranges AS p
	ON bg.players_range_id = p.id

WHERE 
	(rating > 7 AND bg.name ILIKE '%a%')
		OR
	(rating > 7.5 AND p.min_players >=2 AND p.max_players <= 5)

ORDER BY bg.name ASC, bg.rating DESC
LIMIT 5;