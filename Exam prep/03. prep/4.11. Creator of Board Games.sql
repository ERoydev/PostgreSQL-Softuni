
CREATE OR REPLACE FUNCTION fn_creator_with_board_games(first_name_of_a_board_game_creator VARCHAR(30)) 
RETURNS INT AS
$$
	DECLARE
		count_games INT;
	BEGIN
		SELECT
			COUNT(board_game_id)
		FROM
			creators AS c
			JOIN creators_board_games AS cbg
			ON c.id = cbg.creator_id
		
		WHERE c.first_name = first_name_of_a_board_game_creator
		INTO count_games;

		RETURN count_games;
	END
$$
LANGUAGE plpgsql;

SELECT fn_creator_with_board_games('Bruno')
