
CREATE TABLE EmployeeData (
    SubBand VARCHAR(50),
    EmployeeID INT
);


INSERT INTO EmployeeData (SubBand, EmployeeID) VALUES ('A1', 1);
INSERT INTO EmployeeData (SubBand, EmployeeID) VALUES ('A1', 2);
INSERT INTO EmployeeData (SubBand, EmployeeID) VALUES ('A2', 3);
INSERT INTO EmployeeData (SubBand, EmployeeID) VALUES ('A2', 4);
INSERT INTO EmployeeData (SubBand, EmployeeID) VALUES ('A2', 5);
INSERT INTO EmployeeData (SubBand, EmployeeID) VALUES ('B1', 6);
INSERT INTO EmployeeData (SubBand, EmployeeID) VALUES ('B1', 7);
INSERT INTO EmployeeData (SubBand, EmployeeID) VALUES ('B3', 8);
INSERT INTO EmployeeData (SubBand, EmployeeID) VALUES ('B3', 9);
INSERT INTO EmployeeData (SubBand, EmployeeID) VALUES ('B3', 10);




DECLARE @TotalHeadcount INT;
SELECT @TotalHeadcount = COUNT(*) FROM EmployeeData;

SELECT
    SubBand,
    COUNT(EmployeeID) AS Headcount,
    CAST(COUNT(EmployeeID) * 100.0 / @TotalHeadcount AS DECIMAL(5, 2)) AS Percentage
FROM EmployeeData
GROUP BY SubBand
ORDER BY SubBand;
