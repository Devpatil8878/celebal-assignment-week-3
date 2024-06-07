
CREATE TABLE EmployeeCosts (
    EmployeeID INT,
    BusinessUnit VARCHAR(50),
    DateColumn DATE,
    CostPerEmployee DECIMAL(10, 2),
    HoursWorked DECIMAL(10, 2)
);

INSERT INTO EmployeeCosts (EmployeeID, BusinessUnit, DateColumn, CostPerEmployee, HoursWorked)
VALUES
    (1, 'BU1', '2024-01-01', 20.00, 160),
    (2, 'BU1', '2024-01-01', 25.00, 150),
    (3, 'BU1', '2024-01-01', 22.50, 170),
    (4, 'BU1', '2024-02-01', 20.00, 165),
    (5, 'BU1', '2024-02-01', 25.00, 155),
    (6, 'BU1', '2024-02-01', 22.50, 175);


SELECT 
    YEAR(DateColumn) AS Year,
    MONTH(DateColumn) AS Month,
    SUM(CostPerEmployee * HoursWorked) / SUM(HoursWorked) AS WeightedAverageCost
FROM 
    EmployeeCosts
WHERE 
    BusinessUnit = 'BU1'
GROUP BY 
    YEAR(DateColumn),
    MONTH(DateColumn)
ORDER BY 
    YEAR(DateColumn),
    MONTH(DateColumn);
