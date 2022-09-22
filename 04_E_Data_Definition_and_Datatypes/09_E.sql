USE `exercise`;

ALTER TABLE `users`
MODIFY COLUMN `last_login_time` DATETIME DEFAULT NOW();

INSERT INTO `users` (`username`, `password`)
values ("DestO", "qazxsw");

ALTER TABLE `users`
MODIFY COLUMN `username` VARCHAR(30) UNIQUE;