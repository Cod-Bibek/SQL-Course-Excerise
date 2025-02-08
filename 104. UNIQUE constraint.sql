-- 104. UNIQUE constraints 

-- lets create a sample table

CREATE TABLE table_emails(
	id serial primary key,
	emails text UNIQUE
);

tablename_columnname_key

-- let view the data

SELECT * FROM table_emails;


-- lets insert some unique data int0 the table

INSERT INTO table_emails (emails) VALUES
('A@B.COM');


-- lets try to insert the duplicate record;
INSERT INTO table_emails (emails) VALUES
('A@B.COM');


-- Create UNIQUE key on multiple columns

CREATE TABLE table_products
(
	id SERIAL PRIMARY KEY,
	product_code VARCHAR (10),
	product_name text
);

-- Now create UNIQUE constraints
ALTER TABLE tablename
ADD CONSTRAINT yourname UNIQUE (col1,col2,....)

ALTER TABLE table_products
ADD CONSTRAINT unique_product_code UNIQUE(product_code, product_name);

-- lets insert some data

INSERT INTO table_products (product_code, product_name) VALUES
('A','apple');

SELECT * FROM table_products;

INSERT INTO table_products (product_code, product_name) VALUES
('A1','apple');
INSERT INTO table_products (product_code, product_name) VALUES
('apple','A1');