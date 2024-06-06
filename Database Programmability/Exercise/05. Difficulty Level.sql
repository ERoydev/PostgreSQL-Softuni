CREATE OR REPLACE FUNCTION fn_difficulty_level(level INT)
RETURNS VARCHAR AS
$$
	DECLARE
		difficulty VARCHAR;
	BEGIN
		IF level <= 40 THEN
			difficulty := 'Normal Difficulty';
		ELSIF level >= 41 AND level <= 60 THEN
			difficulty := 'Nightmare Difficulty';
		ELSE 
			difficulty := 'Hell Difficulty';
		END IF;
		RETURN difficulty;
	END
$$
LANGUAGE plpgsql;


SELECT
	user_id,
	level,
	cash,
	fn_difficulty_level(level)
FROM
	users_games

ORDER BY user_id ASC