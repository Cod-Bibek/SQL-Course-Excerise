-- 106. PRIMARY KEY Constraints

/*
	1. uniquely identifies each record in a database table
	2. There can be UNIQUE columns, but only one primary key in a table
	3. A primary key is a field in a table, which uniquely identifies each row/record in a database table
	4. Primary Keys must contain unique values
	5. A table can have only one primary key, which may consist of single or multiple fields

	employees
		employee_id     primary key
		employee_name
	6. When multiple fields are used as a primary key, they are called a composite key
	7. They are same as UNIQUE and NOT NULL

	
*/


-- lets create a table

CREATE TABLE table_items (
	item_id INTEGER PRIMARY KEY,
	item_name VARCHAR(100) NOT NULL
);

-- lets view records
 SELECT * FROM table_items;


-- Lets insert some data

INSERT INTO table_items (item_id, item_name) VALUES
(1,'PEN')

-- lets add same record again..

INSERT INTO table_items (item_id, item_name) VALUES
(1,'PEN')

/* 
ERROR:  Key (item_id)=(1) already exists.duplicate key value violates unique constraint "table_items_pkey" 

ERROR:  duplicate key value violates unique constraint "table_items_pkey"
SQL state: 23505
Detail: Key (item_id)=(1) already exists.
*/


-- HOW TO ADD PRIMARY KEY IN AN EXISTING TABLE

-- DROP a constraint

/* SYNTAX TO DROP A CONSTRAINT
ALTER TABLE tablename 
DROP CONSTRAINT colname;
*/

ALTER TABLE table_items
DROP CONSTRAINT table_items_pkey;


-- ALTER TABLE and add PRIMARY KEY
/* syntax

ALTER TABLE tablename
ADD PRIMARY KEY(COL1,COL2...)

*/

ALTER TABLE table_items
ADD PRIMARY KEY(item_id)

-- DROP CONSTRAINT AGAIN TO ADD PRIMARY KEY ON TWO COLUMNS
ALTER TABLE table_items
DROP CONSTRAINT table_items_pkey;

-- lets add primary key on both columns
ALTER TABLE table_items
ADD PRIMARY KEY(item_id,item_name)

-- Lets view our records
SELECT * FROM table_items;

-- lets add new record into our table table_items

INSERT INTO table_items(item_id,item_name) VALUES
(2,'PENCIL'),
(3,'ERASER'),
(4,'MARKER')

-- lets add more records

INSERT INTO table_items(item_id, item_name) VALUES
(1,'BLUE-PEN'),
(1,'RED-PEN'),
(1,'BLACK-PEN'),
(2,'BROWN-PENCIL'),
(2,'BLACK-PENCIL'),
(3,'GREEN-ERASER'),
(3,'WHITE-ERASER'),
(4,'BLACK-MARKER'),
(4,'RED-MARKER'),
(4,'BLUE-MARKER')

-- Lets view our records again
SELECT * FROM table_items;

-- lets try to insert more records
 INSERT INTO table_items(item_id,item_name) VALUES
 (1,'PEN'),
(2,'PENCIL'),
(3,'ERASER'),
(4,'MARKER')

/* 
error - because records has same values we have in our existing table

ERROR:  Key (item_id, item_name)=(1, PEN) already exists.duplicate key value violates unique constraint "table_items_pkey" 

ERROR:  duplicate key value violates unique constraint "table_items_pkey"
SQL state: 23505
Detail: Key (item_id, item_name)=(1, PEN) already exists.

*/ 