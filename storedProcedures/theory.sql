
Q1 How do you create a stored procedure in PostgreSQL?

=>You can use the CREATE PROCEDURE statement to define a stored procedure in PostgreSQL. 
Stored procedures are executed using the CALL statement.

-- Syntax:
CREATE PROCEDURE procedure_name(parameter_name datatype)
LANGUAGE plpgsql
AS $$
BEGIN
    -- Procedure logic here
END;
$$;

-- EXAMPLE
CREATE PROCEDURE greet_user(name TEXT)
LANGUAGE plpgsql
AS $$
BEGIN
    RAISE NOTICE 'Hello, %!', name;
END;
$$;

Q2 How do you pass parameters to a stored procedure?

=>Parameters are defined in the parentheses after the procedure name. 
You can pass values when calling the procedure.

Example:
CALL greet_user('Akshay');
-- ---------------------------------------------------------------------------
Q3 How do you return a result set from a stored procedure?

=> Stored procedures in PostgreSQL do not directly return values.
To return a result set, you use OUT parameters, temporary tables, 
or perform a RETURN QUERY in a function.

Example using OUT Parameters:

CREATE PROCEDURE get_employee_salary(emp_id INT, OUT salary NUMERIC)
LANGUAGE plpgsql
AS $$
BEGIN
    SELECT e.salary INTO salary
    FROM employees e
    WHERE e.employee_id = emp_id;
END;
$$;

CALL get_employee_salary(1, salary);

-- -----------------------------------------------------------------

Q4 What are the benefits of using stored procedures?

1.Performance: Code execution is faster as stored procedures are precompiled and cached.
2.Security: You can encapsulate business logic and limit direct table access.
3.Reusability: Procedures can be reused across different applications.
4.Transaction Management: You can handle transactions (commit/rollback) within procedures.



Q5 What are the drawbacks of using stored procedures?

1.Database Dependency: Procedures tie business logic to the database, making it harder to migrate to a different database.
2.Maintenance: Debugging and updating stored procedures can be more complex than application-level code.
3.Limited Portability: Procedures are often database-specific and not easily portable.


-- --------------------------------------------------------
Q6 How do you debug a stored procedure?

1.Use RAISE NOTICE statements to log variable values and flow control.
2.Use the PostgreSQL debugger plugin (if available).
3.Test the logic in smaller parts (e.g., SQL snippets).
4.Check logs for errors using pg_log.

-- Example:
RAISE NOTICE 'Variable x value: %', x;
-- ---------------------------------------------------------------------------------------------
Q7 How do you grant permissions to a stored procedure?

=>You can use the GRANT EXECUTE statement to give users permission to execute a procedure.

-- Syntax:
GRANT EXECUTE ON PROCEDURE procedure_name TO username;
-- Example:
GRANT EXECUTE ON PROCEDURE greet_user TO public;
-- -------------------------------------------------------------------------------------------
Q8 How can you use stored procedures to improve application performance?

1.Reduce Network Traffic: Procedures execute on the database server, reducing the need for multiple client-server round trips.
2.Batch Processing: Perform complex operations in a single call instead of multiple queries.
3.Optimized Execution: Precompiled code runs faster than ad-hoc queries.



-- -------------------------------------------------------------------------------------------------------------------------
Q9 What are some common use cases for stored procedures?

1.Complex business logic implementation.
2.Batch data processing.
3.Automated data maintenance tasks (e.g., cleaning old data).
4.Transactional operations (e.g., multi-step insert/update with rollback on failure).
5.Auditing and logging.

-- -----------------------------------------------------------------------------------------------------------------------
Q10 How do you handle errors within a stored procedure?

You can use the EXCEPTION block to catch and handle errors.
Example:

CREATE PROCEDURE safe_division(a NUMERIC, b NUMERIC, OUT result NUMERIC)
LANGUAGE plpgsql
AS $$
BEGIN
    BEGIN
        IF b = 0 THEN
            RAISE EXCEPTION 'Division by zero is not allowed!';
        END IF;

        result := a / b;
    EXCEPTION
        WHEN OTHERS THEN
            RAISE NOTICE 'An error occurred: %', SQLERRM;
            result := NULL;
    END;
END;
$$;