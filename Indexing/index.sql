           
CREATE DATABASE

INSERT 0 5
 customer_id |    name     |          email          |    phone     |     address     
-------------+-------------+-------------------------+--------------+-----------------
           1 | ashutosh      | ashutosh@gmail.com       | 123-323-7890 | 123 mohali
           2 | Jane Smith  | jane.smith@example.com  | 987-654-3210 | 456 Oak Avenue
           3 | Alice Brown | alice.brown@example.com | 555-123-4567 | 789 Pine Lane
           4 | Bob Johnson | bob.johnson@example.com | 222-333-4444 | 101 Maple Drive
           5 | Sangam      | sangam@example.com | 333-444-5555 | 202 Birch Road
(5 rows)


INSERT 0 5
 order_id | customer_id | order_date | order_total 
----------+-------------+------------+-------------
        1 |           1 | 2025-01-01 |      250.00
        2 |           2 | 2025-01-02 |      150.00
        3 |           3 | 2025-01-03 |      300.00
        4 |           1 | 2025-01-04 |      100.00
        5 |           2 | 2025-01-05 |      200.00
(5 rows)


Q1
-- --------------
 customer_id |  name  |       email       |    phone     |  address   
-------------+--------+-------------------+--------------+------------
           1 | ashutosh | ashutosh@gmail.com | 123-323-7890 | 123 mohali
(1 row)

-- EXPLAIN
 QUERY PLAN                                              
-----------------------------------------------------------------------------------------------------
 Seq Scan on customers  (cost=0.00..1.06 rows=1 width=520) (actual time=0.059..0.062 rows=1 loops=1)
   Filter: ((name)::text = 'akshay'::text)
   Rows Removed by Filter: 4
 Planning Time: 0.256 ms
 Execution Time: 0.155 ms
(5 rows)


CREATE INDEX

QUERY PLAN                                                  
-------------------------------------------------------------------------------------------------------------
 Nested Loop  (cost=0.00..2.15 rows=1 width=242) (actual time=0.887..0.887 rows=0 loops=1)
   Join Filter: (c.customer_id = o.customer_id)
   ->  Seq Scan on customers c  (cost=0.00..1.06 rows=1 width=222) (actual time=0.886..0.886 rows=0 loops=1)
         Filter: ((name)::text = 'John Doe'::text)
         Rows Removed by Filter: 5
   ->  Seq Scan on orders o  (cost=0.00..1.06 rows=2 width=28) (never executed)
         Filter: (order_date > '2025-01-01'::date)
 Planning Time: 13.324 ms
 Execution Time: 2.477 ms
(9 rows)


REINDEX
REINDEX


-- EXPLAIN ANALYZE
-- SELECT o.order_id, o.order_date, o.order_total, c.name AS customer_name
-- FROM orders o
-- JOIN customers c ON o.customer_id = c.customer_id
-- WHERE c.name = 'John Doe' AND o.order_date > '2025-01-01';

-- CREATE INDEX idx_customer_name ON customers (name);
-- CREATE INDEX idx_order_date ON orders (order_date);

-- EXPLAIN ANALYZE
-- SELECT o.order_id, o.order_date, o.order_total, c.name AS customer_name
-- FROM orders o
-- JOIN customers c ON o.customer_id = c.customer_id
-- WHERE c.name = 'John Doe' AND o.order_date > '2025-01-01';


--CREATE TABLE
INSERT 0 5

 product_id | product_name |                      product_description                      |  price  
------------+--------------+---------------------------------------------------------------+---------
          1 | Laptop       | A high-performance laptop for gaming and productivity.        | 1200.00
          2 | Smartphone   | A sleek and powerful smartphone with a stunning camera.       |  799.99
          3 | Headphones   | Noise-canceling headphones with deep bass for music lovers.   |  150.00
          4 | Smartwatch   | A smartwatch with fitness tracking and heart-rate monitoring. |  250.00
          5 | Tablet       | A versatile tablet for work and play, with a large screen.    |  450.00
(5 rows)



CREATE INDEX

product_id | product_name |                  product_description                   |    rank     
------------+--------------+--------------------------------------------------------+-------------
          1 | Laptop       | A high-performance laptop for gaming and productivity. | 0.098500855
(1 row)

                                             QUERY PLAN                                             
----------------------------------------------------------------------------------------------------
 Seq Scan on products  (cost=0.00..2.31 rows=1 width=254) (actual time=0.084..0.240 rows=1 loops=1)
   Filter: (to_tsvector('english'::regconfig, product_description) @@ '''laptop'''::tsquery)
   Rows Removed by Filter: 4
 Planning Time: 0.364 ms
 Execution Time: 0.295 ms
(5 rows)





-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- -- Step 1: Create the products table
-- CREATE TABLE products (
--     product_id SERIAL PRIMARY KEY,
--     product_name VARCHAR(100) NOT NULL,
--     product_description TEXT,
--     price NUMERIC(10, 2)
-- );

-- -- Step 2: Insert sample data into the products table
-- INSERT INTO products (product_name, product_description, price)
-- VALUES
-- ('Laptop', 'A high-performance laptop for gaming and productivity.', 1200.00),
-- ('Smartphone', 'A sleek and powerful smartphone with a stunning camera.', 799.99),
-- ('Headphones', 'Noise-canceling headphones with deep bass for music lovers.', 150.00),
-- ('Smartwatch', 'A smartwatch with fitness tracking and heart-rate monitoring.', 250.00),
-- ('Tablet', 'A versatile tablet for work and play, with a large screen.', 450.00);

-- -- Step 3: Create a GIN index on the product_description column
-- CREATE INDEX idx_product_description ON products USING gin(to_tsvector('english', product_description));

-- -- Step 4: Perform a Full-Text Search Query
-- SELECT product_id, product_name, product_description
-- FROM products
-- WHERE to_tsvector('english', product_description) @@ to_tsquery('english', 'laptop');

-- -- Step 5: Check index usage with EXPLAIN ANALYZE
-- EXPLAIN ANALYZE
-- SELECT product_id, product_name, product_description
-- FROM products
-- WHERE to_tsvector('english', product_description) @@ to_tsquery('english', 'laptop');
0