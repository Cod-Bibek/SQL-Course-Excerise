-- 105. DEFAULT constraint

-- 1. Set a default value of a column on a new table
-- <column> DEFAULT <value>

CREATE TABLE employees (
	employee_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	is_enable VARCHAR(2)
);

SELECT * FROM employees;

INSERT INTO employees ( first_name, last_name) VALUES ('JOHN1','ADAM1');

ALTER TABLE employees
ALTER COLUMN is_enable SET DEFAULT 'N'


ALTER TABLE employees
ALTER COLUMN is_enable SET DEFAULT NULL;

INSERT INTO employees ( first_name, last_name) VALUES ('JOHN2','ADAM2');