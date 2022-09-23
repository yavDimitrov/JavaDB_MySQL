CREATE DATABASE `soft_uni`;

USE `soft_uni`;
CREATE TABLE `towns` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL
);

CREATE TABLE `addresses` (
`id` INT PRIMARY KEY AUTO_INCREMENT,
`address_text` VARCHAR(255) NOT NULL,
`town_id` INT NOT NULL
 
);

CREATE TABLE `departments` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL
);


CREATE TABLE `employees`   (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
 `first_name` VARCHAR(255) NOT NULL,
 `middle_name` VARCHAR(255) NOT NULL,
 `last_name` VARCHAR(255) NOT NULL,
 `job_title` VARCHAR(255) NOT NULL,
 `department_id` INT NOT NULL,
 `hire_date` DATE,
 `salary` DECIMAL,
 `address_id` INT NOT NULL
 );
 
 
 USE `soft_uni`;
 INSERT INTO `towns` (`name`)
 VALUES ("Sofia"), ("Plovdiv"), ("Varna"), ("Burgas");