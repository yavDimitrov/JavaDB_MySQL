DROP schema fsd;

CREATE schema fsd;

USE fsd;

CREATE table countries (
`id` INT auto_increment primary key,
`name` VARCHAR(45) NOT NULL
);

CREATE table towns (
`id` INT auto_increment primary key,
`name` VARCHAR(45) NOT NULL,
country_id INT NOT NULL,
CONSTRAINT fk_towns_countries
FOREIGN KEY (country_id)
REFERENCES countries(id)
);

CREATE table players (
id INT auto_increment primary key,
first_name VARCHAR(10) NOT NULL,
last_name VARCHAR(20) NOT NULL,
age INT NOT NULL DEFAULT 0,
position CHAR(1) NOT NULL,
salary DECIMAL(10,2) NOT NULL DEFAULT 0,
hire_date DATETIME,
skills_data_id INT NOT NULL,
team_id INT,
CONSTRAINT fk_p_team
FOREIGN KEY (team_id)
REFERENCES teams(id),
CONSTRAINT fk_p_skills
FOREIGN KEY (skills_data_id)
REFERENCES skills_data(id)
); 
CREATE table stadiums (
id INT auto_increment primary key,
`name` VARCHAR(45) NOT NULL,
capacity INT NOT NULL,
town_id INT NOT NULL,
CONSTRAINT fk_capacity_towns
FOREIGN KEY (town_id)
REFERENCES towns(id)
);

CREATE table teams (
id INT auto_increment primary key,
`name` VARCHAR(45) NOT NULL,
established DATE NOT NULL,
fan_base BIGINT NOT NULL DEFAULT 0,
stadium_id INT NOT NULL,
CONSTRAINT fk_stadiums_team
FOREIGN KEY (stadium_id)
REFERENCES stadiums(id)
);

CREATE table skills_data (
id INT auto_increment primary key,
dribbling INT DEFAULT 0,
pace INT DEFAULT 0,
passing INT DEFAULT 0,
shooting INT DEFAULT 0,
speed INT DEFAULT 0,
strength INT DEFAULT 0
);

CREATE table coaches (
id INT auto_increment primary key,
first_name VARCHAR(10) NOT NULL,
last_name VARCHAR(20) NOT NULL,
salary DECIMAL(10,2) NOT NULL DEFAULT 0,
coach_level INT NOT NULL DEFAULT 0
);

CREATE table players (
id INT auto_increment primary key,
first_name VARCHAR(10) NOT NULL,
last_name VARCHAR(20) NOT NULL,
age INT NOT NULL DEFAULT 0,
position CHAR(1) NOT NULL,
salary DECIMAL(10,2) NOT NULL DEFAULT 0,
hire_date DATETIME,
skills_data_id INT NOT NULL,
team_id INT,
CONSTRAINT fk_p_team
FOREIGN KEY (team_id)
REFERENCES teams(id),
CONSTRAINT fk_p_skills
FOREIGN KEY (skills_data_id)
REFERENCES skills_data(id)
); 

CREATE table players_coaches (
player_id INT,
coach_id INT
); 


