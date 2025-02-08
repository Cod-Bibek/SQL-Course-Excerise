-- 48. Combining AND, OR, operators

-- Get all English OR Chinese movies AND movies with age_certificate equal to 12

SELECT * FROM movies; 

SELECT 
	movie_name,
	movie_lang, 
	age_certificate
FROM movies
WHERE
	(
	movie_lang = 'English'
	OR 
	movie_lang = 'Chinese'
	)
	AND
	age_certificate = '12'
ORDER BY movie_lang DESC;



-- 49. What goes before and after WHERE clause
---    WHERE clause always goes after FROM
---    ORDER BY clause always goes after WHERE clause



-- 50. Execution order with AND,OR operators
--     AND execuation first unless we have parenthesis.

-- 51. Can we use column aliases with WHERE? -- NO

SELECT 
	first_name,
	last_name AS surname
FROM actors
WHERE 
	last_name = 'Allen';


SELECT 
	first_name,
	last_name AS surname
FROM actors
WHERE
	surname = 'Allen'; -- column "surname" does not exist


-- 52. Order of Execution of WHERE, SELECT and ORDER BY clauses

-- FROM -> WHERE -> SELECT -> ORDER BY

-- 53. Using Logical operators

-- Get all movies where movie length is less than or equal to  150 and greater than or equal to 100.

SELECT 
	movie_name,
	movie_length
FROM movies
WHERE 
	movie_length <= 150 AND movie_length >= 100
ORDER BY movie_length DESC;


-- Get all movies where release date is greater then 2000

SELECT  
	movie_name,
	movie_length,
	release_date
FROM movies
WHERE 
	release_date > '1999-12-31'
ORDER BY 
	release_date;



-- 54. Using LIMIT and OFFSET
-- Get the top 5 biggegst movies by movie length

SELECT 
	movie_name,
	movie_length
FROM movies
ORDER BY 
	movie_length DESC
limit 5;

-- Get the top 5 oldest america directors
SELECT * FROM directors;

SELECT 
	first_name || ' ' || 'last_name' AS full_name,
	date_of_birth,
	nationality
FROM directors
WHERE nationality = 'American'
ORDER BY date_of_birth
limit 5;

-- Get the top 10 youngest female actors

SELECT * FROM actors;

SELECT 
	first_name || ' ' || last_name AS full_name,
	gender,
	date_of_birth
FROM actors
WHERE 
	gender = 'F'
ORDER BY
	date_of_birth DESC
LIMIT 5;

-- Get the top 10 most domestic profitable movies

SELECT * FROM movies_revenues;


SELECT 
	movie_id,
	revenues_domestic
FROM movies_revenues
ORDER BY
	revenues_domestic DESC NULLS LAST
LIMIT 10;

-- Get the top 10 least domestic profitable movies

SELECT 
	movie_id,
	revenues_domestic
FROM movies_revenues
ORDER BY
	revenues_domestic NULLS LAST
LIMIT 10;


-- Using OFFSET
-- limit number OFFSET fromnumber


--6. List 5 flims starting from the fourth one ordered by movie_id

SELECT 
	movie_id,
	movie_name
FROM movies
ORDER BY
	movie_id
LIMIT 10 OFFSET 3;


-- 7. List all top 5 movies after the top 5 highest profits movies

SELECT 
	movie_id,
	revenues_domestic
FROM movies_revenues
ORDER BY 
	revenues_domestic DESC NULLS LAST
LIMIT 5 OFFSET 5;



-- Using FETCH

SELECT * FROM movies
FETCH  FIRST 5 ROW ONLY


-- 2. Get the top 5 biggest movies by movie length

SELECT 
	movie_name,
	movie_length
FROM movies
ORDER BY movie_length DESC NULLS LAST
FETCH FIRST 5 ROW ONLY;


-- 3. Get the top 5 oldest american directors

SELECT * FROM directors

SELECT 
	first_name || ' ' || last_name AS full_name,
	date_of_birth,
	nationality
FROM directors
WHERE
	nationality ='American'
ORDER BY 
	date_of_birth DESC NULLS LAST
FETCH FIRST 5 ROW ONLY;



-- Get the top 10 youngest female actors

SELECT * FROM actors;

SELECT 
	first_name || ' ' || last_name AS full_name,
	gender,
	date_of_birth
FROM actors
WHERE 
	gender = 'F'
ORDER BY 
	date_of_birth DESC NULLS LAST
FETCH FIRST 10 ROW ONLY;


-- Get first 5 movies from the 5th record onwards by long movie length

SELECT * FROM movies;

SELECT 
	movie_name,
	movie_length
FROM movies
ORDER BY 
	movie_length DESC 
FETCH  FIRST 5 ROW ONLY
OFFSET 5;


-- 56. Using IN, NOT IN

SELECT 
	movie_name,
	movie_lang
FROM movies
WHERE 
	movie_lang IN ('English','Chinese','Japanese')
ORDER BY 
	movie_lang;

-- Get all movies where age certification is 12 and PG type

SELECT * FROM movies;


SELECT 
	movie_name,
	age_certificate
FROM movies
WHERE 
	age_certificate IN('12','PG')
ORDER BY 
	movie_name;


--  Get all actors where actor_id is not 1,2,3,4

SELECT * FROM actors;


SELECT 
	actor_id,
	first_name || ' ' || last_name AS full_name
FROM actors
WHERE 
	actor_id NOT IN (1,2,3,4);

-- Using BETWEEN and NOT BETWEEN

-- Get all actors where birth_date between 1991 and 1995

SELECT 
*
FROM actors
WHERE
	date_of_birth BETWEEN '1991-01-01' AND '1995-12-31'
ORDER BY 
	date_of_birth;

-- Get all movies released between 1998 and 2002

SELECT 
*
FROM movies
WHERE 
	release_date BETWEEN '1998-01-01' AND '2002-12-31'
ORDER BY 
	release_date DESC;



-- Using LIKE and ILIKE

-- %  Percent ssign (%) matches any sequence of zero or more characters
-- _  Underscore sign (_) matches any single character

-- Full character search
SELECT 'HELLO' LIKE 'HELLO';

-- Partial character search using '%'
SELECT 'hello' LIKE '%ll';

-- Partial character search using '_'
SELECT 'hello' LIKE '__ll_'


-- Get all actors names where first name starting with 'A'

SELECT 
	first_name
FROM actors
WHERE 
	first_name LIKE 'A%'
ORDER BY
	first_name;


-- Get all actors names where first name ends with 'a'

SELECT 
	last_name
FROM actors
WHERE 
	last_name LIKE '%a'
ORDER BY
	last_name;

-- Get all actors names where first name with 5 charcaters only

SELECT 
	first_name
FROM actors
WHERE
	first_name LIKE '_____'
ORDER BY 
	first_name;

-- Get all actors names where first name contains 'l' on the second place

SELECT 
	first_name
FROM actors
WHERE
	first_name LIKE '_l%'
ORDER BY
	first_name;

-- Get record from actors where actor name is 'Tim'

SELECT 
	first_name
FROM actors
WHERE first_name LIKE 'Tim';

-- Get record from actors where actor name is 'tim'
SELECT 
	first_name
FROM actors
WHERE first_name LIKE 'tim';


--USE ILIKE for case Insensitive
SELECT 
	first_name
FROM actors
WHERE first_name ILIKE 'tim';


-- Using IS NULL and IS NOT NULL keywords

-- Find list of actors with missing birth date

SELECT
	date_of_birth
FROM actors
WHERE 
	date_of_birth NOT NULL
ORDER BY
	date_of_birth;

-- Find list of actors with missing birth date or missing first name

SELECT 
	first_name,
	date_of_birth
FROM actors
WHERE 
	first_name IS NULL 
	OR 
	date_of_birth IS NULL;


-- Find list of movies where domestic revenues is NULL

SELECT
	movie_id,
	revenues_domestic
FROM movies_revenues
WHERE 
	revenues_domestic IS NULL;


-- Get list of movies where either domestic or international revenues is NULL

SELECT 
	movie_id,
	revenues_domestic,
	revenues_international
FROM movies_revenues
WHERE
	revenues_domestic IS NULL
	OR
	revenues_international IS NULL;


-- Get list of movies where either domestic and international revenues are NULL

SELECT 
	movie_id,
	revenues_domestic,
	revenues_international
FROM movies_revenues
WHERE
	revenues_domestic IS NULL
	AND
	revenues_international IS NULL;

-- Concatenation techniques

-- Lets combine string 'Hello' and 'World'

SELECT 'Hello' || 'World' as new_string;

SELECT 'Hello' ||' '|| 'World' as new_string;


-- Lets combine actor first and last names as 'Actor Name'

SELECT 
	first_name,
	last_name,
	first_name || ' '||last_name
FROM actors

SELECT 
	first_name,
	last_name,
	CONCAT(first_name,' ', last_name) AS full_name
FROM actors

-- let print first_name, last_name, date_of_birth of all actors separator by comma

SELECT 
	first_name,
	last_name,
	CONCAT_WS( ',',first_name, last_name, date_of_birth) AS actor_details
FROM actors


-- Concatenation with ||, CONCAT and CONCAT_WS

SELECT * FROM movies_revenues;

SELECT
	revenues_domestic,
	revenues_international,
	CONCAT_WS(' | ', revenues_domestic,revenues_international) AS revenues_details
FROM movies_revenues;