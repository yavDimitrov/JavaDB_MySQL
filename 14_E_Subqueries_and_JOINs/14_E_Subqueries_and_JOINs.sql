#01. One-To-One Relationship
	SELECT e.`employee_id`, e.`job_title`, e.`address_id`, a.`address_text`
    FROM `employees` AS e
    INNER JOIN `addresses` AS a
    ON e.`address_id` = a.`address_id`
    ORDER BY `address_id`
    LIMIT 5;
    
#02. Addresses with Towns
	SELECT e.`first_name`, e.`last_name`, t.`name`, a.`address_text`
    FROM `employees` AS e
    INNER JOIN `addresses` AS a ON e.`address_id` = a.`address_id`
    INNER JOIN `towns` AS t ON a.`town_id` = t.`town_id`
    ORDER BY e.`first_name`, e.`last_name`
    LIMIT 5;
    