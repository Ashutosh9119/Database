                         Table "public.staff"
   Column    |         Type          | Collation | Nullable | Default 
-------------+-----------------------+-----------+----------+---------
 employee_id | integer               |           |          | 
 first_name  | character varying(20) |           |          | 
 last_name   | character varying(20) |           |          | 
 salary      | numeric               |           |          | 

INSERT 0 3
 employee_id | first_name | last_name | salary 
-------------+------------+-----------+--------
           1 | Amit       | Kumar     |  50000
           2 | Priya      | Sharma    |  60000
           3 | Ravi       | Verma     |  45000
(3 rows)

 first_name | last_name 
------------+-----------
 Amit       | Kumar
 Priya      | Sharma
 Ravi       | Verma
(3 rows)

UPDATE 1
DELETE 1
 employee_id | first_name | last_name | salary 
-------------+------------+-----------+--------
           2 | Priya      | Sharma    |  60000
           1 | Amit       | Kumar     |  55000
(2 rows)

