

-- PostgresSQL Data types

-- 62. Boolen

	
/*  
	TRUE               FALSE
---------             -----------
	TRUE				FALSE
	'true' 				'false'
	't'					'f'
	'y'					'n'
	'yes'				'no'
	'1'					'0'

*/


-- lets create a sample table called 'table_boolen'

CREATE TABLE   table_boolean(
	product_id SERIAL PRIMARY KEY,
	is_available BOOLEAN NOT NULL
	
);

-- Lets insert some data

INSERT INTO table_boolean (is_available) VALUES ('y')

SELECT * FROM table_boolean;



-- lets insert more variable or boolean data

SELECT * FROM table_boolean
WHERE is_available = 'false';


SELECT * FROM table_boolean
WHERE is_available = 'y';

-- Using NOT for conditioons

SELECT * FROM table_boolean
WHERE NOT is_available = 'n';

-- Set defualt values for boolean columns

ALTER TABLE table_boolean
ALTER COLUMN is_available
SET DEFAULT '0';


INSERT INTO table_boolean (product_id) VALUES (13)

SELECT * FROM table_boolean;


-- 63. CHAR, VARCHAR and TEXT
-- CHAR

SELECT CAST('Bibek' AS character(10)) AS "Name";

SELECT 'Bibek'::char(10) as "Name"; --- 'Bibek     '


SELECT 
	CAST('Bibek' AS character(10)) AS "Name",
	'Bibek'::char(10) as "Name1";
	
-- VARCHAR

SELECT 'Adnan'::varchar(10);  -- 10 characters

SELECT 'ABCD 123 $#@%'::VARCHAR(10) -- 10 characters limit -- 'ABCD 123 $'


-- TEXT --- unlimited length(per PostgresSQL it say max approx. 1GB)

-- Lets create a table for all characters

CREATE TABLE table_characters(
	col_char CHAR(10),
	col_varchar VARCHAR(10),
	col_text TEXT
	);

-- lets insert some sample data

INSERT INTO table_characters(col_char,col_varchar,col_text) VALUES
('ABC','ABC','ABC'),
('xyz','xyz','xyz');

SELECT * FROM table_characters;


-- NUMERIC
-- lets create a table with SERAIL data type

CREATE TABLE table_serial(
	product_id SERIAL,
	product_name VARCHAR(100)
)


-- Lets insert some data

INSERT INTO table_serial(product_name) VALUES
('pen');

SELECT * FROM table_serial;

INSERT INTO table_serial(product_name) VALUES
('pencil');

INSERT INTO table_serial(product_name) VALUES
('pencil2');



-- 65 DECIMALS

-- Lets create our number table

CREATE TABLE table_numbers (
	col_numeric numeric(20,5),
	col_real real,
	col_double double precision
);

SELECT * FROM table_numbers;

-- insert some data

INSERT INTO table_numbers (col_numeric, col_real, col_double) VALUES
(.9,.9,.9),
(3.13579,3.13579,3.13579),
(4.135798765462764,4.1357987654625475,4.13579876546372647);


SELECT * FROM table_numbers;

-- real column store 6 after decimal
-- double column store 15 after decimal


-- 66 Selecting Numbers data types

-- Always look at your data range and structures.


-- 67 Date/Time data types

-- Date(date only) , Time(time only), Timestamp(date and time), Timestamptz(date,time, and timestamp)

-- 68 DATE


-- lets create a sample table with a DATE data type column

CREATE TABLE table_dates(
	id serial primary key,
	employee_name varchar(100) NOT NULL,
	hire_date DATE NOT NULL,
	add_date DATE DEFAULT CURRENT_DATE
	
);

-- Lets insert data

INSERT INTO table_dates(employee_name,hire_date) VALUES
('ADAM','2020-01-01'),
('LINDA','2020-02-01');



SELECT * FROM table_dates;

-- Current date and time,

SELECT NOW();

-- TIME
/*
-- Common Formats
	HH:MM
	HH:MM:SS
	HHMMSS

	HH:SS.PPPPPP
	HH:MM:SS.PPPPPP
	HHMMSS.PPPPPP
*/


-- Lets create a sample table
CREATE TABLE table_time(
	id SERIAL PRIMARY KEY,
	class_name VARCHAR(100) NOT NULL,
	start_time TIME NOT NULL,
	end_time TIME NOT NULL

);

-- Insert data into table

INSERT INTO table_time(class_name, start_time, end_time) VALUES
('MATH','08:00:00','09:00:00'),
('CHEMISTRY','09:01:00','10:00:00');

SELECT * FROM table_time;


-- getting current time
SELECT CURRENT_TIME(4) ; -- DEFUALT PRECISION TIME IS 6 DIGITS

--getting local time
SELECT LOCALTIME;

SELECT CURRENT_TIME(4),LOCALTIME(4);


-- Airthematic operations
4:00
10:00

SELECT TIME '10:00' - TIME '04:00' AS result;

-- Using Interval
interval 'n type'
n = number
type = second, minute, hours, day, month, year....
SELECT 
CURRENT_TIME,
CURRENT_TIME + INTERVAL '-2 second' AS result;


-- TIMESTAMP and TIMESTAMPTZ

-- Lets create a table

CREATE TABLE table_time_tz (
	ts TIMESTAMP,
	tstz TIMESTAMPTZ

);

-- Lets set the timezone

INSERT INTO table_time_tz (ts,tstz) VALUES
('2020-02-22 10:10:10-07','2020-02-22 10:10:10-07')

SELECT * FROM table_time_tz;

-- show current timezone

SHOW TIMEZONE;


-- Current timestamp

SELECT CURRENT_TIMESTAMP;

SELECT TIMEOFDAY();


-- Uisng timezone() function to convert time based a time zone

SELECT timezone('Asia/Singapore',CURRENT_TIMESTAMP)
SELECT timezone('America/Chicago',CURRENT_TIMESTAMP)

-- UUID
-- Universal Unique Identifier
-- 32 digits
-- hexadecimal digits
-- separated by hyphens
-- In postgres we need third party uuid algorithms

-- Enable third part UUID extensions first 
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- lets generate a sample UUID value first
SELECT uuid_generate_v1(); -- Version 1 use , computer mac address and current timestamp.
"8e215e7c-a3c7-11ef-a332-bead2f00f83f"
"993ed6c2-a3c7-11ef-a332-bead2f00f83f"

SELECT uuid_generate_v4(); --- Just random id and with uniquness
"a8706c11-69a7-4fc0-ad47-b52b6fd3c448"


-- Lets create a sample table 'table_uuid'

CREATE TABLE table_uuid(
	product_id UUID DEFAULT uuid_generate_v1(),
	product_name VARCHAR(100) not null
);

INSERT INTO table_uuid(product_name) VALUES ('ABC'); --'2b8db7fe-a3c9-11ef-b433-bead2f00f83f'
INSERT INTO table_uuid(product_name) VALUES ('ABC1'); --'3eb631d0-a3c9-11ef-b433-bead2f00f83f'
INSERT INTO table_uuid(product_name) VALUES ('ABC2'); --'408982dc-a3c9-11ef-b433-bead2f00f83f'
SELECT * FROM table_uuid;


-- lets change UUID defualt value
ALTER table table_uuid
ALTER COLUMN product_id
SET DEFAULT uuid_generate_v4();
INSERT INTO table_uuid(product_name) VALUES ('ABC3'); --'58e7c0ea-b22e-42d4-a7be-25d817802b99'
INSERT INTO table_uuid(product_name) VALUES ('ABC4'); --'02521384-3f7d-43ba-ab76-4ce76d86d4eb'
INSERT INTO table_uuid(product_name) VALUES ('ABC5'); --'fd176f5a-da1e-4dc1-ae92-1a38c411d38a'

SELECT * FROM table_uuid;


-- Array

-- lets cretae a sample table

CREATE TABLE table_array(
	id SERIAL,
	name VARCHAR(100),
	phones TEXT[] -- Array
	
);

-- View the data

SELECT * FROM table_array

-- insert some sample data

INSERT INTO table_array (name,phones)
VALUES (
'Adam', ARRAY ['(61)-123-123-1234','(61)-100-199-1000']);
INSERT INTO table_array (name,phones)
VALUES (
'linda', ARRAY ['(61)-123-123-1235','(61)-100-199-1001']
);


-- query data

SELECT * FROM table_array

SELECT
	name,
	phones[1]
FROM 
	Table_array;

-- find values
SELECT
	name
	
FROM 
	Table_array
WHERE 
	phones[1] = '(61)-123-123-1235';


-- 73. hstore
-- key value style: text string only


-- 1. lets install hstore extension first

CREATE EXTENSION IF NOT EXISTS hstore;

-- 2. lets create or sample table

CREATE TABLE table_hstore(
	book_id SERIAL PRIMARY KEY,
	title VARCHAR(100) NOT NULL,
	book_info hstore
);

INSERT INTO table_hstore (title,book_info) VALUES
(
	'TITLE 1',
	'
		"publisher" => "ABC publisher",
		"paper_cost" => "10.00",
		"e_cost" => "5.85"
	'
)
INSERT INTO table_hstore (title,book_info) VALUES
(
	'TITLE 2',
	'
		"publisher" => "ABC publisher2",
		"paper_cost" => "20.00",
		"e_cost" => "15.85"
	'
)
SELECT * FROM table_hstore;

--lets query specific hstore value
-- -> operator

SELECT 
	book_info -> 'publisher' as "publisher",
	book_info -> 'paper_cost' as "Total_cost",
	book_info -> 'e_cost' as "e_cost"
FROM table_hstore;

--74. JSON data type

CREATE TABLE table_json(
	id SERIAL PRIMARY KEY,
	docs JSON
);

INSERT INTO table_json(docs) VALUES
('[1,2,3,4,5,6]'),
('[2,3,4,5,6,7]'),
('{"key":"value"}');

SELECT * FROM table_json;


-- Search specific data in JSON column

SELECT * FROM table_json
WHERE docs @> '2';

ALTER TABLE table_json
ALTER COLUMN docs TYPE JSONB;

CREATE INDEX ON table_json USING GIN(docs jsonb_path_ops);


-- 75. Network Address Data types

--------------------------------------------------

-- Sample table

CREATE TABLE table_netaddr(
	id SERIAL PRIMARY KEY,
	ip INET
);

-- lets insert some data

INSERT INTO table_netaddr(ip) VALUES
('4.35.221.243'),
('4.152.207.126'),
('4.152.207.238'),
('4.249.111.162'),
('12.1.223.132'),
('12.8.192.60');

-- 3. lets view the data
SELECT * FROM table_netaddr;


-- lets analyze entries for /24 networks ip addresses
-- set+masklen function: set netmask length for inet value


--set_masklen(ip,24)

SELECT 
	ip,
	set_masklen(ip,24) AS inet_24
FROM table_netaddr;


-- 5. lets convert inet to cidr type

SELECT 
	ip,
	set_masklen(ip,24) as inet_24,
	set_masklen(ip::cidr,24) as cidr_24
FROM table_netaddr;

-- 6. We can also analyze other network  like /27, /28 too.

SELECT
	ip,
	set_masklen(ip,24) AS inet_24,
	set_masklen(ip::cidr, 24) AS cidr_24,
	set_masklen(ip::cidr ,27) AS cidr_27,
	set_masklen(ip::cidr ,28) AS cidr_28
FROM table_netaddr;


