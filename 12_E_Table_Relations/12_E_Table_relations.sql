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
    CREATE DATABASE `school`;
    USE `school`;
    
    CREATE TABLE `students` (
    `student_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(70) NOT NULL
    );
    
    INSERT INTO `students` (`name`)
			VALUES
				('Mila'),
                ('Toni'),
                ('Ron');
                
                
	CREATE TABLE `exams` (
		`exam_id` INT PRIMARY KEY AUTO_INCREMENT,
        `name` VARCHAR(100) NOT NULL
    );
    
    ALTER TABLE `exams` AUTO_INCREMENT = 101; 
    
    INSERT INTO `exams` (`name`)
    VALUES
		('Spring MVC'),
        ('Neo4j'),
        ('Oracle 11g');
        
	CREATE TABLE `students_exams` (
    `student_id` INT NOT NULL,
    `exam_id` INT NOT NULL,
    
    CONSTRAINT pk
    PRIMARY KEY  (`student_id`, `exam_id`),
    
    CONSTRAINT fk_students
    FOREIGN KEY (`student_id`)
    REFERENCES `students` (`student_id`),
    
    CONSTRAINT fk_exams 
    FOREIGN KEY (`exam_id`)
    REFERENCES `exams` (`exam_id`)
    
    );
    
    INSERT INTO `students_exams` (`student_id`, `exam_id`)
		VALUES
			(1,101),
            (1,102),
            (2,101),
            (3,103),
            (2,102),
            (2,103);
            
            
	#04. Self-Referencing
    
     CREATE DATABASE `self_ref`;
     USE `self_ref`;
     
     CREATE TABLE `teachers` (
     `teacher_id` INT PRIMARY KEY AUTO_INCREMENT,
     `name` VARCHAR(50) NOT NULL,
     `manager_id` INT
     );
     
     ALTER TABLE `teachers` AUTO_INCREMENT = 101;
     
     INSERT INTO `teachers`(`name`, `manager_id`)
		VALUES
			('John', NULL),
            ('Maya', 106),
            ('Silvia', 106),
            ('Ted', 105),
            ('Mark', 101),
            ('Greta', 101);
            
	ALTER TABLE `teachers`
    ADD CONSTRAINT fk
    FOREIGN KEY (`manager_id`)
    REFERENCES `teachers`(`teacher_id`);
    
    #06. University Database
    
    CREATE DATABASE `university`;
    USE `university`;
    
    CREATE TABLE `subjects` (
    `subject_id` INT(11) PRIMARY KEY AUTO_INCREMENT,
    `subject_name` VARCHAR(50)
    );
    
    CREATE TABLE `majors` (
		`major_id` INT(11) PRIMARY KEY AUTO_INCREMENT,
        `name` VARCHAR(50)
    );
    
    CREATE TABLE `payments` (
		`payment_id` INT PRIMARY KEY AUTO_INCREMENT,
        `payment_date` DATE ,
        `payment_amount` DECIMAL (8,2),
        `student_id` INT(11)
    );
    
    CREATE TABLE `students` (
		`student_id` INT(11) PRIMARY KEY AUTO_INCREMENT,
        `student_number` VARCHAR(12)UNIQUE,
        `student_name` VARCHAR(50),
        `major_id` INT(11)
     );


	CREATE TABLE `agenda` (
    `student_id` INT,
    `subject_id` INT,
    CONSTRAINT pk    
    PRIMARY KEY (`student_id`,`subject_id`)
    );
    
    
    ALTER TABLE `payments` 
    ADD CONSTRAINT fk_students
    FOREIGN KEY (`student_id`)
    REFERENCES `students`(`student_id`);
    
    ALTER TABLE `students`
    ADD CONSTRAINT fk_majors
    FOREIGN KEY (`major_id`)
    REFERENCES `majors`(`major_id`);
    
    ALTER TABLE `agenda`
    ADD CONSTRAINT fk_subjects
    FOREIGN KEY (`subject_id`)
    REFERENCES `subjects`(`subject_id`); 
     
	ALTER TABLE `agenda`
    ADD CONSTRAINT fk_students_agenda
    FOREIGN KEY (`student_id`)
    REFERENCES `students`(`student_id`); 
    
    #9
    SELECT m.`mountain_range`, p.`peak_name`, p.`elevation`
FROM `mountains` AS m
JOIN `peaks` AS p
ON p.`mountain_id` = m.`id`
WHERE m.`mountain_range` = "Rila"
ORDER BY p.`elevation` DESC;
    
    
    
    
    
    
