
CREATE TABLE JobCost (
    JobFamily VARCHAR(50),
    Location VARCHAR(50),
    Cost DECIMAL(18, 2)
);


INSERT INTO JobCost (JobFamily, Location, Cost) VALUES ('Engineering', 'India', 10000.00);
INSERT INTO JobCost (JobFamily, Location, Cost) VALUES ('Engineering', 'International', 30000.00);
INSERT INTO JobCost (JobFamily, Location, Cost) VALUES ('HR', 'India', 5000.00);
INSERT INTO JobCost (JobFamily, Location, Cost) VALUES ('HR', 'International', 15000.00);
INSERT INTO JobCost (JobFamily, Location, Cost) VALUES ('Marketing', 'India', 8000.00);
INSERT INTO JobCost (JobFamily, Location, Cost) VALUES ('Marketing', 'International', 24000.00);
INSERT INTO JobCost (JobFamily, Location, Cost) VALUES ('Finance', 'India', 6000.00);
INSERT INTO JobCost (JobFamily, Location, Cost) VALUES ('Finance', 'International', 18000.00);



WITH TotalCost AS (
    SELECT
        JobFamily,
        SUM(CASE WHEN Location = 'India' THEN Cost ELSE 0 END) AS IndiaCost,
        SUM(CASE WHEN Location = 'International' THEN Cost ELSE 0 END) AS InternationalCost
    FROM JobCost
    GROUP BY JobFamily
),
CostRatios AS (
    SELECT
        JobFamily,
        IndiaCost,
        InternationalCost,
        IndiaCost + InternationalCost AS TotalCost,
        (IndiaCost * 100.0 / (IndiaCost + InternationalCost)) AS IndiaPercentage,
        (InternationalCost * 100.0 / (IndiaCost + InternationalCost)) AS InternationalPercentage
    FROM TotalCost
)
SELECT
    JobFamily,
    IndiaCost,
    InternationalCost,
    IndiaPercentage AS IndiaCostPercentage,
    InternationalPercentage AS InternationalCostPercentage
FROM CostRatios;
