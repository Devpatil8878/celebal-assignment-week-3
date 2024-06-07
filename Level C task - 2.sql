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
