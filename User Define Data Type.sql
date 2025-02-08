-- 87. CREATE DOMAIN - Create a DOMAIN data type, create an address

-- CREATE DOMAIN data type

--- #######################################################

-- SYNTAX:
-- CREATE DOMAIN name AS data_type constraint

CREATE DOMAIN addr VARCHAR(100) NOT NULL

CREATE TABLE locations (
	address addr
);

INSERT INTO locations (address) 
VALUES ('123 london 123 london 123 london 123 london 123 london 123 london 123 london123 london123 london123 london123 london123 london')


SELECT * FROM locations;



-- Example # 4 : 'Positive_numeric' domain with a positive NUMERIC i.e > 0

CREATE DOMAIN positive_numeric INT NOT NULL CHECK (VALUE > 0)

CREATE TABLE sample (
	sample_id SERIAL PRIMARY KEY,
	value_num positive_numeric
);

INSERT INTO sample (value_num) VALUES (10)

SELECT * FROM sample;


-- Example # 5 : 'us_postal_code' domain to check for valid us postal code format

CREATE DOMAIN us_postal_co AS TEXT
CHECK(
	VALUE ~'^\d{5}$'
	OR
	VALUE ~'^D{5}-\d{4}$'
)

CREATE TABLE addresses
(
	address_id SERIAL PRIMARY KEY,
	postal_code us_postal_co
)

INSERT INTO addresses (postal_code) VALUES('10000-1000')

SELECT * FROM addresses;


-- 90 CREATE DOMIAN - Create a domain data type for email validation

CREATE DOMAIN proper_email VARCHAR(150)
CHECK (VALUE ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$')


CREATE TABLE clients_names(
	client_name_id SERIAL PRIMARY KEY,
	email proper_email

)

INSERT INTO clients_names(email)
VALUES('namunaadh@gmail.com')
SELECT * FROM clients_names;

INSERT INTO clients_names(email)
VALUES('namunaadh@gmail. com') --- with spaces
SELECT * FROM clients_names;



-- 91. CREATE DOMAIN - Create a Enum or Set of values domain data type,

CREATE DOMAIN valid_color VARCHAR(10)
CHECK (VALUE IN ('red','blue','green'))

CREATE TABLE colors(
	color valid_color
)

INSERT INTO colors (color) VALUES ('green')

SELECT * FROM colors;

INSERT INTO colors (color) VALUES ('orange')

SELECT * FROM colors;


--- User status

CREATE DOMAIN user_status VARCHAR(10)
CHECK(VALUE IN ('enable','disable','temp'))

CREATE TABLE user_check(
	status user_status
)

INSERT INTO user_check(status)
VALUES('enable');

SELECT * FROM user_check;


--- None selected values

INSERT INTO user_check(status) ---ERROR:  value for domain user_status violates check constraint "user_status_check" 
VALUES('enables');

SELECT * FROM user_check;

--- Get all domain in a schema,

SELECT typname
FROM pg_catalog.pg_type
JOIN pg_catalog.pg_namespace
ON pg_namespace.oid = pg_type.typnamespace
WHERE
typtype = 'd' and nspname = 'public';


-- 93. CREATE DOMAIN. How to drop a domain data type

DROP DOMAIN positive_numeric CASCADE

SELECT * FROM sample


DROP DOMAIN valid_color

SELECT * FROM colors;

-- 94. CREATE TYPE - Create a composite address object

CREATE TYPE address AS (
	city VARCHAR(50),
	country VARCHAR(20)
)
CREATE TABLE companies(
	comp_id SERIAL PRIMARY KEY,
	address address
	
)

INSERT INTO companies (address) VALUES (ROW('LONDON','UK'))
INSERT INTO companies (address) VALUES (ROW('NEW YORK','US'))
INSERT INTO companies (address) VALUES (ROW('SYDNEY','AUS'))

SELECT * FROM companies;
-- (composite_column).field
SELECT (address).city FROM companies;
-- (tablename.composite_column).field
SELECT (companies.address).country FROM companies;



-- 95. CREATE TYPE - Create a composite inventory _item data type

CREATE TYPE inventory_item AS (
	name VARCHAR(100),
	supplier_id INT,
	price NUMERIC
)

CREATE TABLE inventory (
	inventory_id SERIAL PRIMARY KEY,
	item inventory_item
)

SELECT * FROM inventory;

INSERT INTO inventory(item) VALUES (ROW('pen',15,4.99))

SELECT (item).name FROM inventory
WHERE (item).price > 5.99;



-- CREATE TYPE - create an ENUM data type and see how to drop a data type

CREATE TYPE currency AS ENUM ('USD','EUR','GBP')

SELECT 'USD':: currency

ALTER TYPE currency ADD VALUE 'CHF' AFTER 'EUR'

CREATE TABLE stocks
(
	stock_id SERIAL PRIMARY KEY,
	stock_currency currency
	
)

INSERT INTO stocks(stock_currency) VALUES ('CHF')

SELECT * FROM stocks;

-- DROP TYPE name


CREATE TYPE sample_type AS ENUM ('ABC','123')

DROP TYPE sample_type; -- deleting a created types



-- 97. ALTER TYPE - AFTER a composite data type, change schema and more

CREATE TYPE myaddress AS (
	city VARCHAR(50),
	country VARCHAR(50)
)

-- Rename  a data type

ALTER TYPE myaddress RENAME TO my_address


-- change the owner
ALTER TYPE my_address OWNER TO postgres


-- change the schema,

ALTER TYPE my_address SET SCHEMA public


ALTER TYPE my_address ADD ATTRIBUTE street_address VARCHAR (150)


-- 98 ALTER TYPE - Alter an ENUM data type

CREATE TYPE mycolors AS ENUM ('green','red','blue')

ALTER TYPE mycolors RENAME VALUE 'red' TO 'orange'


-- list all ENUM values
SELECT enum_range(NULL::mycolors)


-- to add a new value

ALTER TYPE mycolors ADD VALUE 'purple' AFTER 'green'



-- 99 Update an ENUM data in production server

CREATE TYPE status_enum AS enum ('queued','waiting','running','done')

CREATE TABLE jobs(
	job_id SERIAL PRIMARY KEY,
	job_status status_enum
)
INSERT INTO jobs(job_status) VALUES ('queued')
INSERT INTO jobs(job_status) VALUES ('waiting')
INSERT INTO jobs(job_status) VALUES ('running')
INSERT INTO jobs(job_status) VALUES ('done');

SELECT * FROM jobs;


UPDATE jobs SET job_status = 'running'
WHERE job_status = 'waiting'

ALTER TYPE status_enum RENAME TO status_enum_old

CREATE TYPE status_enum AS enum ('queued','running','done')

ALTER TABLE jobs ALTER COLUMN job_status TYPE status_enum USING job_status::text::status_enum

DROP TYPE status_enum_old


-- 100 An ENUM with a defualt VALUE IN A TABLE

CREATE TYPE status AS ENUM ('PENDING','APPROVED','DECLINED')

CREATE TABLE cron_jobs(
	cron_job_id INT,
	status status DEFAULT 'PENDING'
)

SELECT * FROM cron_jobs;

INSERT INTO cron_jobs (cron_job_id) VALUES (1);
INSERT INTO cron_jobs (cron_job_id) VALUES (2);
INSERT INTO cron_jobs (cron_job_id,status) VALUES (3,'APPROVED');


-- 101. Create a type if not exists using a PL/pgSQL function

DO 
$$
BEGIN
	IF NOT EXISTS (SELECT * 
							FROM pg_type typ
								INNER JOIN pg_namespace nsp
											ON nsp.oid = typ.typnamespace
							WHERE nsp.nspname = current_schema()
									AND typ.typname = 'ai') THEN
	CREATE TYPE ai
				AS (a text,
					i integer);
	END IF;
END;
$$
LANGUAGE plpgsql;