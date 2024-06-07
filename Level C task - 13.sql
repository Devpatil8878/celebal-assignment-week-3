
CREATE TABLE BusinessUnitData (
    BU VARCHAR(50),
    Month INT,
    Year INT,
    Cost DECIMAL(18, 2),
    Revenue DECIMAL(18, 2)
);


INSERT INTO BusinessUnitData (BU, Month, Year, Cost, Revenue) VALUES ('BU1', 1, 2024, 10000.00, 20000.00);
INSERT INTO BusinessUnitData (BU, Month, Year, Cost, Revenue) VALUES ('BU1', 2, 2024, 12000.00, 22000.00);
INSERT INTO BusinessUnitData (BU, Month, Year, Cost, Revenue) VALUES ('BU2', 1, 2024, 15000.00, 25000.00);
INSERT INTO BusinessUnitData (BU, Month, Year, Cost, Revenue) VALUES ('BU2', 2, 2024, 13000.00, 23000.00);
INSERT INTO BusinessUnitData (BU, Month, Year, Cost, Revenue) VALUES ('BU3', 1, 2024, 8000.00, 18000.00);
INSERT INTO BusinessUnitData (BU, Month, Year, Cost, Revenue) VALUES ('BU3', 2, 2024, 9000.00, 19000.00);


WITH MonthlyData AS (
    SELECT
        BU,
        Month,
        Year,
        SUM(Cost) AS TotalCost,
        SUM(Revenue) AS TotalRevenue
    FROM BusinessUnitData
    GROUP BY BU, Month, Year
),
CostRevenueRatio AS (
    SELECT
        BU,
        Month,
        Year,
        TotalCost,
        TotalRevenue,
        CASE 
            WHEN TotalRevenue = 0 THEN 0 
            ELSE TotalCost / TotalRevenue 
        END AS CostRevenueRatio
    FROM MonthlyData
)
SELECT
    BU,
    Month,
    Year,
    TotalCost,
    TotalRevenue,
    CostRevenueRatio
FROM CostRevenueRatio
ORDER BY BU, Year, Month;
