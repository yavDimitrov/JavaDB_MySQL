# 05.Countries
 SELECT * FROM `countries`
 ORDER BY `currency` DESC , `id` ASC;
 
# 06. Old movies

SELECT m.`id`, m.`title`, mi.`runtime`, mi.`budget`, mi.`release_date` FROM `movies` AS `m`
JOIN `movies_additional_info` AS `mi` ON m.movie_info_id = mi.id
WHERE YEAR(mi.`release_date`) BETWEEN 1966 AND 1999
ORDER BY mi.`runtime`, mi.`id`
LIMIT 20
;

# 07. Movie CASTING

SELECT 	CONCAT(`first_name`, ' ', `last_name`) AS 'full_name',
		CONCAT(REVERSE(`last_name`), LENGTH(`last_name`), '@cast.com') AS 'email',
		2022 - YEAR(`birthdate`) AS 'age',
        `height`
FROM `actors` AS a
WHERE a.`id` NOT IN (SELECT `actor_id` FROM `movies_actors`)
ORDER BY `height`
;

# 8. International festival

SELECT c.`name`, COUNT(m.`id`) AS 'movies_count'
FROM `countries` AS c
JOIN `movies` AS m ON c.`id` = m.`country_id`
GROUP BY c.`name`
HAVING `movies_count` >= 7
ORDER BY c.`name` DESC
;