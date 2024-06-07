
CREATE FUNCTION dbo.IsPrime(@num INT)
RETURNS BIT
AS
BEGIN
    DECLARE @i INT
    IF @num < 2 RETURN 0
    IF @num IN (2, 3) RETURN 1
    IF @num % 2 = 0 OR @num % 3 = 0 RETURN 0
    SET @i = 5
    WHILE @i * @i <= @num
    BEGIN
        IF @num % @i = 0 OR @num % (@i + 2) = 0 RETURN 0
        SET @i = @i + 6
    END
    RETURN 1
END;




WITH Numbers AS (
    SELECT 2 AS n
    UNION ALL
    SELECT n + 1
    FROM Numbers
    WHERE n + 1 <= 1000
),
PrimeNumbers AS (
    SELECT n
    FROM Numbers
    WHERE dbo.IsPrime(n) = 1
)
SELECT STRING_AGG(CAST(n AS VARCHAR), '&') AS Primes
FROM PrimeNumbers
OPTION (MAXRECURSION 0);
