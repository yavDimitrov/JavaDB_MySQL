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

