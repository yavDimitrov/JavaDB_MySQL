CREATE DATABASE `exercise`;
USE `exercise`;
CREATE TABLE `people` (
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(200) NOT NULL,
`pivture` BLOB,
`height` DOUBLE(10, 2),
`weight` DOUBLE(10, 2),
`gender` CHAR(1) NOT NULL,
`birthdate` DATE NOT NULL,
`biography` TEXT
);