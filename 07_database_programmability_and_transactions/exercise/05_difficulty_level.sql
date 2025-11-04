CREATE OR REPLACE FUNCTION fn_difficulty_level(level INT)
RETURNS VARCHAR
AS
$$
	DECLARE
		difficulty_level VARCHAR;
	BEGIN
		IF (level <= 40) THEN
			difficulty_level := 'Normal Difficulty';
		ELSEIF (level > 60) THEN
			difficulty_level := 'Hell Difficulty';
		ELSE 
			difficulty_level := 'Nightmare Difficulty';
		END IF;
		
		RETURN difficulty_level;
	END;
$$
LANGUAGE plpgsql;

SELECT
	ug.user_id,
	ug.level,
	ug.cash,
	(SELECT * FROM fn_difficulty_level(ug.level)) AS difficulty_level
FROM
	users_games AS ug
ORDER BY
	user_id

SELECT * FROM fn_difficulty_level(45);