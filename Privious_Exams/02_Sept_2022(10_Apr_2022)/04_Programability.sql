# 10.History movies;

DELIMITER $$
CREATE FUNCTION udf_actor_history_movies_count(full_name VARCHAR(50))
	RETURNS INT
    DETERMINISTIC
    BEGIN
		DECLARE history_movies_count INT; # броя на историческите филми за дадения актьор
			SET history_movies_count := (
				SELECT COUNT(g.`name`) AS 'history_movies'
                FROM `actors` AS a
                JOIN `movies_actors` AS ma ON a.`id` = ma.`actor_id`
                JOIN `genres_movies` AS gm USING (`movie_id`)
                JOIN `genres` AS g ON gm.`genre_id` = g.`id`
                WHERE g.`name` = 'history' and full_name = CONCAT(a.`first_name`, ' ', a.`last_name`)
                GROUP BY g.`name`             
            );            
            RETURN history_movies_count;    
    END$$
    
    #11. Movie awards
    
    DELIMITER $$
    CREATE PROCEDURE udp_award_movie(movie_title VARCHAR(50))
		BEGIN
			UPDATE `actors` AS a
            JOIN `movies_actors` AS ma ON a.`id` = ma.`actor_id`
            JOIN `movies` AS m ON ma.`movie_id` = m.`id`
            SET a.`awards` = a.`awards` + 1 
            WHERE m.`title` = movie_title;
		END$$
    
    
    #COMMANDS TO CHECK TABLE
    CONCAT, CONCAT_WS, CEILING, YEAR, CHAR_LENGTH, SUBSTR, REVERSE, COUNT, SUM