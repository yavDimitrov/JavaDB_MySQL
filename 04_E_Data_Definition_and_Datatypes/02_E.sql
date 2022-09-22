USE `minions`;
 
ALTER TABLE `minions`.`town` 
CHANGE COLUMN `town_id` `id` INT NOT NULL AUTO_INCREMENT ;

ALTER TABLE `minions`
ADD COLUMN `town_id` INT NOT NULL,
ADD CONSTRAINT fk_minions_town
FOREIGN KEY (`town_id`)
REFERENCES `towns` (`id`)

