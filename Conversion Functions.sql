--  Data type converstions

--- Convert an interger to a string

SELECT 
	release_date,
	TO_CHAR(release_date,'DD-MM-YYYY'),
	TO_CHAR(release_date, 'Dy, MM, YYYY')
FROM movies;


--- Converting timestamp literal to a string

SELECT 
	TO_CHAR(
		TIMESTAMP '2020-01-01 10:30:45',
		'HH24:MI:SS'
	);

-- Adding currency symbol to say movies revenues

SELECT
	movie_id,
	revenues_domestic,
	TO_CHAR(revenues_domestic, '$9999D99')
FROM movies_revenues;


-- TO_NUMBER()
--########################
-- Convert a string to a number

SELECT TO_NUMBER(
	'1420.89',
	'9999.99'
)

SELECT 
	TO_NUMBER(
			'10,625.78-',
			'99G999D99S'
	);

-- formating

SELECT TO_NUMBER(
		'$1,420.64',
		'L9G999.99'
);

SELECT 
	TO_NUMBER(
			'1,234,567.89',
			'9G999G999.99'
	);
SELECT TO_NUMBER('$1,234,567.89', '$999,999,999.99');



-- to_date
SELECT TO_DATE(
	'March 07 2010',
	'Month DD, YYYY'
);


-- Error handling

SELECT TO_DATE(
	'2020/02/29',
	'YYYY/MM/DD'
);


-- 86. to_timestamp

SELECT TO_TIMESTAMP(
	'2020-10-28 10:30:25',
	'YYYY-MM-DD HH:MI:SS'
);
-- It skip spaces

SELECT 
	TO_TIMESTAMP('2020  May','YYYY MON');


-- minimal error checking is done, so be careful

SELECT 
	TO_TIMESTAMP('2020-01-01 23:8:00', 'YYYY-MM-DD HH24:MI:SS');
