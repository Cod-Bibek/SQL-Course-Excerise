-- Modifing Table Structures, Add constarints

-- Creating sample database 'mydatabase', adding columns

CREATE DATABASE mydatabase
	WITH
	OWNER = Postgres
	ENCODING = 'UTF8'
	LC_COLLATE = 'C'
	LC_CTYPE = 'C'
	TABLESPACE = pg_default
	CONNECTION LIMIT = -1;

CREATE TABLE persons(
	person_id SERIAL PRIMARY KEY,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(20) NOT NULL

);

ALTER TABLE persons
ADD COLUMN age INT NOT NULL;


SELECT * FROM persons;

ALTER TABLE persons
ADD COLUMN nationality VARCHAR(20) NOT NULL,
ADD COLUMN email varchar(100) UNIQUE


-- 77 Modify Table Structures, Add/Modify Columns

-- Modify Table Structure
--#########################################


--Rename a table

ALTER TABLE persons 
RENAME TO users;

ALTER TABLE users
RENAME TO persons;


-- Rename a column name

ALTER TABLE persons
RENAME COLUMN age to person_age;

-- Drop a column

ALTER TABLE persons
DROP COLUMN person_age;

SELECT * FROM persons;

ALTER TABLE persons
ADD COLUMN age VARCHAR(10);


-- Change the data type of a column

ALTER TABLE persons
ALTER COLUMN age TYPE INT
USING age::integer;

SELECT * FROM persons;


ALTER TABLE persons
ALTER COLUMN age TYPE VARCHAR(20);

ALTER TABLE persons
ALTER COLUMN age TYPE INT
USING age::integer;


-- Set a defualt values of a column

ALTER TABLE persons
ADD COLUMN is_enable VARCHAR(1);

ALTER TABLE persons
ALTER COLUMN is_enable SET DEFAULT 'Y';


INSERT INTO persons
(
	first_name,
	last_name,
	nationality,
	age
	
)
VALUES
	('Jason','Finch','Australian',29);


-- lets see the record
SELECT * FROM persons;




-- 78. Add constraints to columns
-- #################################


-- Add a UNIQUE contraint to a column

CREATE TABLE web_links(
	link_id SERIAL PRIMARY KEY,
	link_url VARCHAR(255) NOT NULL,
	link_taget VARCHAR(20)
);

SELECT * FROM web_links;

ALTER TABLE web_links
RENAME COLUMN link_taget TO link_target;

INSERT INTO web_links(link_url,link_target) VALUES ('http://www.google.com','_blank');

SELECT * FROM web_links;

ALTER TABLE web_links
ADD CONSTRAINT unique_web_url UNIQUE (link_url);
INSERT INTO web_links(link_url,link_target) VALUES ('http://www.amazon.com','_blank');

-- To set a column to accept only defined allowed/acceptable values

ALTER TABLE web_links
ADD COLUMN is_enable VARCHAR(2);

INSERT INTO web_links(link_url,link_target, is_enable) VALUES ('http://www.netflix.com','_blank', 'Y');

ALTER TABLE web_links
ADD CHECK(is_enable IN ('Y','N'));


INSERT INTO web_links(link_url,link_target, is_enable) VALUES ('http://www.yahoo.com','_blank', 'H'); -- ERROR

INSERT INTO web_links(link_url,link_target, is_enable) VALUES ('http://www.yahoo.com','_blank', 'N');

UPDATE web_links
SET is_enable = 'Y'
WHERE link_id = 1;

SELECT * FROM web_links;

UPDATE web_links
SET is_enable = 'N'
WHERE link_id = 3;