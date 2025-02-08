-- PRIMARY KEY CONSTRAINT on multiple columns = Composite PRIMARY KEY


CREATE TABLE t_grades (
	course_id VARCHAR(100) NOT NULL,
	student_id VARCHAR(100) NOT NULL,
	grade int NOT NULL

);

SELECT * FROM t_grades;
INSERT INTO t_grades (course_id, student_id, grade) VALUES
('MATH','S1',50),
('CHEMISTRY','S1',70),
('ENGLISH','S2',70),
('PHYSICS','S1',80);

-- LETS add one more record
INSERT INTO t_grades (course_id, student_id, grade) VALUES
('MATH','S2',70);

-- COMPOSITE KEY COMES INTO PLAY AS WE DO NOT HAVE ANY UNIQUE COLUMN FOR EACH RECORD

DROP TABLE t_grades;

-- lets create a same table with composite key
CREATE TABLE t_grades (
	course_id VARCHAR(100) NOT NULL,
	student_id VARCHAR(100) NOT NULL,
	grade int NOT NULL,
	PRIMARY KEY (course_id,student_id)

);

-- lets view our table
SELECT * FROM t_grades;

-- lets add records
INSERT INTO t_grades (course_id, student_id, grade) VALUES
('MATH','S1',50),
('CHEMISTRY','S1',70),
('ENGLISH','S2',70),
('PHYSICS','S1',80);


-- drop a primary key

ALTER TABLE tablename
DROP CONSTRAINT cname;

ALTER TABLE t_grades
DROP CONSTRAINT t_grades_pkey;

-- add primary key in existing table
-- syntax
ALETR TABLE tablename
	ADD CONSTRAINT cname
		PRIMARY KEY(col1,col2,....)

ALTER TABLE t_grades
	ADD CONSTRAINT t_grades_pkey
		PRIMARY KEY(course_id,student_id)