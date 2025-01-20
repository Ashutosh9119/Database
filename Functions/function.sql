Q1.

-- Functions:
-- Must return a value (scalar, table, or other types).
-- Can be used in SQL queries, SELECT statements, or other functions.
-- Side effects (like modifying data) are generally not recommended but possible using VOLATILE functions.

-- Stored Procedures:
-- Do not return a value but allow output parameters.
-- Designed for executing procedural code, including transaction control (e.g., COMMIT/ROLLBACK).
-- Called using the CALL statement.


Q2.

CREATE FUNCTION total_salary(dept_id INT)
RETURNS INT AS $$
DECLARE
    total INT;
BEGIN
    SELECT SUM(salary) INTO total
    FROM employees
    WHERE department_id = dept_id;
    RETURN total;
END;
$$ LANGUAGE plpgsql;
CREATE FUNCTION

SELECT total_salary(2);

 total_salary
--------------
       170000
(1 row)


Q3.
create function square_number(x int) returns int language plpgsql as $$
begin
    return x * x;
end;
$$;
CREATE FUNCTION

select square_number(4);

 square_number
---------------
            16
(1 row)


Q4. 

-- Yes, a function in PostgreSQL can have side effects.
-- They can modify the state of database , such as changing data , creating tables , etc.


CREATE FUNCTION increase_salary(emp_id INT, percentage DECIMAL)
RETURNS VOID AS $$
BEGIN
    UPDATE employees
    SET salary = salary + (salary * percentage / 100)
    WHERE employee_id = emp_id;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION


SELECT increase_salary(1, 10);
 increase_salary
-----------------

(1 row)




Q6.

create function calculate_tax(amount numeric) returns numeric language plpgsql as $$
begin
    return amount * 0.18;
end;
$$;
CREATE FUNCTION

select calculate_tax(1000);

 calculate_tax
---------------
        180.00
(1 row)


Q7.

create function calculate_bonus(salary numeric, years int) returns numeric language plpgsql as $$
begin
    if years > 10 then
        return salary * 0.20;
    else
        return salary * 0.10;
    end if;
end;
$$;
CREATE FUNCTION

select calculate_bonus(50000, 12);

 calculate_bonus
-----------------
        10000.00
(1 row)



Q9.

create function calculate_discount(price numeric, customer_type text) returns numeric language plpgsql as $$
begin
    if customer_type = 'premium' then
        return price * 0.80; -- 20% discount
    else
        return price;
    end if;
end;
$$;
CREATE FUNCTION

select calculate_discount(1000, 'premium');
 calculate_discount
--------------------
             800.00
(1 row)

Q10.

-- Built-in functions in psql 

select upper('hello world');

    upper
-------------
 HELLO WORLD
(1 row)

select length('hello');

 length
--------
      5
(1 row)


select round(3.14159,2);

 round
-------
  3.14
(1 row)


select sqrt(16);

 sqrt
------
    4
(1 row)