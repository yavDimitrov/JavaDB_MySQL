#1. Find Names of All Employees by First Name
	SELECT `first_name`, `last_name` FROM `employees`
	WHERE `first_name` LIKE 'Sa%' 
			# WHERE left (e.`first_name`, 2) = 'Sa'
	ORDER BY `employee_id`;
    
#2. Find Names of All Employees by Last Name
	SELECT `first_name`, `last_name` FROM `employees`
    WHERE `last_name` LIKE '%ei%'
    ORDER BY `employee_id`;
    
#3. Find First Names of All Employees
	/*   SELECT `first_name` FROM `employees`
    WHERE (`department_id`= 3 OR `department_id` = 10)
	OR
    YEAR(`hire_date`) BETWEEN 1995 AND 2005
	ORDER BY `employee_id`;  */
    
	SELECT `first_name` from `employees`
	WHERE `department_id` IN (3,10)
	AND 
	year(`hire_date`) BETWEEN 1995 and 2005
	ORDER BY `employee_id`;
    
#4. Find All Employees Except Engineers
	SELECT `first_name`, `last_name` FROM `employees`
    WHERE `job_title` NOT LIKE '%engineer%'
    ORDER BY `employee_id`;
    
#5. Find Towns with Name Length
	SELECT `name` FROM `towns`
    WHERE char_length(`name`) = 5 OR char_length(`name`) = 6
    # WHERE char_length(`name`) IN (5,6)
    ORDER BY `name`;
    
#06. Find Towns Starting With
	SELECT * FROM `towns`
		#WHERE `name` REGEXP '^[MKBE]' 
    WHERE 
	   `name` LIKE 'm%'
	OR `name` LIKE 'k%'
    OR `name` LIKE 'b%'
    OR `name` LIKE 'e%'
    ORDER BY `name`;
    
#07. Find Towns Not Starting With
	SELECT * FROM `towns`
    WHERE
		`name` NOT LIKE 'r%'
        AND `name` NOT LIKE 'b%'
        AND `name` NOT LIKE 'd%'
        ORDER BY `name`;

	