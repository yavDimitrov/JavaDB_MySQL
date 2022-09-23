SELECT
	`id`,
	CONCAT_WS(' ', `first_name`, `last_name`) AS 'Full Name',
    `job_title` AS 'Job Title',
    `salary` AS 'Salary'
    FROM `employees`
    WHERE `salary` > 1000
    ORDER BY `id`;
    
    SELECT DISTINCT `department_id` FROM `employees`;