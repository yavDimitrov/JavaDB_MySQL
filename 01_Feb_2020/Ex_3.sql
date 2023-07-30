-- ex 05
SELECT first_name, age , salary
FROM players
ORDER BY salary DESC;

-- ex 06
SELECT p.id, CONCAT(p.first_name, ' ', p.last_name) AS full_name, p.age, p.`position` , p.`hire_date`
FROM players AS p
JOIN skills_data AS sd
ON p.skills_data_id = sd.id
WHERE 
sd.strength > 50
AND p.`position` = 'A'
AND p.age < 23 AND p.hire_date IS NULL
ORDER BY salary ASC, age ASC;

-- ex 07
SELECT t.`name`, t.established, fan_base, COUNT(p.`id`) as players_count
FROM teams AS t
LEFT JOIN players AS p
ON t.id = p.team_id
GROUP BY t.`id`
ORDER BY players_count DESC, fan_base DESC;

-- ex 07 1.0
SELECT t.`name`, ANY_VALUE(t.established), ANY_VALUE(fan_base), COUNT(p.`id`) as players_count
FROM teams AS t
LEFT JOIN players AS p
ON t.id = p.team_id
GROUP BY t.`id`
ORDER BY players_count DESC, fan_base DESC;

-- ex 07 version 2.0
SELECT t.`name`, t.established, fan_base, (SELECT COUNT(*) FROM players WHERE team_id = t.id) AS players_count
FROM teams AS t
GROUP BY t.`id`
ORDER BY players_count DESC, fan_base DESC;

-- ex 08 
SELECT  MAX(sd.speed) AS spd, t.`name`
FROM skills_data AS sd
RIGHT JOIN players AS p ON p.skills_data_id = sd.id
RIGHT JOIN teams AS tm ON p.team_id = tm.id
RIGHT JOIN stadiums AS s ON tm.stadium_id = s.id
RIGHT JOIN towns AS t ON s.town_id = t.id
WHERE tm.`name` != 'Devify'
GROUP BY t.id
ORDER BY spd DESC, t.`name` ASC;

-- ex 08 version 1.01
SELECT MAX(sd.speed) AS max_speed, tw.`name` AS `town_name`
FROM towns as tw
LEFT JOIN stadiums AS s ON s.town_id = tw.id
LEFT JOIN teams AS t ON t.stadium_id=s.id
LEFT JOIN players AS p ON t.id = p.id
LEFT JOIN skills_data AS sd ON p.id = sd.id
WHERE tw.`name` != 'Devify'
GROUP BY `town_name`
ORDER BY `max_speed` DESC, `town_name`; 


-- ex 09

SELECT  c.`name`, COUNT(p.id) AS total_count_of_players, SUM(salary) AS total_sum_of_salaries
FROM  players AS p
RIGHT JOIN teams AS tm ON p.team_id = tm.id
RIGHT JOIN stadiums AS s ON tm.stadium_id = s.id
RIGHT JOIN towns AS t ON s.town_id = t.id
RIGHT JOIN countries AS c ON t.country_id = c.id
GROUP BY c.id
ORDER BY total_count_of_players DESC, c.`name` ASC;


-- ex 10

SELECT COUNT(p.id) as cnt
FROM  players AS p 
RIGHT JOIN teams AS tm ON p.team_id = tm.id
RIGHT JOIN stadiums AS s ON tm.stadium_id = s.id
WHERE s.`name` = 'Jaxworks';


DELIMITER $$
CREATE FUNCTION `udf_stadium_players_count` (stadiumname VARCHAR(44))
RETURNS INTEGER
DETERMINISTIC
BEGIN
RETURN (SELECT COUNT(p.id) as cnt
FROM  players AS p 
RIGHT JOIN teams AS tm ON p.team_id = tm.id
RIGHT JOIN stadiums AS s ON tm.stadium_id = s.id
WHERE s.`name` = stadiumname) ;
END
$$

SELECT udf_stadium_players_count('Jaxworks');

-- ex 11 

SELECT  
CONCAT(first_name, ' ', last_name) AS full_name, age, salary, dribbling, speed, t.`name`
	FROM  skills_data AS sd
	JOIN players AS p ON sd.id = p.skills_data_id
	RIGHT JOIN teams AS t ON p.team_id = t.id
WHERE t.`name` = 'Skyble'
	AND speed > (SELECT AVG(speed) FROM skills_data)
	AND dribbling > 20
ORDER BY sd.speed DESC
LIMIT 1;

DELIMITER ###
CREATE PROCEDURE `udp_find_playmaker` (min_dribble_points INT, team_name VARCHAR(45))
BEGIN
	SELECT  
		CONCAT(first_name, ' ', last_name) AS full_name, age, salary, dribbling, speed, t.`name`
		FROM  skills_data AS sd
		JOIN players AS p ON sd.id = p.skills_data_id
		RIGHT JOIN teams AS t ON p.team_id = t.id
	WHERE t.`name` = team_name
		AND speed > (SELECT AVG(speed) FROM skills_data)
		AND dribbling > min_dribble_points
	ORDER BY sd.speed DESC
	LIMIT 1;
END

###

CALL udp_find_playmaker(10, 'Skyble');