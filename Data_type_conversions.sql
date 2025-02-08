-- Types of data tyoe conversion

-- Two type of conversions
/*  
	Implict   data conversion is done AUTOMATICALLY

	Explict   data conversion is done via 'conversion functions' e.g CAST or ::

*/

-- Types of examples

SELECT * FROM movies;

-- integer == integer

SELECT * FROM movies
WHERE movie_id = 1 ---- same data type, so NO conversion

SELECT * FROM movies
WHERE movie_id = '1' -- PostgresSQL automatically do the conversion here i.e Implict conversion

-- What if we want to use Explict conversion?

SELECT * FROM movies
WHERE movie_id = integer '1'


-- 80. Using CAST for data conversions

CAST (expression AS target_data_type);

-- String to integer conversion

SELECT 
	CAST ('10' AS INTEGER);

SELECT 
	CAST ('10n' AS INTEGER); -- error 'n'

-- String to date conversion
SELECT 
	CAST('2020-01-01' AS DATE),
	CAST('01-MAY-20' AS DATE);


-- String to timestamp

SELECT '2020-02-20 10:30:25.467'::TIMESTAMP



-- String to timestamp WITH timezone

SELECT '2020-02-20 10:30:25.467'::TIMESTAMPTZ





-- 81. Implicit to Explict conversions

-- Using integer and factorial
SELECT 20 ! AS "result";


SELECT 20!;

SELECT CAST (20 AS bigint)! AS "result";



SELECT ROUND(CAST(10 AS NUMERIC),4) AS "result";

-- CAST with text
SELECT
	SUBSTR('123456',3) AS "Implict",
	SUBSTR(CAST('123456'AS TEXT),3) AS "Explicit";



-- Table dat conversion
CREATE TABLE rating(
	rating_id SERIAL PRIMARY KEY,
	rating VARCHAR(1) NOT NULL
);

SELECT * FROM rating;

INSERT INTO rating(rating) VALUES
('A'),
('B'),
('C'),
('D');

INSERT INTO rating(rating) VALUES
('1'),
('2'),
('3'),
('4');


SELECT 
	rating_id,
	CASE
		WHEN rating~E'^\\d+$' THEN
			CAST (rating AS INTEGER)
		ELSE
			0
		END AS rating
FROM
	rating;
	
