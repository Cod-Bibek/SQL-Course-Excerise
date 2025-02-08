-- 115. CHECK constraint - Add to new table

-- PostgreSQL constraint : CHECK
-- Define CHECK constraint for new tbales

CREATE TABLE staff (
	staff_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	birth_date DATE CHECK (birth_date > '1900-01-01'),
	joined_date DATE CHECK (joined_date > birth_date),
	salary NUMERIC CHECK (salary > 0 )
);



SELECT * FROM staff;



INSERT INTO staff (first_name, last_name, birth_date, joined_date, salary)
VALUES ('ADAM','KING','1999-01-01','2020-10-10',100000);


-- lets add more record

INSERT INTO staff (first_name, last_name, birth_date, joined_date, salary)
VALUES ('ADAM','KING','1999-01-01','1999-01-02',200000);

INSERT INTO staff (first_name, last_name, birth_date, joined_date, salary)
VALUES ('ADAM2','KING2','1999-01-01','2022-01-02',120000);


-- error format   {table}_{column}_check