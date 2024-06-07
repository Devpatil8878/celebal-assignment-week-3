
CREATE TABLE Friends (
    ID INT PRIMARY KEY,
    Friend_ID INT
);


INSERT INTO Friends (ID, Friend_ID) VALUES
(1, 2),
(2, 3),
(3, 4),
(4, 1);


CREATE TABLE Students (
    ID INT PRIMARY KEY,
    Name VARCHAR(50)
);


INSERT INTO Students (ID, Name) VALUES
(1, 'Ashley'),
(2, 'Samantha'),
(3, 'Julia'),
(4, 'Scarlet');


CREATE TABLE Packages (
    ID INT PRIMARY KEY,
    Salary DECIMAL(10, 2)
);


INSERT INTO Packages (ID, Salary) VALUES
(1, 15.20),
(2, 10.06),
(3, 11.55),
(4, 12.12);


SELECT
    S1.Name
FROM
    Friends F
JOIN
    Students S1 ON F.ID = S1.ID
JOIN
    Packages P1 ON S1.ID = P1.ID
JOIN
    Students S2 ON F.Friend_ID = S2.ID
JOIN
    Packages P2 ON S2.ID = P2.ID
WHERE
    P2.Salary > P1.Salary
ORDER BY
    P2.Salary ASC;
