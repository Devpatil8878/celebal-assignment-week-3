

CREATE TABLE OCCUPATIONS (
    Name VARCHAR(50),
    Occupation VARCHAR(50)
);


INSERT INTO OCCUPATIONS (Name, Occupation) VALUES ('Samantha', 'Doctor');
INSERT INTO OCCUPATIONS (Name, Occupation) VALUES ('Julia', 'Actor');
INSERT INTO OCCUPATIONS (Name, Occupation) VALUES ('Maria', 'Actor');
INSERT INTO OCCUPATIONS (Name, Occupation) VALUES ('Meera', 'Singer');
INSERT INTO OCCUPATIONS (Name, Occupation) VALUES ('Ashley', 'Professor');
INSERT INTO OCCUPATIONS (Name, Occupation) VALUES ('Ketty', 'Professor');
INSERT INTO OCCUPATIONS (Name, Occupation) VALUES ('Christeen', 'Professor');
INSERT INTO OCCUPATIONS (Name, Occupation) VALUES ('Jane', 'Actor');
INSERT INTO OCCUPATIONS (Name, Occupation) VALUES ('Jenny', 'Doctor');
INSERT INTO OCCUPATIONS (Name, Occupation) VALUES ('Priya', 'Singer');



WITH OrderedOccupations AS (
    SELECT 
        Name,
        Occupation,
        ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY Name) AS RowNum
    FROM OCCUPATIONS
),
MaxRows AS (
    SELECT 
        Occupation,
        MAX(RowNum) AS MaxRow
    FROM OrderedOccupations
    GROUP BY Occupation
),
Numbers AS (
    SELECT 1 AS n
    UNION ALL SELECT 2
    UNION ALL SELECT 3
    UNION ALL SELECT 4
    UNION ALL SELECT 5
    UNION ALL SELECT 6
    UNION ALL SELECT 7
    UNION ALL SELECT 8
    UNION ALL SELECT 9
    UNION ALL SELECT 10
)
SELECT
    ISNULL(Doctor.Name, 'NULL') AS Doctor,
    ISNULL(Professor.Name, 'NULL') AS Professor,
    ISNULL(Singer.Name, 'NULL') AS Singer,
    ISNULL(Actor.Name, 'NULL') AS Actor
FROM Numbers n
LEFT JOIN OrderedOccupations Doctor ON Doctor.RowNum = n.n AND Doctor.Occupation = 'Doctor'
LEFT JOIN OrderedOccupations Professor ON Professor.RowNum = n.n AND Professor.Occupation = 'Professor'
LEFT JOIN OrderedOccupations Singer ON Singer.RowNum = n.n AND Singer.Occupation = 'Singer'
LEFT JOIN OrderedOccupations Actor ON Actor.RowNum = n.n AND Actor.Occupation = 'Actor'
ORDER BY n.n;
