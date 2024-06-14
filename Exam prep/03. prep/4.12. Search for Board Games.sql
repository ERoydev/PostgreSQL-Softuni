CREATE TABLE search_results (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	release_year INT,
	rating NUMERIC(3, 2),
	category_name VARCHAR(30),
	publisher_name VARCHAR(30),
	min_players VARCHAR(20),
	max_players VARCHAR(20)
);

CREATE OR REPLACE PROCEDURE usp_search_by_category(category VARCHAR(50))
AS
$$
	BEGIN
		INSERT INTO search_results(name, release_year, rating, category_name, publisher_name, min_players, max_players)
		SELECT
			bg.name,
			bg.release_year,
			bg.rating,
			c.name AS category_name,
			p.name,
			CONCAT(pr.min_players, ' people'),
			CONCAT(pr.max_players, ' people')
		FROM
			categories AS c
				JOIN board_games AS bg
				ON c.id = bg.category_id
					JOIN players_ranges AS pr
					ON bg.players_range_id = pr.id
						JOIN publishers AS p
						ON bg.publisher_id = p.id
		
		WHERE c.name = 'Wargames'
		ORDER BY p.name ASC, bg.release_year DESC;
		
	END
$$
LANGUAGE plpgsql;
