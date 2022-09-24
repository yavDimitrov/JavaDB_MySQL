#1. Find All Information About Departments 
SELECT * FROM `departments`
ORDER BY `department_id`;

#1. Find all Department Names
SELECT `name` FROM `departments`
ORDER BY `department_id`;

#3. Find salary of Each Employee
SELECT `first_name`, `last_name`, `salary` FROM `employees`
ORDER BY `employee_id`;

#4. Find Full Name of Each Employee
SELECT `first_name`, `middle_name`, `last_name` FROM `employees`
ORDER BY `employee_id`;

#5.1. Find Email Address of Each Employee
SELECT CONCAT(`first_name`, '.', `last_name`, '@softuni.bg')
AS `full_email_address`
FROM `employees`;

#6.1. Find All Different Employee's Salaries
SELECT DISTINCT (`salary`) FROM `employees`;

#7.1. Find all Information About Employees
SELECT * FROM `employees`
WHERE `job_title` = 'Sales Representative'
ORDER BY `employee_id`;

#8.1. Find Names of All Employees by salary in Range
SELECT `first_name`, `last_name`, `job_title` FROM `employees`
WHERE `salary` BETWEEN 20000 and 30000
ORDER BY `employee_id`;

#9.1. Find Names of All Employees
SELECT CONCAT_WS(' ',`first_name`, `middle_name`, `last_name`) 
AS `Full name` 
FROM `employees`
WHERE `salary` IN (25000, 14000, 12500, 23600);

#10.1. Find All Employees Without Manager 
SELECT `first_name`, `last_name` FROM `employees`
WHERE `manager_id` IS NULL;

#11.1. Find All Employees with salary More Than 50000
 SELECT `first_name`, `last_name`, `salary` FROM `employees`
 WHERE `salary` > 50000
 ORDER BY `salary` DESC;
 
 #12.1. Find 5 Best Paid Employees
 SELECT `first_name`, `last_name` FROM `employees`
 ORDER BY `salary` DESC
 LIMIT 5;
 
 #13.1. Find All Employees Except Marketing
 SELECT `first_name`, `last_name` FROM `employees`
 WHERE `department_id` != 4;
 
 #14. 1. Sort Employees Table
 SELECT * FROM `employees`
 ORDER BY `salary` DESC, `first_name`, `last_name` DESC, `middle_name`, `employee_id`;
 
 #15.1. Create View Employees with Salaries 
 CREATE VIEW `v_employees_salaries` AS
	SELECT `first_name`, `last_name`, `salary`
	FROM `employees`;
    
SELECT * FROM `v_employees_salaries`;

#16. 1. Create View Employees with Job Titles 
CREATE VIEW `v_employees_job_titles` AS
	SELECT CONCAT_WS(' ', `first_name`,`middle_name`, `last_name`) AS `full_name`, `job_title`
    FROM `employees`;
    
SELECT * FROM `v_employees_job_titles`;

#17 1. Distinct Job Titles 
SELECT DISTINCT `job_title` FROM `employees`
	ORDER BY `job_title`;
    
#18 1. Find First 10 Started Projects 
SELECT * FROM `projects`
	ORDER BY `start_date`, `name`, `project_id`
    LIMIT 10;
    