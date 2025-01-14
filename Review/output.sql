CREATE DATABASE
CREATE TABLE
                                           Table "public.books"
      Column      |          Type          | Collation | Nullable |                Default                 
------------------+------------------------+-----------+----------+----------------------------------------
 book_id          | integer                |           | not null | nextval('books_book_id_seq'::regclass)
 title            | character varying(255) |           | not null | 
 author           | character varying(255) |           | not null | 
 publication_year | integer                |           |          | 
 genre            | character varying(100) |           |          | 
Indexes:
    "books_pkey" PRIMARY KEY, btree (book_id)

                                           Table "public.books"
      Column      |          Type          | Collation | Nullable |                Default                 
------------------+------------------------+-----------+----------+----------------------------------------
 book_id          | integer                |           | not null | nextval('books_book_id_seq'::regclass)
 title            | character varying(255) |           | not null | 
 author           | character varying(255) |           | not null | 
 publication_year | integer                |           |          | 
 genre            | character varying(100) |           |          | 
Indexes:
    "books_pkey" PRIMARY KEY, btree (book_id)

CREATE TABLE
                                           Table "public.members"
     Column     |          Type          | Collation | Nullable |                  Default                   
----------------+------------------------+-----------+----------+--------------------------------------------
 member_id      | integer                |           | not null | nextval('members_member_id_seq'::regclass)
 name           | character varying(255) |           | not null | 
 address        | text                   |           |          | 
 contact_number | character varying(15)  |           |          | 
Indexes:
    "members_pkey" PRIMARY KEY, btree (member_id)

CREATE TABLE
                                     Table "public.borrowings"
    Column     |  Type   | Collation | Nullable |                     Default                      
---------------+---------+-----------+----------+--------------------------------------------------
 borrowing_id  | integer |           | not null | nextval('borrowings_borrowing_id_seq'::regclass)
 book_id       | integer |           | not null | 
 member_id     | integer |           | not null | 
 borrow_date   | date    |           | not null | 
 due_date      | date    |           | not null | 
 returned_date | date    |           |          | 
Indexes:
    "borrowings_pkey" PRIMARY KEY, btree (borrowing_id)
Foreign-key constraints:
    "borrowings_book_id_fkey" FOREIGN KEY (book_id) REFERENCES books(book_id)
    "borrowings_member_id_fkey" FOREIGN KEY (member_id) REFERENCES members(member_id)

INSERT 0 1
   column1   |        column2        | column3 |  column4  
-------------+-----------------------+---------+-----------
 Rashmirathi | Ramdhari Singh Dinkar |    1988 | Litreture
(1 row)

INSERT 0 1
INSERT 0 2
 book_id |     title     |         author         | publication_year |  genre  
---------+---------------+------------------------+------------------+---------
       1 | The Alchemist | Paulo Coelho           |             1988 | Fiction
       2 | Ramayan       | Valmiki                |             1988 | History
       3 | Godaan        | Premchand              |             1936 | Fiction
       4 | Madhushala    | Harivansh Rai Bachchan |             1956 | Poetry
(4 rows)

INSERT 0 5
 member_id |     name     |  address  | contact_number 
-----------+--------------+-----------+----------------
         1 | Amit Sharma  | Delhi     | 9876543210
         2 | Priya Singh  | Mumbai    | 8765432109
         3 | Rahul Verma  | Bangalore | 7654321098
         4 | Sunita Desai | Pune      | 6543210987
         5 | Ramesh Gupta | Jaipur    | 5432109876
(5 rows)

INSERT 0 1
INSERT 0 5
 book_id | title  |  author   | publication_year |  genre  
---------+--------+-----------+------------------+---------
       3 | Godaan | Premchand |             1936 | Fiction
(1 row)

    name     
-------------
 Amit Sharma
(1 row)

