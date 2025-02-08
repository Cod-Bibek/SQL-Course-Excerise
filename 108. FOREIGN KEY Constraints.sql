-- FOREGIN KEY Constraint
-------

/* 
	1. A foregin key is a column or a group of columns in a table that reference the primary key of another table

	2. Parent table 
			Child / Foregin table

	3. Also in general words, foregin key in PostgreSQL is defined as the first table that has reference to the primary key of the second tbale.

	4. CREATE TABLE table_name (
			columnname data_type PRIMARY KEY,
			.....
			.....
			FOREGIN KEY (columnname)  REFRENCES child_table_name (columnname)
			
	);
*/

-- We will create an example where we will show you how to setup a relationship between table storing 'products' information the product 'suppliers'

-- But lets take a look at tables without any foregin keys
----------