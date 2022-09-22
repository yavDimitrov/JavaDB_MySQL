USE `exercise`;

CREATE TABLE `users` (
`id` INT PRIMARY KEY AUTO_INCREMENT,
`username` VARCHAR(30) NOT NULL,
`password` VARCHAR(26) NOT NULL,
`profile_picture` BLOB,
`last_login_time` TIME,
`is_deleted` BOOLEAN
); 

INSERT INTO `users` (`username`, `password`)
VALUES ("PESHO1233", "1234"),
		("ivan32", "gotinsam"),
        ("test", "test123"),
        ("Didi", "sasa"),
        ("gogo", "zumba");
