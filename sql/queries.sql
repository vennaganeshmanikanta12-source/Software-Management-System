USE Software;


-- =====================================================
-- 1. BASIC SELECT QUERIES
-- =====================================================

-- Display all employees
SELECT * FROM Employee;

-- Display all projects
SELECT * FROM Project;

-- Display employees who are Software Developers
SELECT *
FROM Employee
WHERE designation = 'Software Developer';


-- =====================================================
-- 2. INSERT / CREATE
-- =====================================================

-- Example INSERT query
-- Uncomment only if you want to test it.

-- INSERT INTO Employee
-- (first_name, last_name, designation, email, experience_years, salary)
-- VALUES
-- ('Test', 'Employee', 'Developer', 'test.employee@company.com', 1, 40000);


-- =====================================================
-- 3. UPDATE
-- =====================================================

-- Example: Update an employee's salary

-- UPDATE Employee
-- SET salary = 68000
-- WHERE employee_id = 2;


-- =====================================================
-- 4. DELETE
-- =====================================================

-- Example DELETE query
-- Uncomment only for testing.

-- DELETE FROM Employee
-- WHERE employee_id = 8;


-- =====================================================
-- 5. INNER JOIN
-- =====================================================

-- Display projects with their managers

SELECT
    p.project_id,
    p.project_name,
    CONCAT(e.first_name, ' ', e.last_name) AS manager_name,
    p.status
FROM Project p
INNER JOIN Employee e
    ON p.manager_id = e.employee_id;


-- =====================================================
-- 6. JOIN: TEAM AND PROJECT
-- =====================================================

SELECT
    t.team_id,
    t.team_name,
    p.project_name
FROM Team t
INNER JOIN Project p
    ON t.project_id = p.project_id;


-- =====================================================
-- 7. JOIN: TASK AND EMPLOYEE
-- =====================================================

SELECT
    t.task_id,
    t.task_title,
    CONCAT(e.first_name, ' ', e.last_name) AS assigned_employee,
    t.priority,
    t.status
FROM Task t
INNER JOIN Employee e
    ON t.assigned_to = e.employee_id;


-- =====================================================
-- 8. MULTI-TABLE JOIN
-- =====================================================

-- Display tasks with project, sprint and employee information

SELECT
    t.task_id,
    t.task_title,
    p.project_name,
    s.sprint_name,
    CONCAT(e.first_name, ' ', e.last_name) AS assigned_to,
    t.status
FROM Task t
INNER JOIN Sprint s
    ON t.sprint_id = s.sprint_id
INNER JOIN Project p
    ON s.project_id = p.project_id
INNER JOIN Employee e
    ON t.assigned_to = e.employee_id;


-- =====================================================
-- 9. TEAM MEMBERS
-- =====================================================

SELECT
    t.team_name,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    tm.joined_date
FROM Team_Member tm
INNER JOIN Team t
    ON tm.team_id = t.team_id
INNER JOIN Employee e
    ON tm.employee_id = e.employee_id
ORDER BY t.team_name;


-- =====================================================
-- 10. BUG INFORMATION
-- =====================================================

SELECT
    b.bug_id,
    b.title,
    b.severity,
    b.status,
    t.task_title,
    CONCAT(e.first_name, ' ', e.last_name) AS assigned_to
FROM Bug b
LEFT JOIN Task t
    ON b.task_id = t.task_id
LEFT JOIN Employee e
    ON b.assigned_to = e.employee_id;


-- =====================================================
-- 11. AGGREGATE FUNCTIONS
-- =====================================================

-- Total number of employees
SELECT COUNT(*) AS total_employees
FROM Employee;


-- Average employee salary
SELECT AVG(salary) AS average_salary
FROM Employee;


-- Maximum salary
SELECT MAX(salary) AS maximum_salary
FROM Employee;


-- Minimum salary
SELECT MIN(salary) AS minimum_salary
FROM Employee;


-- Total salary paid
SELECT SUM(salary) AS total_salary
FROM Employee;


-- =====================================================
-- 12. GROUP BY
-- =====================================================

-- Number of employees by designation

SELECT
    designation,
    COUNT(*) AS employee_count
FROM Employee
GROUP BY designation;


-- Number of projects by status

SELECT
    status,
    COUNT(*) AS project_count
FROM Project
GROUP BY status;


-- Number of tasks by status

SELECT
    status,
    COUNT(*) AS task_count
FROM Task
GROUP BY status;


-- =====================================================
-- 13. HAVING
-- =====================================================

-- Designations having more than one employee

SELECT
    designation,
    COUNT(*) AS employee_count
FROM Employee
GROUP BY designation
HAVING COUNT(*) > 1;


-- =====================================================
-- 14. ORDER BY
-- =====================================================

-- Employees ordered by salary from highest to lowest

SELECT
    employee_id,
    CONCAT(first_name, ' ', last_name) AS employee_name,
    salary
FROM Employee
ORDER BY salary DESC;


-- =====================================================
-- 15. SUBQUERY
-- =====================================================

-- Employees earning more than the average salary

SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM Employee
WHERE salary > (
    SELECT AVG(salary)
    FROM Employee
);


-- =====================================================
-- 16. ANOTHER SUBQUERY
-- =====================================================

-- Employees working on projects managed by Rahul Kumar

SELECT
    first_name,
    last_name,
    designation
FROM Employee
WHERE employee_id IN (
    SELECT assigned_to
    FROM Task
    WHERE sprint_id IN (
        SELECT sprint_id
        FROM Sprint
        WHERE project_id IN (
            SELECT project_id
            FROM Project
            WHERE manager_id = 1
        )
    )
);


-- =====================================================
-- 17. VIEW
-- =====================================================

CREATE OR REPLACE VIEW Project_Manager_View AS
SELECT
    p.project_id,
    p.project_name,
    CONCAT(e.first_name, ' ', e.last_name) AS manager_name,
    p.status,
    p.start_date,
    p.end_date
FROM Project p
INNER JOIN Employee e
    ON p.manager_id = e.employee_id;


-- Display the view
SELECT *
FROM Project_Manager_View;


-- =====================================================
-- 18. TASK SUMMARY VIEW
-- =====================================================

CREATE OR REPLACE VIEW Task_Summary_View AS
SELECT
    t.task_id,
    t.task_title,
    t.status,
    t.priority,
    CONCAT(e.first_name, ' ', e.last_name) AS assigned_employee,
    s.sprint_name,
    p.project_name
FROM Task t
LEFT JOIN Employee e
    ON t.assigned_to = e.employee_id
LEFT JOIN Sprint s
    ON t.sprint_id = s.sprint_id
LEFT JOIN Project p
    ON s.project_id = p.project_id;


-- Display task summary
SELECT *
FROM Task_Summary_View;