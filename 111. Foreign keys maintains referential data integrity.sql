-- 111. Foreign keys maintains referential data integrity

-- SYNTAX
CREATE TABLE table_name (
	columnname data_type PRIMARY KEY,
	.....
	.....
	FOREIGN KEY (columnname) REFRENCES child_table_name (columnname)
);



CREATE TABLE t_products (

	product_id INT PRIMARY KEY,
	product_name VARCHAR(100) NOT NULL,
	supplier_id INT NOT NULL,
	fOREIGN KEY(supplier_id) REFERENCES t_suppliers(supplier_id)
);


CREATE TABLE t_suppliers (

	supplier_id INT PRIMARY KEY,
	supplier_name VARCHAR(100) NOT NULL
);

-- lets add records into our tables - Foreign table first

INSERT INTO t_suppliers(supplier_id,supplier_name) VALUES
(1,'SUPPLIER 1'),
(2,'SUPPLIER 2');

SELECT * FROM t_suppliers

INSERT INTO t_products (product_id, product_name, supplier_id) VALUES
(1,'PEN',1),
(2,'PAPER',2);

SELECT * FROM t_products;

INSERT INTO t_products (product_id, product_name, supplier_id) VALUES
(3,'PENCIL',3);
/*
we will get an error -- because supplier_id 3 is not in supplier table and it violates foregin key constraint


ERROR:  insert or update on table "t_products" violates foreign key constraint "t_products_supplier_id_fkey"
SQL state: 23503
Detail: Key (supplier_id)=(3) is not present in table "t_suppliers".

*/

-- so let add suppier_id 3 in child table first

INSERT INTO t_suppliers(supplier_id,supplier_name) VALUES
(3,'SUPPLIER 3');

-- Now we can add new record for supplier_id 3.
INSERT INTO t_products (product_id, product_name, supplier_id) VALUES
(3,'PENCIL',3);

SELECT * FROM t_products;
SELECT * FROM t_suppliers;


-- Lets try to delete data from the child or foreign table

DELETE FROM t_products WHERE product_id = 3; -- always delete id foreign key on parent table first to delete record from child table.
DELETE FROM t_suppliers WHERE supplier_id = 3;


-- lets try to update a data on parent table

UPDATE t_products
SET supplier_id = 2
WHERE
	product_id = 1;