#By error 1140, we can use only grouped by or aggregated colomns in a querry

SELECT @@sql_mode;

SET sql_mode = 'ONLY_FULL_GROUP_BY';

#EXAM

CREATE SCHEMA fsd;

USE fsd;

CREATE TABLE `countries` (
`id` INT AUTO_INCREMENT PRIMARY KEY,
`name` VARCHAR(45) NOT NULL
);

CREATE TABLE `towns` (
`id` INT AUTO_INCREMENT PRIMARY KEY,
`name` VARCHAR(45) NOT NULL,
`country_id` INT  NOT NULL,
CONSTRAINT fk_T_countries
FOREIGN KEY (`country_id`)
REFERENCES `countries`(`id`)
);   

CREATE TABLE `stadiums` (
`id` INT AUTO_INCREMENT PRIMARY KEY,
`name` VARCHAR(45) NOT NULL,
`capacity` INT  NOT NULL,
`town_id` INT  NOT NULL,
CONSTRAINT fk_stadiums_town
FOREIGN KEY (`town_id`)
REFERENCES `towns`(`id`)
); 

CREATE TABLE `teams` (
`id` INT AUTO_INCREMENT PRIMARY KEY,
`name` VARCHAR(45) NOT NULL,
`established` DATE  NOT NULL,
`fan_base` BIGINT  NOT NULL DEFAULT 0,
`stadium_id` INT  NOT NULL,
CONSTRAINT fk_teams_stadiums
FOREIGN KEY (`stadium_id`)
REFERENCES `stadiums`(`id`)
);  



 