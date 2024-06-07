
CREATE TABLE STATION (
    ID INT PRIMARY KEY,
    CITY VARCHAR(21),
    STATE CHAR(2),
    LAT_N FLOAT,
    LONG_W FLOAT
);


INSERT INTO STATION (ID, CITY, STATE, LAT_N, LONG_W) VALUES
(1, 'CityA', 'CA', 34.1, -118.2),
(2, 'CityB', 'CA', 36.2, -119.3),
(3, 'CityC', 'NY', 40.7, -74.0),
(4, 'CityD', 'TX', 32.8, -96.7),
(5, 'CityE', 'IL', 41.8, -87.6);



SELECT 
    ROUND(ABS(MAX(LAT_N) - MIN(LAT_N)) + ABS(MAX(LONG_W) - MIN(LONG_W)), 4) AS manhattan_distance
FROM 
    STATION;
