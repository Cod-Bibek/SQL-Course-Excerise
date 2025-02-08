--35 Select all data from a table
-- ################################
/* 
SELECT * FROM tablename;
*/

--1 . Get all records from movies table

SELECT * from movies;

-- 2. Get all records from actors tbale

SELECT * FROM actors;


-- 3. Note that the SQL keywords are case - insensative.

-- 4. Is it a good practice to use * in SELECT?
--  nO. It is not . Because;
-- 4.1 Database performance - Using * in a tbale with lots of columns might affect database performance
-- 4.2 Application performance - Retreving unnecessary data from the database increases the traffic
--     Between the database server and application server will slow down the application performance.

-- So Use * wisely!!!

-- Use explicit column names in SELECT statement

/* 
SELECT column1, column2 from tablename
*/

SELECT first_name FROM actors;


SELECT first_name, last_name FROM actors;


-- Different Table

SELECT movie_name, movie_lang FROM movies;


-- 37. Adding Aliases to columns in a table
--- Basically Adding Aliases help understand database to  non-technical person 

SELECT first_name AS firstname from actors;


SELECT first_name AS "firstName" FROM actors;

--- Column aliases that contain spaces , we will use quotes.

SELECT first_name AS "First Name" FROM actors;

SELECT 
	movie_name AS "Movie Name",
	movie_lang AS "language"
FROM movies;

--We can use Alias method with our AS - 'AS' is optional

SELECT 
	movie_name "Movie Name",
	movie_lang "language"
FROM movies;


-- 38. Using SELECT statement for expressions
SELECT first_name || last_name FROM actors;

-- Using Alias on Concat column
SELECT 
	first_name || ' ' || last_name AS "Full Name" 
FROM actors;


-- 39. Using ORDERBY to sort records

SELECT 
	release_date,
	movie_name

FROM movies
ORDER BY 
	release_date DESC;
	
SELECT 
	movie_name,
	release_date
FROM movies
ORDER BY
	release_date DESC,
	movie_name DESC;

-- 40. Using ORDER BY with alias column name

-- With column name
SELECT 
	first_name, 
	last_name AS surname
from actors
ORDER BY last_name DESC;

-- with alias
SELECT 
	first_name, 
	last_name AS surname
from actors
ORDER BY surname DESC;


-- 41. Using ORDER BY to sort rows by experssions

SELECT 
	first_name,
	LENGTH(first_name) as len
FROM actors
ORDER BY 
	len DESC;


-- 42. Using ORDER BY with column name or column number

-- With column name
SELECT 
	first_name,
	last_name,
	date_of_birth
FROM actors
ORDER BY 
	first_name ASC,
	date_of_birth DESC;

-- With column number

SELECT 
	first_name,
	last_name,
	date_of_birth
FROM actors
ORDER BY 
	1 ASC,
	3 DESC;

-- 43. Using ORDER BY with NULL values
-- Create Demo sorting table
CREATE TABLE demo_sorting (
	num INT
);

-- INSERT VALUES
INSERT INTO demo_sorting (num)
VALUES
(1),
(2),
(3),
(NULL);

-- Get all records from demo_sorting, sort num on ascending values

SELECT * FROM demo_sorting ORDER BY num ASC;

-- ORDER BY using NULLS LAST

SELECT * FROM demo_sorting ORDER BY num NULLS LAST;

-- ORDER BY using NULLS FIRST

SELECT * FROM demo_sorting ORDER BY num NULLS FIRST;

DROP TABLE demo_sorting;

-- 44. Using DISTINCT for selecting distinct values

SELECT * FROM movies;

SELECT 
	movie_lang
FROM movies;

SELECT DISTINCT 
	movie_lang
FROM movies
ORDER BY movie_lang DESC;

SELECT 
	DISTINCT movie_lang, 
	director_id
FROM movies
ORDER BY 1;

SELECT  DISTINCT * FROM movies;