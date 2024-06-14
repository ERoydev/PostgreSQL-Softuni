CREATE OR REPLACE PROCEDURE sp_players_team_name(IN player_name VARCHAR(50), OUT team_name_result VARCHAR(50))
AS
$$
	BEGIN
		SELECT
			t.name
		FROM
			players AS p
			JOIN teams AS t
			ON p.team_id = t.id
		
		WHERE CONCAT(first_name, ' ', last_name) = player_name INTO team_name_result;

		IF team_name_result IS NULL THEN
			team_name_result := 'The player currently has no team';
		END IF;
	END
$$
LANGUAGE plpgsql;