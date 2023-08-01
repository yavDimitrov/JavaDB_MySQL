#  02. INSERT
INSERT INTO `actors`(`first_name`, `last_name`, `birthdate`, `height` , `awards`, `country_id`)
SELECT 
	(REVERSE(`first_name`)),
	(REVERSE(`last_name`)),
    (DATE(`birthdate` - 2)),
    (`height` + 10),
    (`country_id`),
    (3)
FROM `actors`
WHERE `id` <= 10; 

#  02.10 INSERT
INSERT INTO `actors`(`first_name`, `last_name`, `birthdate`, `height` , `awards`, `country_id`)
SELECT 
	(REVERSE(`first_name`)),
	(REVERSE(`last_name`)),
   # (DATE_SUB(`birthdate`, INTERVAL 2 DAY)),
    (DATE_ADD(`birthdate`, INTERVAL -2 DAY)),
    (`height` + 10),
    (`country_id`),
    (3)
FROM `actors`
WHERE `id` <= 10; 

# 03. Update

UPDATE `movies_additional_info`
SET `runtime` = `runtime`-10
WHERE `id` BETWEEN 15 AND 25;

# 04. Delete

SELECT * FROM `countries` AS c
LEFT JOIN `movies` AS m ON c.`id`=m.`country_id`;

DELETE c FROM `countries` AS c
LEFT JOIN `movies` AS m ON c.`id`=m.`country_id`
WHERE m.country_id IS NULL;

# 04.10 Delete

DELETE FROM `countries`
WHERE id NOT IN (SELECT `country_id` FROM `movies`);