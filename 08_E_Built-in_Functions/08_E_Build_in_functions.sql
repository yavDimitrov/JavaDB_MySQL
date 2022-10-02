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
	SELECT `first_name` FROM `employees`
    WHERE (`department_id`= 3 OR `department_id` = 10)
	OR
    YEAR(`hire_date`) BETWEEN 1995 AND 2005
	ORDER BY `employee_id`;
    
