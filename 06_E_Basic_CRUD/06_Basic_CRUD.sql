#1. Find All Information About Departments 
SELECT * FROM `departments`
ORDER BY `department_id`;

#1. Find all Department Names
SELECT `name` FROM `departments`
ORDER BY `department_id`;

#3. Find salary of Each Employee
SELECT `first_name`, `last_name`, `salary` FROM `employees`
ORDER BY `employee_id`;