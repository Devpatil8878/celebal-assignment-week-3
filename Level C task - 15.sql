
CREATE TABLE Employee (
    EmployeeID INT,
    EmployeeName VARCHAR(100),
    Salary DECIMAL(18, 2)
);


INSERT INTO Employee (EmployeeID, EmployeeName, Salary) VALUES (1, 'Alice', 60000);
INSERT INTO Employee (EmployeeID, EmployeeName, Salary) VALUES (2, 'Bob', 80000);
INSERT INTO Employee (EmployeeID, EmployeeName, Salary) VALUES (3, 'Charlie', 75000);
INSERT INTO Employee (EmployeeID, EmployeeName, Salary) VALUES (4, 'David', 90000);
INSERT INTO Employee (EmployeeID, EmployeeName, Salary) VALUES (5, 'Eve', 85000);
INSERT INTO Employee (EmployeeID, EmployeeName, Salary) VALUES (6, 'Frank', 70000);
INSERT INTO Employee (EmployeeID, EmployeeName, Salary) VALUES (7, 'Grace', 95000);


WITH RankedEmployees AS (
    SELECT
        EmployeeID,
        EmployeeName,
        Salary,
        ROW_NUMBER() OVER (ORDER BY Salary DESC) AS RowNum
    FROM Employee
)

SELECT
    EmployeeID,
    EmployeeName,
    Salary
FROM RankedEmployees
WHERE RowNum <= 5;
