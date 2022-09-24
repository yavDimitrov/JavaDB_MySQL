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
    
        SELECT `id`, `first_name`, `department_id` 
    FROM `employees`
    WHERE `department_id` BETWEEN 1 and 3
    ORDER BY `id`;      
    
    SELECT `id`, `first_name`, `department_id` 
    FROM `employees`
    WHERE `department_id` NOT IN ('1', '3')
    ORDER BY `id`;
    
    SELECT * FROM `employees`
    WHERE `department_id` = 4 AND `salary` > 1000;
    
    
ALTER VIEW `employees_overView` AS
SELECT
	`id` AS 'No.',
	CONCAT_WS(' ', `first_name`, `last_name`) AS 'Full Name',
    `job_title` AS 'Job Title',
    `salary` AS 'Salary'
    FROM `employees`
    WHERE `salary` > 1000
    ORDER BY `id`;
    
    SELECT * FROM `employees_overView`;
    
    CREATE VIEW `v_top_paid_e,ployee` AS
		SELECT *
        FROM `employees`
        ORDER BY `salary` DESC
        LIMIT 1;
        
	SELECT * FROM `v_top_paid_e,ployee`;
    
    DELETE FROM `employees`
    WHERE `department_id` IN (1,2);
    
    SELECT*FROM `employees`
    ORDER BY `id`;