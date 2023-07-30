
-- Excersise 02
-- 1

INSERT INTO coaches(first_name, last_name, salary, coach_level)

SELECT first_name, last_name, salary*2, char_length(first_name) AS coach_level FROM players WHERE age >= 45;

-- try
SELECT * FROM coaches;

-- Excersise 02
-- 2
/* SELECT * FROM coaches AS c
LEFT JOIN players_coaches AS pc
ON c.id = pc.id
WHERE c.first_name LIKE 'A%' AND count(pc.player_id)>0; */


-- Start
SELECT *, (SELECT COUNT(*) FROM players_coaches WHERE coach_id = c.id) FROM 
coaches AS c
WHERE c.first_name LIKE 'A%'
AND (SELECT COUNT(*) FROM players_coaches WHERE coach_id = c.id) > 0;

-- First
UPDATE coaches
SET coach_level = coach_level+1
WHERE c.first_name LIKE 'A%'
AND (SELECT COUNT(*) FROM players_coaches WHERE coach_id = c.id) > 0;

-- Version
UPDATE coaches
JOIN players_coaches AS pc ON pc.coach_id = coaches.id
SET coach_level = coach_level + 1
WHERE first_name LIKE 'A%'; 

-- Version_02
UPDATE coaches AS co
SET co.coach_level = coach_level + 1
WHERE co.id IN(SELECT coach_id FROM players_coaches)
AND first_name LIKE 'A%'  ;

-- JOIN multitables
UPDATE coaches AS co
JOIN players_coaches AS pc
ON pc.coach_id = co.id
JOIN players AS p
ON p.id = pc.player_id
SET coach_level = coach_level + 1
WHERE co.first_name LIKE 'A%';

-- Delete type 
DELETE FROM players WHERE age >= 45;
            

DROP SCHEMA fsd;




