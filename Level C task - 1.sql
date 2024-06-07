-- Create the table
CREATE TABLE Projects (
    Task_ID INT PRIMARY KEY,
    Start_Date DATE,
    End_Date DATE
);

-- Insert sample data
INSERT INTO Projects (Task_ID, Start_Date, End_Date) VALUES
(1, '2015-10-01', '2015-10-02'),
(2, '2015-10-02', '2015-10-03'),
(3, '2015-10-03', '2015-10-04'),
(4, '2015-10-13', '2015-10-14'),
(5, '2015-10-14', '2015-10-15'),
(6, '2015-10-28', '2015-10-29'),
(7, '2015-10-30', '2015-10-31');

-- start and end dates
WITH ProjectGroups AS (
    SELECT
        Task_ID,
        Start_Date,
        End_Date,
        Start_Date AS LagStartDate,
        ROW_NUMBER() OVER (ORDER BY Start_Date) AS RowNum
    FROM Projects
),
LaggedProjects AS (
    SELECT
        Task_ID,
        Start_Date,
        End_Date,
        LAG(Start_Date, 1, NULL) OVER (ORDER BY Start_Date) AS PrevStartDate,
        RowNum
    FROM ProjectGroups
),
ProjectIdentifiers AS (
    SELECT
        Task_ID,
        Start_Date,
        End_Date,
        RowNum,
        SUM(CASE WHEN DATEDIFF(day, PrevStartDate, Start_Date) = 1 THEN 0 ELSE 1 END) 
        OVER (ORDER BY Start_Date) AS ProjectID
    FROM LaggedProjects
),
ProjectDates AS (
    SELECT
        ProjectID,
        MIN(Start_Date) AS ProjectStartDate,
        MAX(End_Date) AS ProjectEndDate
    FROM ProjectIdentifiers
    GROUP BY ProjectID
),
ProjectDurations AS (
    SELECT
        ProjectStartDate,
        ProjectEndDate,
        DATEDIFF(day, ProjectStartDate, ProjectEndDate) + 1 AS Duration
    FROM ProjectDates
)
SELECT
    ProjectStartDate,
    ProjectEndDate
FROM ProjectDurations
ORDER BY
    Duration ASC,
    ProjectStartDate ASC;
