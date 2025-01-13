
Q1: Find the average salary of employees.
Query: SELECT AVG(salary) AS average_salary FROM employee;

     average_salary     
------------------------
 11000.0000000000000000
(1 row)



Q2: Calculate the total price for each product category.
Query: SELECT product_id, SUM(price) AS total_price FROM product GROUP BY product_id;

 product_id | total_price 
------------+-------------
        103 |        4000
        104 |        5000
        102 |        1200
(3 rows)



Q3: Determine the maximum and minimum prices of products in product.
Query: SELECT MAX(price) AS max_price, MIN(price) AS min_price FROM product;

 max_price | min_price 
-----------+-----------
      5000 |      1200
(1 row)



Q4: Count the number of orders placed by each customer.
Query: SELECT customer_id, COUNT(order_id) AS order_count FROM orders GROUP BY customer_id;

 customer_id | order_count 
-------------+-------------
           3 |           1
           2 |           2
           1 |           2
(3 rows)



Q5: Find the total revenue generated by each salesperson.
Query: SELECT salesperson_id, SUM(total_amount) AS total_revenue FROM orderss GROUP BY salesperson_id;

 salesperson_id | total_revenue 
----------------+---------------
              3 |        300.00
              2 |        600.00
              1 |        250.00
(3 rows)
