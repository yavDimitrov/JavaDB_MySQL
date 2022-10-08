#01 1. Mountains and Peaks
USE `test`;

CREATE TABLE `mountains` (
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(45) NOT NULL
);

CREATE TABLE `peaks` (
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(45) NOT NULL,
`mountain_id` INT NOT NULL,
CONSTRAINT fk_peaks_mountains
FOREIGN KEY (`mountain_id`)
REFERENCES `mountains`(`id`)
);

#02. Trip Organization

USE `camp`;

SELECT
 v.`driver_id`,
 v.`vehicle_type`,
 CONCAT(c.first_name, ' ', c.last_name) AS 'driver_name'
 FROM `vehicles` AS v
JOIN
`campers` AS c ON v.driver_id = c.id;

#3. SoftUni Hiking
	SELECT r.starting_point AS 'route_starting_point',
			r.end_point AS 'route_ending_point',
            r.leader_id,
            CONCAT(c.first_name, ' ', c.last_name) AS 'leader_name'
            FROM 
            routes AS r
			JOIN
			campers AS c ON r.leader_id = c.id;
    
    
    
    




