-- Lets create a sample table table_nn

CREATE TABLE table_nn(
	id SERIAL PRIMARY KEY,
	tag TEXT NOT NULL
);

-- lets view the data

SELECT * FROM table_nn;

-- Now lets try to insert some data

INSERT INTO table_nn (tag) VALUES
('ADAM');
INSERT INTO table_nn (tag) VALUES
(NULL);
INSERT INTO table_nn (tag) VALUES
('');
INSERT INTO table_nn (tag) VALUES
('0');


-- Adding NOT NULL constraints to an existing table
-- First create a new table without the NOT NULL CONSTRAINTS
CREATE TABLE table_nn2(
	id SERIAL PRIMARY KEY,
	tag2 TEXT
);

ALTER TABLE table_name
ALTER COLUMN column_name SET .....

ALTER TABLE table_nn2
ALTER COLUMN tag2 SET NOT NULL;

-- lets try to insert some data in table  table_nn2
INSERT INTO table_nn2 (tag2) VALUES
('ADAM');
INSERT INTO table_nn2 (tag2) VALUES
(NULL);
INSERT INTO table_nn2 (tag2) VALUES
('');
INSERT INTO table_nn2 (tag2) VALUES
('0');

-- lets check table
SELECT * FROM table_nn2;
