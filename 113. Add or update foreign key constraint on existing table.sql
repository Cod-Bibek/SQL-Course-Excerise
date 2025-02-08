-- 113. Add or update foreign key constraint on existing table

-----------

ALTER TABLE tablename
ADD CONSTRAINT cname FOREIGN KEY (columnname) REFERENCES table2_name (columnname);


ALTER TABLE tablename
DROP CONSTRAINT cname;

ALTER TABLE t_products
ADD CONSTRAINT t_products_supplier_id_fkey FOREIGN KEY (supplier_id) REFERENCES t_suppliers (supplier_id);