
CREATE TABLE SampleTable (
    Column1 INT,
    Column2 INT
);


INSERT INTO SampleTable (Column1, Column2)
VALUES (10, 20), (30, 40), (50, 60);


SELECT * FROM SampleTable;


UPDATE SampleTable
SET
    Column1 = CASE
                 WHEN Column1 <> Column2 THEN Column2
                 ELSE Column1
              END,
    Column2 = CASE
                 WHEN Column1 <> Column2 THEN Column1
                 ELSE Column2
              END;

SELECT * FROM SampleTable;
