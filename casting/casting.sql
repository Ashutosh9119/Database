
CREATE TABLE

INSERT 0 3
 customer_id | customer_name | birthdate  
-------------+---------------+------------
           1 | John Doe      | 1990-05-15
           2 | Jane Smith    | 1985-10-20
           3 | Alice Brown   | 2000-01-01
(3 rows)


Step 1: Casting birthdate to DATE
-- SELECT customer_id, customer_name, CAST(birthdate AS DATE) AS birthdate_date
-- FROM customers;

 customer_id | customer_name | birthdate_date 
-------------+---------------+----------------
           1 | John Doe      | 1990-05-15
           2 | Jane Smith    | 1985-10-20
           3 | Alice Brown   | 2000-01-01
(3 rows)




Step 2: Calculate Age Using AGE() Function
-- select customer_id,customer_name,birthdate::DATE AS birthdate_date,AGE(birthdate::DATE) AS age
-- from customers;


customer_id | customer_name | birthdate_date |           age           
-------------+---------------+----------------+-------------------------
           1 | John Doe      | 1990-05-15     | 34 years 8 mons 2 days
           2 | Jane Smith    | 1985-10-20     | 39 years 2 mons 28 days
           3 | Alice Brown   | 2000-01-01     | 25 years 16 days
(3 rows)


Step 3: Extract Age in Years

-- SELECT  customer_id, customer_name, EXTRACT(YEAR FROM AGE(birthdate::DATE)) AS age_years
-- FROM customers;

customer_id | customer_name | age_years 
-------------+---------------+-----------
           1 | John Doe      |        34
           2 | Jane Smith    |        39
           3 | Alice Brown   |        25
(3 rows)




Q2 -- Problem: A column stores a boolean value as 'Y' or 'N'. You need to perform logical operations on this column.

CREATE TABLE
INSERT 0 3

 user_id | user_name | is_active 
---------+-----------+-----------
       1 | Akshay    | Y
       2 | Agrim     | N
       3 | Ashutosh  | Y
(3 rows)



-- SELECT 
--     user_id,user_name, 
-- CASE 
--         WHEN is_active = 'Y' THEN TRUE
--         WHEN is_active = 'N' THEN FALSE
--         ELSE NULL
--     END AS is_active_boolean
-- FROM users;


 user_id | user_name | is_active_boolean 
---------+-----------+-------------------
       1 | Akshay    | t
       2 | Agrim     | f
       3 | Ashutosh  | t
(3 rows)


