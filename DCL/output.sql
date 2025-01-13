                                                                                                      List of databases
   Name    |  Owner   | Encoding | Locale Provider |          Collate           |           Ctype            | Locale | ICU Rules |   Access privileges   |  Size   | Tablespace |                Description                 
-----------+----------+----------+-----------------+----------------------------+----------------------------+--------+-----------+-----------------------+---------+------------+--------------------------------------------
 company   | postgres | UTF8     | libc            | English_United States.1252 | English_United States.1252 |        |           |                       | 7931 kB | pg_default | 
 inventory | postgres | UTF8     | libc            | English_United States.1252 | English_United States.1252 |        |           |                       | 7907 kB | pg_default | 
 postgres  | postgres | UTF8     | libc            | English_United States.1252 | English_United States.1252 |        |           |                       | 7835 kB | pg_default | default administrative connection database
 template0 | postgres | UTF8     | libc            | English_United States.1252 | English_United States.1252 |        |           | =c/postgres          +| 7673 kB | pg_default | unmodifiable empty database
           |          |          |                 |                            |                            |        |           | postgres=CTc/postgres |         |            | 
 template1 | postgres | UTF8     | libc            | English_United States.1252 | English_United States.1252 |        |           | =c/postgres          +| 7827 kB | pg_default | default template for new databases
           |          |          |                 |                            |                            |        |           | postgres=CTc/postgres |         |            | 
(5 rows)



                                List of roles
   Role name    |                         Attributes                         
----------------+------------------------------------------------------------
 admins_user    | 
 akshay         | 
 app_user       | 
 mrsql          | 
 postgres       | Superuser, Create role, Create DB, Replication, Bypass RLS
 reporting_user | 




-- GRANT SELECT ON employees TO reporting_user;

                                               Access privileges
 Schema |             Name              |   Type   |     Access privileges      | Column privileges | Policies 
--------+-------------------------------+----------+----------------------------+-------------------+----------
 public | departments                   | table    | postgres=arwdDxtm/postgres+|                   | 
        |                               |          | akshay=ar/postgres         |                   | 
 public | departments_department_id_seq | sequence |                            |                   | 
 public | employee_employee_id_seq      | sequence |                            |                   | 
 public | employees                     | table    | postgres=arwdDxtm/postgres+|                   | 
        |                               |          | akshay=ar/postgres        +|                   | 
        |                               |          | reporting_user=r/postgres  |                   | 
(4 rows)





--  GRANT INSERT ON employees TO app_user;
 
                                               Access privileges
 Schema |             Name              |   Type   |     Access privileges      | Column privileges | Policies 
--------+-------------------------------+----------+----------------------------+-------------------+----------
 public | departments                   | table    | postgres=arwdDxtm/postgres+|                   | 
        |                               |          | akshay=ar/postgres         |                   | 
 public | departments_department_id_seq | sequence |                            |                   | 
 public | employee_employee_id_seq      | sequence |                            |                   | 
 public | employees                     | table    | postgres=arwdDxtm/postgres+|                   | 
        |                               |          | akshay=ar/postgres        +|                   | 
        |                               |          | reporting_user=r/postgres +|                   | 
        |                               |          | app_user=a/postgres        |                   | 
(4 rows)




-- REVOKE UPDATE ON employees FROM reporting_user;

 Schema |             Name              |   Type   |     Access privileges      | Column privileges | Policies 
--------+-------------------------------+----------+----------------------------+-------------------+----------
 public | departments                   | table    | postgres=arwdDxtm/postgres+|                   | 
        |                               |          | akshay=ar/postgres         |                   | 
 public | departments_department_id_seq | sequence |                            |                   | 
 public | employee_employee_id_seq      | sequence |                            |                   | 
 public | employees                     | table    | postgres=arwdDxtm/postgres+|                   | 
        |                               |          | akshay=ar/postgres        +|                   | 
        |                               |          | reporting_user=r/postgres +|                   | 
        |                               |          | app_user=a/postgres        |                   | 
(4 rows)




--  GRANT ALL PRIVILEGES ON products TO admins_user;
                         
                                             Access privileges
 Schema |          Name           |   Type   |       Access privileges       | Column privileges | Policies 
--------+-------------------------+----------+-------------------------------+-------------------+----------
 public | products                | table    | postgres=arwdDxtm/postgres   +|                   | 
        |                         |          | akshay=arwdDxtm/postgres     +|                   | 
        |                         |          | admins_user=arwdDxtm/postgres |                   | 
 public | products_product_id_seq | sequence |                               |                   | 
(2 rows)



--   REVOKE DELETE ON products FROM PUBLIC;
                                             Access privileges
 Schema |          Name           |   Type   |       Access privileges       | Column privileges | Policies 
--------+-------------------------+----------+-------------------------------+-------------------+----------
 public | products                | table    | postgres=arwdDxtm/postgres   +|                   | 
        |                         |          | akshay=arwdDxtm/postgres     +|                   | 
        |                         |          | admins_user=arwdDxtm/postgres |                   | 
 public | products_product_id_seq | sequence |                               |                   | 
(2 rows)


-- GRANT SELECT, INSERT ON departments TO reporting_user
                                               Access privileges
 Schema |             Name              |   Type   |     Access privileges      | Column privileges | Policies 
--------+-------------------------------+----------+----------------------------+-------------------+----------
 public | departments                   | table    | postgres=arwdDxtm/postgres+|                   | 
        |                               |          | akshay=ar/postgres        +|                   | 
        |                               |          | reporting_user=ar/postgres |                   | 
 public | departments_department_id_seq | sequence |                            |                   | 
 public | employee_employee_id_seq      | sequence |                            |                   | 
 public | employees                     | table    | postgres=arwdDxtm/postgres+|                   | 
        |                               |          | akshay=ar/postgres        +|                   | 
        |                               |          | reporting_user=r/postgres +|                   | 
        |                               |          | app_user=a/postgres        |                   | 
(4 rows)



--   REVOKE ALL PRIVILEGES ON departments FROM app_user;
 

                                               Access privileges
 Schema |             Name              |   Type   |     Access privileges      | Column privileges | Policies 
--------+-------------------------------+----------+----------------------------+-------------------+----------
 public | departments                   | table    | postgres=arwdDxtm/postgres+|                   | 
        |                               |          | akshay=ar/postgres        +|                   | 
        |                               |          | reporting_user=ar/postgres |                   | 
 public | departments_department_id_seq | sequence |                            |                   | 
 public | employee_employee_id_seq      | sequence |                            |                   | 
 public | employees                     | table    | postgres=arwdDxtm/postgres+|                   | 
        |                               |          | akshay=ar/postgres        +|                   | 
        |                               |          | reporting_user=r/postgres +|                   | 
        |                               |          | app_user=a/postgres        |                   | 
(4 rows)



-- GRANT USAGE ON SCHEMA public TO app_user;

                                               Access privileges
 Schema |             Name              |   Type   |     Access privileges      | Column privileges | Policies 
--------+-------------------------------+----------+----------------------------+-------------------+----------
 public | departments                   | table    | postgres=arwdDxtm/postgres+|                   | 
        |                               |          | akshay=ar/postgres        +|                   | 
        |                               |          | reporting_user=ar/postgres |                   | 
 public | departments_department_id_seq | sequence |                            |                   | 
 public | employee_employee_id_seq      | sequence |                            |                   | 
 public | employees                     | table    | postgres=arwdDxtm/postgres+|                   | 
        |                               |          | akshay=ar/postgres        +|                   | 
        |                               |          | reporting_user=r/postgres +|                   | 
        |                               |          | app_user=a/postgres        |                   | 
(4 rows)




-- REVOKE USAGE ON SCHEMA public FROM reporting_user,app_user;

                                               Access privileges
 Schema |             Name              |   Type   |     Access privileges      | Column privileges | Policies 
--------+-------------------------------+----------+----------------------------+-------------------+----------
 public | departments                   | table    | postgres=arwdDxtm/postgres+|                   | 
        |                               |          | akshay=ar/postgres        +|                   | 
        |                               |          | reporting_user=ar/postgres |                   | 
 public | departments_department_id_seq | sequence |                            |                   | 
 public | employee_employee_id_seq      | sequence |                            |                   | 
 public | employees                     | table    | postgres=arwdDxtm/postgres+|                   | 
        |                               |          | akshay=ar/postgres        +|                   | 
        |                               |          | reporting_user=r/postgres +|                   | 
        |                               |          | app_user=a/postgres        |                   | 
(4 rows)




-- CREATE ROLE new_user WITH LOGIN PASSWORD 'new_password';
-- GRANT CONNECT ON DATABASE database_name TO new_user;


   Name    |  Owner   | Encoding | Locale Provider |          Collate           |           Ctype            | Locale | ICU Rules |    Access privileges     
-----------+----------+----------+-----------------+----------------------------+----------------------------+--------+-----------+--------------------------
 company   | postgres | UTF8     | libc            | English_United States.1252 | English_United States.1252 |        |           | =Tc/postgres            +
           |          |          |                 |                            |                            |        |           | postgres=CTc/postgres   +
           |          |          |                 |                            |                            |        |           | admins_user=CTc/postgres+
           |          |          |                 |                            |                            |        |           | katoch=c/postgres
 inventory | postgres | UTF8     | libc            | English_United States.1252 | English_United States.1252 |        |           | =Tc/postgres            +
           |          |          |                 |                            |                            |        |           | postgres=CTc/postgres   +
           |          |          |                 |                            |                            |        |           | admins_user=CTc/postgres
 postgres  | postgres | UTF8     | libc            | English_United States.1252 | English_United States.1252 |        |           | 
 template0 | postgres | UTF8     | libc            | English_United States.1252 | English_United States.1252 |        |           | =c/postgres             +
           |          |          |                 |                            |                            |        |           | postgres=CTc/postgres
 template1 | postgres | UTF8     | libc            | English_United States.1252 | English_United States.1252 |        |           | =c/postgres             +
           |          |          |                 |                            |                            |        |           | postgres=CTc/postgres
(5 rows)

