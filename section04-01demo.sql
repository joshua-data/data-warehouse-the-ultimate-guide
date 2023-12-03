-- ==============================================================
-- Create Table: products
-- ==============================================================

-- (1) Create table
CREATE TABLE products (
    product_id VARCHAR(5),
    product_name VARCHAR(100),
    category VARCHAR(50),
    subcategory VARCHAR(50)
);

-- (2) See if your data has been imported on the table.
SELECT * FROM products;

-- ==============================================================
-- Create Dimension Table: categories
-- ==============================================================

-- (1) See what kind of unique categories is in products table.
SELECT
    DISTINCT category
FROM products;

-- (2) Create dimension table
SELECT
    ROW_NUMBER() OVER (ORDER BY category) AS category_id,
    category
INTO categories
FROM (
    SELECT DISTINCT category
    FROM products
) SUB
;

-- (3) See if categories table has been created.
SELECT * FROM categories;