-- 116. CHECK constraint - Add, Rename, Drop on existing table

-- Define check constraint for existing tables

CREATE TABLE price(
	price_id SERIAL PRIMARY KEY,
	product_id INT NOT NULL,
	price NUMERIC NOT NULL,
	discount NUMERIC NOT NULL,
	valid_from DATE NOT NULL
);

-- PRICE > 0 and discount >=0 and price > discount

ALTER TABLE price
ADD CONSTRAINT price_check
CHECK (
	price > 0
	AND discount >= 0
	AND price > discount
);

SELECT * FROM price;

-- lets add some records
INSERT INTO price (product_id, price, discount, valid_from)
VALUES ('2',100,20,'2025-01-01');

-- lets add wrong check record to the table
INSERT INTO price (product_id, price, discount, valid_from)
VALUES ('2',-100,20,'2025-01-01');


-- Rename constraint on new table

ALTER TABLE price
RENAME CONSTRAINT price_check TO price_discount_check


-- Drop a constraint

ALTER TABLE price
DROP CONSTRAINT price_discount_check;

-- Add new constraint
ALTER TABLE price
ADD CONSTRAINT price_check
CHECK (
	price > 0
	AND discount <= 0.33 * price 
	AND price > discount

	);
-- lets add some records
INSERT INTO price (product_id, price, discount, valid_from)
VALUES ('2',100,34,'2025-01-01');

SELECT * FROM price;