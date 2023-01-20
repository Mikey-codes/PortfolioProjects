-- CREATE TABLE contacts (
-- 	name VARCHAR(100) NOT NULL,
--     phone VARCHAR(15) NOT NULL UNIQUE
-- )
-- INSERT INTO contacts (name, phone)
-- VALUES ('billybob', '9781213455');
-- SELECT * FROM contacts
-- CREATE TABLE users (
-- 	username VARCHAR(20) NOT NULL,
--     age INT CHECK (age > 0)
-- )
-- INSERT INTO users (username, age)
-- VALUES ('Ruca', 10)
-- VALUES ('Bill', -1) - ERROR
-- CREATE TABLE palindromes (
--  word VARCHAR(100) CHECK(REVERSE(word) = word)
-- )
-- INSERT INTO palindromes (word)
-- VALUES ('racecar')
-- VALUES ('dad')
-- VALUES ('daddy') - ERROR
-- CREATE TABLE users2 (
-- 	name VARCHAR (50),
--     age INT,
--     CONSTRAINT age_not_negative CHECK (age >= 0)
-- )
-- INSERT INTO users2 (name, age)
-- VALUES ('Ted', 2)
-- VALUES ('Fred', -1) - ERROR W/ Constraint message
-- CREATE TABLE companies (
--     name VARCHAR(255) NOT NULL,
--     address VARCHAR(255) NOT NULL,
--     CONSTRAINT name_address UNIQUE (name, address)
-- )
-- INSERT INTO companies (name, address)
-- 	-- VALUES ('blackbird auto', '123 Spruce')
-- 	-- VALUES ('luigis pies', '123 Spruce')
-- VALUES ('luigis pies', '123 Spruce') -ERROR UNIQUE CONSTRAINT
-- CREATE TABLE houses (
-- 	purchase_price INT NOT NULL,
-- 	sale_price INT NOT NULL,
--     CONSTRAINT sprice_gt_pprice CHECK(sale_price >= purchase_price)
-- )
-- INSERT INTO houses (purchase_price, sale_price) 
-- values (200, 100) - ERROR Constraint message
-- VALUES (100, 200)
-- ALTERING TABLES
-- ALTER TABLE companies
-- ADD city VARCHAR(50)
-- ALTER TABLE companies
-- ADD phone VARCHAR(15)
-- SELECT * FROM companies
-- ALTER TABLE companies
-- ADD employee_count INT NOT NULL
-- ALTER TABLE companies
-- DROP phone
-- DESC companies
-- ALTER TABLE companies
-- DROP employee_count
-- RENAME TABLE companies TO suppliers
-- SELECT * FROM suppliers
-- ALTER TABLE suppliers
-- RENAME COLUMN name TO company_name
-- DESC suppliers
-- ALTER TABLE suppliers 
-- MODIFY company_name VARCHAR(100) DEFAULT 'Unknown'
-- DESC suppliers
-- INSERT INTO suppliers ( address, city) VALUES ('234 1st st', 'Baltimore')
-- SELECT * FROM suppliers
-- SELECT * FROM houses
-- ALTER TABLE houses ADD CONSTRAINT positive_pprice CHECK (purchase_price >=0)
-- SELECT * FROM houses
-- INSERT INTO houses (purchase_price, sale_price) VALUES (-1, 4) -ERROR CONSTRAINT
-- ALTER TABLE houses DROP CONSTRAINT positive_pprice
-- INSERT INTO houses (purchase_price, sale_price) VALUES (-1, 4) - CONSTRAINT dropped not works











