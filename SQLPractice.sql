-- to comment out code 
-- command / 
-- SHOW TABLES;
INSERT INTO cats(name, age)
VALUES ("Garbage", 7),
		("Sr. Scratch A-lot", 3),
        ("Cabbage", 6);
CREATE TABLE people(first_name VARCHAR(20), last_name VARCHAR(20), age INT);
INSERT INTO people(first_name, last_name, age)
VALUES ("Tina", "Belcher", 13),
		("Linda", "Belcher", 45),
        ("Phillip", "Fronde", 38),
        ("Calvin", "Fischoeder", 70);
SELECT * FROM people;
INSERT INTO people(first_name, last_name, age)
VALUES ("Bob", "Belcher", 46);
CREATE TABLE cats2
	(
		name VARCHAR(50) NOT NULL,
        age INT NOT NULL
	);
INSERT INTO cats2(name, age) VALUES ("Bilbo", 111);
INSERT INTO cats2(name, age) VALUES ('Mario\'s Meat Sauce', 18);
CREATE TABLE cats3
	(
		name VARCHAR(50) DEFAULT 'mystery',
        age INT DEFAULT 99
	);
INSERT INTO cats3(age) VALUES (2);
CREATE TABLE cats4  (    
    name VARCHAR(20) NOT NULL DEFAULT 'unnamed',    
    age INT NOT NULL DEFAULT 99 
);
CREATE TABLE unique_cats (
	cat_id INT NOT NULL PRIMARY KEY,
    name VARCHAR(50) DEFAULT 'unknown',
    age INT NOT NULL
    );
SELECT * FROM unique_cats
 INSERT INTO unique_cats(cat_id, name, age)
 VALUES (1, "Bimples", 2);
SELECT * FROM unique_cats
 INSERT INTO unique_cats(cat_id, name, age)
 VALUES (2, "Bumples", 2);
DROP TABLE unique_cats
CREATE TABLE unique_cats (
	cat_id INT,
    name VARCHAR(50),
    age INT,
    PRIMARY KEY (cat_id)
    );
INSERT INTO unique_cats(cat_id, name, age) VALUES (1, 'Bango', 2);
INSERT INTO unique_cats(cat_id, name, age) VALUES (2, 'Bungo', 2);
CREATE TABLE unique_cats2 (
	cat_id INT AUTO_INCREMENT,
    name VARCHAR(50),
    age INT,
    PRIMARY KEY (cat_id)
    );
INSERT INTO unique_cats2(name, age) VALUES ('Pongo', 2);
SELECT * FROM unique_cats2
CREATE TABLE unique_cats3 (
	cat_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    age INT
    );
DESC unique_cats3

-- test
CREATE TABLE employees (
	id INT AUTO_INCREMENT PRIMARY KEY,
    last_name VARCHAR(25) NOT NULL,
    first_name VARCHAR(25) NOT NULL,
    middle_name VARCHAR(25),
    age INT NOT NULL,
    current_status VARCHAR(25) DEFAULT 'Employed' NOT NULL 
    );
DESC employees
INSERT INTO employees (first_name, last_name, age)
	VALUES ('Thomas', 'Chimpanzee', 101);
SELECT * FROM employees
DROP TABLE cats
CREATE TABLE cats
(
	cat_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    breed VARCHAR(100),
    age INT,
    PRIMARY KEY (cat_id)
);
INSERT INTO cats(name, breed, age) 
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);
SELECT name FROM cats
SELECT name, breed FROM cats
SELECT name, breed FROM cats WHERE age=4;
SELECT * FROM cats WHERE name='Egg';
-- Exercise
SELECT cat_id FROM cats
SELECT name, breed FROM cats
SELECT name, age FROM cats WHERE breed='Tabby';
SELECT cat_id, age FROM cats WHERE cat_id = age;
-- Aliases
SELECT cat_id AS id, name FROM cats
Update
SELECT * FROM cats
USE pet_shop;
UPDATE cats SET age=14 WHERE name='Misty';
SELECT * FROM cats
UPDATE cats SET name='Jack' WHERE name='Jackson';
UPDATE cats SET breed='British Shorthair' WHERE name='Ringo';
UPDATE cats SET age=12 WHERE breed='Maine Coon';
DELETE FROM cats WHERE name='Egg';
DELETE FROM cats WHERE age=4;
DELETE FROM cats WHERE age=cat_id;
DELETE FROM cats;
CREATE DATABASE shirts_db;
USE shirts_db
CREATE TABLE shirts
(
		shirt_id INT AUTO_INCREMENT PRIMARY KEY,
    article VARCHAR(25),
    color VARCHAR(25),
    shirt_size VARCHAR(8),
    last_worn INT
);
INSERT INTO shirts (article, color, shirt_size, last_worn)
VALUES
	('t-shirt', 'white', 'S', 10),
	('t-shirt', 'green', 'S', 200),
	('polo shirt', 'black', 'M', 10),
	('tank top', 'blue', 'S', 50),
	('t-shirt', 'pink', 'S', 0),
	('polo shirt', 'red', 'M', 5),
	('tank top', 'white', 'S', 200),
	('tank top', 'blue', 'M', 15);
SELECT * FROM shirts
INSERT INTO shirts (article, color, shirt_size, last_worn)
VALUES ('polo shirt', 'purple', 'M', 50);
SELECT * FROM shirts
SELECT article, color FROM shirts
SELECT article, color, shirt_size, last_worn FROM shirts WHERE shirt_size='M'
UPDATE shirts SET shirt_size='L' WHERE article='polo shirt'
SELECT * FROM shirts
UPDATE shirts SET last_worn=0 WHERE last_worn=15
UPDATE shirts SET shirt_size='XS' WHERE color='white';
UPDATE shirts SET color='off white' WHERE color='white';
DELETE FROM shirts WHERE last_worn=200;
DELETE FROM shirts WHERE article='tank top';
DELETE FROM shirts
DROP TABLE shirts


