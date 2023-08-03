CREATE DATABASE softuni_stores_system;

USE softuni_stores_system;

CREATE TABLE towns (
id INT AUTO_INCREMENT PRIMARY KEY,
`name` VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE addresses (
id INT AUTO_INCREMENT PRIMARY KEY,
`name` VARCHAR(50) NOT NULL UNIQUE,
town_id INT NOT NULL,
CONSTRAINT
FOREIGN KEY fk_town_address (town_id)
REFERENCES towns(id)
);

CREATE TABLE stores (
id INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(20) NOT NULL UNIQUE,
rating FLOAT NOT NULL,
has_parking TINYINT(1) DEFAULT 0,
address_id INT NOT NULL,
CONSTRAINT 
FOREIGN KEY fk_sotre_address (address_id)
REFERENCES addresses(id)
);

CREATE TABLE employees(
id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(15) NOT NULL,
middle_name CHAR(1),
last_name VARCHAR(20) NOT NULL,
salary DECIMAL(19,2) DEFAULT 0,
hire_date DATE NOT NULL, 
manager_id INT,
store_id INT NOT NULL,
CONSTRAINT
FOREIGN KEY FK_employee_store (store_id)
REFERENCES stores(id),
CONSTRAINT
FOREIGN KEY SR_employee_manager (manager_id)
REFERENCES employees(id)
);