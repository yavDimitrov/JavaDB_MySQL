#1. Employees with Salary Above 35000
DELIMITER $$

CREATE PROCEDURE usp_get_employees_salary_above_35000()
BEGIN 
	SELECT `first_name`, `last_name` FROM `employees`
    WHERE `salary` > 35000
    ORDER BY `first_name`, `last_name`, `employee_id`;
END$$

#2. Employees with Salary Above Number
DELIMITER && 
CREATE PROCEDURE usp_get_employees_salary_above (desired_salary DECIMAL(19,4))
BEGIN
  SELECT `first_name`, `last_name` 
  FROM `employees`
  WHERE `salary` >= `desired_salary`
  order by `first_name`, `last_name`, `employee_id`;
END &&  
DELIMITER ;

#3. Town Names Starting With
DELIMITER && 
CREATE PROCEDURE usp_get_towns_starting_with (town_substring VARCHAR(50))
BEGIN
  SELECT `name` 
  FROM `towns`
  WHERE `name` like CONCAT(town_substring,'%')
  # WHERE LEFT (`name`, LENGTH(`starts_with`)) = `starts_with`
  order by `name`;
END &&  
DELIMITER ;



