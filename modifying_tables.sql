-- MORDFING DATA INTO THE TABLES

-- 26.  INSERT DATA INTO A TABLE 
___________________________________________

--1. Create a test table called 'customers' with CREATE TABLE
-- customer_id, first_name, last_name, email, age

CREATE TABLE customers(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(150),
	age INT
	
);


--2. Let view the table data with SELECT 
-- SELECT * FROM tablename

SELECT * FROM customers;

--27. Insert data into a table

/*
INSERT INTO tablename (columnname1, columnname2)
VALUES ('value1', 'value2');
*/

INSERT INTO customers (first_name, last_name, email, age)
VALUES 
('Adnan','Waheed','a@b.com',40)
('Sandeep','Waheb','s@w.com',40),
('John','Adams','j@a.com',37),
('linda','Abe','l@a.com',39);

-- 28. INSERT A DATA WITH QUOTES
---------------------------------------
-- e.g How to add say first_name as 'Bill'O Sullivan' in our customers table

INSERT INTO customers (first_name, last_name, email, age)
VALUES 
('Bill''0','Sullivan','bill''o.sullivan@.com',43);



-- 4. Lets view the 'customers' data with SELECT

SELECT * FROM customers;


-- 29. USE 'RETURNING' to get info on return rows
--------------------------------------------------

-- first see the default behaviour when adding a record into a table

INSERT INTO customers (first_name)
VALUES('John');

-- After the insert , lets returns all rows

INSERT INTO customers (first_name)
VALUES ('Joseph') RETURNING * ;


-- After the insert, lets returns a single column value


INSERT INTO customers (first_name)
VALUES ('James') RETURNING customer_id ;


SELECT * FROM customers;


---- 30. Update data in a table

/*

UPDATE tablename
SET columnname = 'new_value'
WHERE columnname = 'value';

*/

SELECT * FROM customers;
-- Update single column

UPDATE customers
SET last_name = 'Adams'
WHERE customer_id = 3;

UPDATE customers
SET last_name = 'Smith'
WHERE customer_id = 6;


-- Update multiple columns
UPDATE customers
SET 
	last_name = 'Annzari',
	age = 33,
	email = 'joseph@annzari.com'
WHERE customer_id = 7;


--- 31. Updating a row and returning the updated row
--- Use RETURNING TO get updated rows

SELECT * FROM customers;

UPDATE customers
SET 
	email = 'j@.com'
WHERE
	customer_id = 8
RETURNING *;	

--- 32. Updating all records in a table

-- UPDATE ALL RECORDS IN A TABLE

-- update with no WHERE clause

SELECT * FROM customers;

UPDATE customers
SET is_enable = 'Y';


-- 33. Delete data from a table
-------------------------------------

SELECT * FROM customers

--- To delete records based on a condition

DELETE FROM customers
WHERE first_name = 'James';
-- To delete all records

DELETE FROM customers;


-- 34 Using UPSERT
------------------------------
-- ###############
/* 
	1. The idea is that when you insert a new row into the table, PostgreSQL will update the row if it already exixts,
	otherwise, it will insert the new row.

	That is why we call the action is upsert ( the combination of update or insert)

	2.  Synatx

		INSERT INTO tablename (column_list)
		VALUES(value_list)
		ON CONFLICT target action;

	3. for 'action'

		ON CONFLICT

		DO NOTHING                           means do nothing if the row already exists in the table.
		DO UPDATE SET column_ 1 = VALUE_1    update some fields in the table
		WHERE condition

	4. This is similar to INSERT INTO ..... IF NOT EXIST


*/

-- create sample table

CREATE TABLE t_tags(
	id serial PRIMARY KEY,
	tag text UNIQUE,
	update_date TIMESTAMP DEFAULT NOW()
);

-- insert some sample data
INSERT INTO t_tags (tag) values
('Pen'),
('Pencil');


-- Lets view the data
SELECT * FROM t_tags;

-- 2024-11-14 18:31:46.218529

-- Lets insert a record, on conflict do nothing

INSERT INTO t_tags(tag)
VALUES ('Pen')
ON CONFLICT (tag)
DO 
	NOTHING;

-- Lets see if we have any changes
SELECT * FROM t_tags;

-- lets insert a record, on conflict set new values

INSERT INTO t_tags (tag)
VALUES('Pen')
ON CONFLICT(tag)
DO
	UPDATE SET
	tag = EXCLUDED.tag,
	Update_date = NOW();

-- Lets see if we have any changes
SELECT * FROM t_tags;

-- 2024-11-14 18:39:07.980529

-- lets insert a record, on conflict set new values

INSERT INTO t_tags (tag)
VALUES('Pen')
ON CONFLICT(tag)
DO
	UPDATE SET
	tag = EXCLUDED.tag || '1',
	Update_date = NOW();

-- Lets see if we have any changes
SELECT * FROM t_tags;





