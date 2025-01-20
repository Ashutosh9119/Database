Q1. How do you create a view in PostgreSQL?

A view is created in PostgreSQL using the CREATE VIEW statement. 
It is essentially a stored query that acts as a virtual table.

Syntax:
CREATE VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE condition;

Example:
CREATE VIEW high_salary_employees AS
SELECT emp_name, salary
FROM employees
WHERE salary > 50000;
-- ------------------------------------------------------------------------------------------------------------------------------------------ -
Q2. What are the benefits of using views?

1. Data Security: Restricts access to sensitive data by exposing only specific columns or rows.
2. Improves Consistency: Provides a unified, consistent interface for querying data.
3. Enhances Maintainability: Changes to the underlying query logic require updates only in the view.
4. Reduces Repetition: Avoids redundancy by allowing commonly used queries to be stored and reused.


-- -----------------------------------------------------------------------------------------------------------------------------------------------
Q3. How can you update data through a view?

You can update data through a view only if:

1.The view is based on a single table.
2.The view does not contain JOINs, aggregates, or calculated fields.

-- Example of an updateable view:

CREATE VIEW updateable_view AS
SELECT emp_name, salary
FROM employees;

UPDATE updateable_view
SET salary = 60000
WHERE emp_name = 'Akshay';


-- -----------------------------------------------------------------------------------------------------------------------------------------------
Q4. What are the limitations of using views?

1.Non-updateable Views: Views containing JOINs, aggregates, or calculated fields cannot be updated directly.
2.Performance Overhead: Views execute the underlying query each time they are accessed, which may slow down performance for complex queries.
3.Dependency Issues: Dropping or modifying underlying tables can cause views to break.
4.Indexing: Views cannot be indexed, unlike materialized views.

-- -----------------------------------------------------------------------------------------------------------------------------------------------
5. How can you use views to improve data security?

1.Restrict access by defining views that expose only certain columns or rows.
2.Grant permissions on the view instead of the underlying table.
3.Mask sensitive data by using calculated fields.


Example:
CREATE VIEW public_employee_data AS
SELECT emp_name, department_id
FROM employees;

GRANT SELECT ON public_employee_data TO readonly_user;

-- -------------------------------------------------------------------------------------------------------------------------------------

Q6 How can you use views to simplify complex queries?

=>Views encapsulate complex SQL logic, allowing you to reuse it as a virtual table.

CREATE VIEW department_salary_summary AS
SELECT d.department_name, AVG(e.salary) AS avg_salary
FROM departments d
JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name;

-- Now, querying the average salary is simpler:

SELECT * FROM department_salary_summary
WHERE avg_salary > 40000;

-- -----------------------------------------------------------------------------------------------------------------------------------------------

7. How do you drop a view in PostgreSQL?

To delete a view, use the DROP VIEW statement.

Syntax:
DROP VIEW view_name;

Example:
DROP VIEW high_salary_employees;


-- To avoid errors if the view does not exist:
DROP VIEW IF EXISTS view_name;

-- -------------------------------------------------------------------------------------------------------------------------------------------------
8. Can a view be based on another view?
Yes, views can be created on top of other views, forming a hierarchy.

Example:
CREATE VIEW salary_view AS
SELECT emp_name, salary
FROM employees
WHERE salary > 50000;

CREATE VIEW high_salary_view AS
SELECT emp_name
FROM salary_view
WHERE salary > 60000;

-- -----------------------------------------------------------------------------------------------------------------------------------------------------
9. What are some common use cases for views in PostgreSQL?

1.Data Aggregation: Generate reports (e.g., department-wise average salaries).
2.Security Layers: Restrict access to specific data.
3.Business Logic Encapsulation: Implement frequently used logic (e.g., calculating gross revenue).
4.Data Transformation: Simplify calculated fields and derived data.
5.Abstraction: Hide the complexity of underlying data models from users.