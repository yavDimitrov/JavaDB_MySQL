#1. One-To-One Relationship
	CREATE DATABASE table_relations;
    USE table_relations;
    
    CREATE TABLE `passports` (
    `passport_id` INT PRIMARY KEY AUTO_INCREMENT,
    `passport_number` VARCHAR(50) UNIQUE
    );
    
    INSERT INTO `passports` (`passport_id`, `passport_number`)
		VALUES
			(101, 'N34FG21B'),
            (102, 'K65LO4R7'),
            (103, 'ZE657QP2');  
            
	CREATE TABLE `people` (
    `person_id` INT PRIMARY KEY AUTO_INCREMENT,
    `first_name` VARCHAR(50) NOT NULL,
    `salary` DECIMAL(9,2),
    `passport_id` INT UNIQUE,
    CONSTRAINT fk_people_passport
    FOREIGN KEY (`passport_id`)
    REFERENCES `passports` (`passport_id`)
    );
    
    INSERT INTO `people` (`first_name`, `salary`, `passport_id`)
		VALUES
			('Roberto', 43300.00, 102),
            ('Tom', 56100.00, 103),
            ('Yana', 60200.00, 101);
            
	#02. One-To-Many Relationship
  CREATE DATABASE `cars`;
  USE `cars`;
	CREATE TABLE `manufacturers` (
    `manufacturers_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL UNIQUE,
    `established_on` DATE
);
    
    INSERT INTO `manufacturers`(`name`, `established_on`)
		VALUES 
			('BMW', '1916/03/01'),
            ('Tesla', '2003/01/01'),
            ('Lada', '1966/05/01');
            
	CREATE TABLE `models` (
    `model_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(70) NOT NULL,
    `manufacturers_id` INT,
    CONSTRAINT fk_models_manufacturers 
    FOREIGN KEY (`manufacturers_id`)
    REFERENCES `manufacturers`(`manufacturers_id`)
);
    
    INSERT INTO `models` (`model_id`, `name`, `manufacturers_id`)
		VALUES
        (101, 'X1', 1),
        (102, 'i6', 1),
        (103,'Model S', 2),
        (104,'Model X', 2),
        (105, 'Model 3', 2),
        (106, 'Nova', 3);
        
	#03. Many-To-Many Relationship
