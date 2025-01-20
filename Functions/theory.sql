Functions
Q1 What is the difference between a function and a stored procedure?
-- Difference Between a Function and a Stored Procedure
In PostgreSQL, the primary distinction between a function and a stored procedure is that:
1.Function: Must return a value. It can be used in SQL expressions and can return various types of data, including scalar values or result sets.

2.Stored Procedure: Does not return a value and is primarily used for executing operations like 
modifying database structures or performing actions without needing to return data. It can also manage transactions within its body.


-- ----------------------------------------------------------------------------------------------------------------------------------------
Q2 How do you create a function in PostgreSQL?

=>You use the CREATE FUNCTION statement to define a function.
-- Syntax:
CREATE FUNCTION function_name(parameters)
RETURNS return_type AS $$
BEGIN
    -- Function body
    RETURN value;
END;
$$ LANGUAGE plpgsql;

-- Example:
CREATE FUNCTION get_employee_salary(emp_id INT)
RETURNS NUMERIC AS $$
BEGIN
    RETURN (SELECT salary FROM employees WHERE employee_id = emp_id);
END;
$$ LANGUAGE plpgsql;


-- -----------------------------------------------------------------------------------------------------------------------------------
Q3 How do you return a value from a function?

=>The RETURN keyword is used to specify the value to be returned.
-- Example:

CREATE FUNCTION double_value(x INT)
RETURNS INT AS $$
BEGIN
    RETURN x * 2;
END;
$$ LANGUAGE plpgsql;

-- Usage:
SELECT double_value(10); -- Output: 20

-- ------------------------------------------------------------------------------------------------------------------------------------
Q4 Can a function have side effects?

=>Yes: Functions can have side effects if they modify the database (e.g., inserting, updating, or deleting rows). However,
     PostgreSQL encourages using functions for computations and avoids side effects in functions returning values.
     To explicitly allow side effects, use VOLATILE functions.
   
-- Example:

CREATE FUNCTION insert_log(message TEXT)
RETURNS VOID AS $$
BEGIN
    INSERT INTO logs (log_message, log_date) VALUES (message, NOW());
END;
$$ LANGUAGE plpgsql;




-- --------------------------------------------------------------------------------------------------------
Q5 What are some common data types that can be returned by a function?

1.Scalar Types: INTEGER, VARCHAR, TEXT, NUMERIC, BOOLEAN, etc.
2.Composite Types: Rows from a table or user-defined types.
3.Table Types: Sets of rows (similar to a table).
4.Custom Types: Defined using CREATE TYPE.

-- Example of Returning Table Data:

CREATE FUNCTION get_department_employees(dept_id INT)
RETURNS TABLE(emp_id INT, emp_name TEXT, salary NUMERIC) AS $$
BEGIN
    RETURN QUERY
    SELECT employee_id, emp_name, salary
    FROM employees
    WHERE department_id = dept_id;
END;
$$ LANGUAGE plpgsql;


-- ----------------------------------------------------------------------------------------------------------------------------

Q6 How can you use functions to improve code readability and maintainability?

1.Encapsulation: Encapsulate frequently used logic into reusable functions.
2.Abstraction: Hide complex logic behind a simple interface.
3.Consistency: Avoid code duplication by centralizing logic in functions.
4.Modularity: Break down tasks into smaller, manageable pieces.

-- Example: Instead of writing complex queries repeatedly:
CREATE FUNCTION calculate_bonus(emp_id INT)
RETURNS NUMERIC AS $$
DECLARE
    salary NUMERIC;
BEGIN
    SELECT salary INTO salary FROM employees WHERE employee_id = emp_id;
    RETURN salary * 0.1; -- 10% bonus
END;
$$ LANGUAGE plpgsql;

-- ------------------------------------------------------------------------------------------------------------------
Q7 How can you use functions to perform complex calculations?

=>Functions allow you to perform multi-step calculations using procedural logic.

-- Example:

CREATE FUNCTION compound_interest(principal NUMERIC, rate NUMERIC, time INT)
RETURNS NUMERIC AS $$
BEGIN
    RETURN principal * POWER(1 + rate / 100, time);
END;
$$ LANGUAGE plpgsql;



-- --------------------------------------------------------------------------------------------------------------------------
Q8 What are some performance considerations when using functions?

1.Function Overhead: Too many nested or complex functions may increase execution time.
2.Immutable/Stable: Use IMMUTABLE or STABLE functions when possible for optimization.
3.Inlining: Simple SQL functions are inlined, reducing overhead.
4.Indexes: Avoid using functions in a way that prevents index usage in queries.
5.Execution Cost: Ensure functions are optimized by analyzing EXPLAIN ANALYZE.


-- -------------------------------------------------------------------------------------------------------------------
Q9 How can you use functions to implement custom business logic?

=> Functions can implement rules, calculations, and processes specific to business needs.

-- Example: Discount Calculation:

CREATE FUNCTION apply_discount(order_id INT, discount_percentage NUMERIC)
RETURNS NUMERIC AS $$
DECLARE
    total NUMERIC;
BEGIN
    SELECT SUM(order_amount) INTO total FROM orders WHERE order_id = order_id;
    RETURN total - (total * discount_percentage / 100);
END;
$$ LANGUAGE plpgsql;

-- -----------------------------------------------------------------------------------------------------------------
Q10 What are some examples of built-in functions in PostgreSQL?

1 String Functions: LOWER, UPPER, CONCAT, SUBSTRING, LENGTH
2 Numeric Functions: ROUND, CEIL, FLOOR, POWER, ABS
3 Date/Time Functions: NOW(), AGE(), DATE_PART, TO_CHAR
4 Aggregate Functions: SUM, AVG, COUNT, MAX, MIN
5 JSON Functions: JSONB_BUILD_OBJECT, JSONB_EXTRACT_PATH, TO_JSONB
6 Array Functions: ARRAY_AGG, UNNEST, ARRAY_LENGTH


-- Example:
SELECT UPPER('postgresql'); -- Output: POSTGRESQL
SELECT ROUND(123.456, 2); -- Output: 123.46
SELECT NOW(); -- Output: Current timestamp