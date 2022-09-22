CREATE DATABASE `exercise`;


USE `exercise`;
CREATE TABLE `people` (
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(200) NOT NULL,
`picture` BLOB,
`height` DOUBLE(10, 2),
`weight` DOUBLE(10, 2),
`gender` CHAR(1) NOT NULL,
`birthdate` DATE NOT NULL,
`biography` TEXT
);

USE `exercise`;
INSERT INTO `people` (`name`, `gender`, `birthdate`)
	VALUES ("Boris", 'm', DATE(NOW())),
			("Alexander", 'm', DATE(NOW())),
            ("Dancho", 'm', DATE(NOW())),
            ("Peter", 'm', DATE(NOW())),
            ("Desi", 'f', DATE(NOW()));