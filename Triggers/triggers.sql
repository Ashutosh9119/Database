
CREATE FUNCTION
CREATE TRIGGER

INSERT 0 1
 product_id | product_name |                      product_description                      |  price  |         created_at         |         updated_at         
------------+--------------+---------------------------------------------------------------+---------+----------------------------+----------------------------
          1 | Laptop       | A high-performance laptop for gaming and productivity.        | 1200.00 | 2025-01-16 15:08:03.379273 | 2025-01-16 15:08:03.379273
          2 | Smartphone   | A sleek and powerful smartphone with a stunning camera.       |  799.99 | 2025-01-16 15:08:03.379273 | 2025-01-16 15:08:03.379273
          3 | Headphones   | Noise-canceling headphones with deep bass for music lovers.   |  150.00 | 2025-01-16 15:08:03.379273 | 2025-01-16 15:08:03.379273
          4 | Smartwatch   | A smartwatch with fitness tracking and heart-rate monitoring. |  250.00 | 2025-01-16 15:08:03.379273 | 2025-01-16 15:08:03.379273
          5 | Tablet       | A versatile tablet for work and play, with a large screen.    |  450.00 | 2025-01-16 15:08:03.379273 | 2025-01-16 15:08:03.379273
          6 | Laptop       | A high-performance laptop                                     | 1200.00 | 2025-01-16 15:12:40.936636 | 2025-01-16 15:12:40.936636
(6 rows)

UPDATE 2

-- select product_name,created_at,updated_at from products ORDER BY updated_at DESC LIMIT 2;

product_name  |         created_at         |         updated_at         
---------------+----------------------------+----------------------------
 Gaming Laptop | 2025-01-16 15:08:03.379273 | 2025-01-16 15:13:21.554423
 Gaming Laptop | 2025-01-16 15:12:40.936636 | 2025-01-16 15:13:21.554423
(2 rows)



















-- -- Step 1: Add created_at and updated_at columns to the products table
-- ALTER TABLE products
-- ADD COLUMN created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
-- ADD COLUMN updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

-- -- Step 2: Create the trigger function
-- CREATE OR REPLACE FUNCTION update_updated_at_column()
-- RETURNS TRIGGER AS $$
-- BEGIN
--     NEW.updated_at = CURRENT_TIMESTAMP;
--     RETURN NEW;
-- END;
-- $$ LANGUAGE plpgsql;

-- -- Step 3: Create the trigger
-- CREATE TRIGGER trg_update_updated_at
-- BEFORE UPDATE ON products
-- FOR EACH ROW
-- EXECUTE FUNCTION update_updated_at_column();

-- -- Step 4: Test the setup
-- -- Insert a product
-- INSERT INTO products (product_name, product_description, price)
-- VALUES ('Laptop', 'A high-performance laptop', 1200.00);

-- -- Update the product
-- UPDATE products
-- SET product_name = 'Gaming Laptop'
-- WHERE product_name = 'Laptop';

-- -- Verify the changes
-- SELECT * FROM products;
