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
    
#03. Sales Employee
	SELECT e.`employee_id`, e.`first_name`, e.`last_name`, d.`name`
    FROM `employees` AS e
    INNER JOIN `departments` AS d ON e.`department_id` = d.`department_id`
    WHERE d.`name` = 'Sales'
    ORDER BY e.`employee_id` DESC;
    
#04. Employee Departments
	SELECT e. `employee_id`, e.`first_name`, e.`salary`, d.`name`
	FROM `employees` AS e
	INNER JOIN `departments` AS d
	ON e.`department_id` = d.`department_id`
	WHERE e.`salary` > 15000
	ORDER BY d.`department_id` DESC
	LIMIT 5;
	
#05. Employees Without Project
	SELECT e.`employee_id`, e.`first_name`
	FROM `employees` AS e
	LEFT JOIN `employees_projects` AS p
	ON e.`employee_id` = p.`employee_id`
	WHERE p.`project_id` IS NULL
	ORDER BY e.`employee_id` DESC
	LIMIT 3;
    
#06. Employees Hired After
	 
    