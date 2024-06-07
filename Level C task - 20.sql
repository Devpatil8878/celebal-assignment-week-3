
CREATE TABLE SourceTable (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT
);


INSERT INTO SourceTable (ID, Name, Age)
VALUES
    (1, 'John', 30),
    (2, 'Alice', 25),
    (3, 'Bob', 35);


CREATE TABLE TargetTable (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT
);


INSERT INTO TargetTable (ID, Name, Age)
SELECT ID, Name, Age
FROM SourceTable;
