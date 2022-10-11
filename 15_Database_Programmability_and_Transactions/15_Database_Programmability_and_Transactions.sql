SELECT * FROM `towns` WHERE `name` = 'Sofia';
SELECT * FROM `addresses` WHERE `town_id` = 32;
SELECT * FROM `employees` WHERE `address_id` = 291;

SELECT COUNT(*) FROM `employees` AS `e`
JOIN `addresses` AS `a` ON `a`.`address_id` = `e`.`address_id`
JOIN `towns` AS `t` ON `t`.`town_id` = `a`.`town_id`
WHERE `t`.`name` = 'Sofia';

SELECT COUNT(*) FROM `employees` AS `e`
WHERE `e`.`address_id` IN (
	SELECT `address_id` FROM `addresses` AS `a`
	WHERE `a`.`town_id` = (
		SELECT `town_id` FROM `towns` WHERE `name` = 'Sofia'
        )
);




