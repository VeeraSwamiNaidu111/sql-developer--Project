
USE EmployeeManagementDB;
GO

-- 1. View all employees
SELECT *
FROM Employees;
GO

-- 2. View all departments
SELECT *
FROM Departments;
GO

-- 3. Count total employees
SELECT COUNT(*) AS TotalEmployees
FROM Employees;
GO

-- 4. Employee details with department names
SELECT
    E.EmpID,
    E.EmpName,
    E.Salary,
    D.DeptName
FROM Employees E
INNER JOIN Departments D
    ON E.DeptID = D.DeptID;
GO

-- 5. Department-wise salary report
SELECT
    D.DeptName,
    COUNT(E.EmpID) AS EmployeeCount,
    SUM(E.Salary) AS TotalSalary,
    AVG(E.Salary) AS AverageSalary
FROM Departments D
LEFT JOIN Employees E
    ON D.DeptID = E.DeptID
GROUP BY D.DeptName;
GO

-- 6. Employees earning above average salary
SELECT EmpID, EmpName, Salary
FROM Employees
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employees
);
GO

-- 7. Data quality check: employees without valid departments
SELECT E.EmpID, E.EmpName, E.DeptID
FROM Employees E
LEFT JOIN Departments D
    ON E.DeptID = D.DeptID
WHERE D.DeptID IS NULL;
GO
