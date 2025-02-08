-- 109 Tables without foregin key constraints


CREATE TABLE t_products (

	product_id INT PRIMARY KEY,
	product_name VARCHAR(100) NOT NULL,
	supplier_id INT NOT NULL
);


CREATE TABLE t_suppliers (

	supplier_id INT PRIMARY KEY,
	supplier_name VARCHAR(100) NOT NULL
);


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
