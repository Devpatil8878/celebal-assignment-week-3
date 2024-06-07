
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Salary DECIMAL(10, 2)
);


INSERT INTO Employees (EmployeeID, Name, Salary)
VALUES
    (1, 'John', 5000.00),
    (2, 'Jane', 6000.00),
    (3, 'Alice', 7000.00),
    (4, 'Bob', 4500.00),
    (5, 'Eve', 5500.00),
    (6, 'Charlie', 4800.00);



SELECT CEILING(AVG(Salary) - AVG(CAST(REPLACE(CAST(Salary AS VARCHAR), '0', '') AS DECIMAL)))
FROM Employees;
