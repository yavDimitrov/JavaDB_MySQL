SELECT
	`id`,
	CONCAT_WS(' ', `first_name`, `last_name`) AS 'Full Name',
    `job_title` AS 'Job Title',
    `salary` AS 'Salary'
    FROM `employees`
    WHERE `salary` > 1000
    ORDER BY `id`;
    
    SELECT `id`, `first_name`, `department_id` 
    FROM `employees`
    WHERE `department_id` = 1 OR `department_id` = 2
    ORDER BY `id`;