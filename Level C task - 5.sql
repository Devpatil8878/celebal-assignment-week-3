
CREATE TABLE Hackers (
    hacker_id INT PRIMARY KEY,
    name VARCHAR(50)
);


INSERT INTO Hackers (hacker_id, name) VALUES 
(15758, 'Rose'),
(20703, 'Angela'),
(36396, 'Frank'),
(38289, 'Patrick'),
(44065, 'Lisa'),
(53473, 'Kimberly'),
(62529, 'Bonnie'),
(79722, 'Michael');


CREATE TABLE Submissions (
    submission_date DATE,
    submission_id INT PRIMARY KEY,
    hacker_id INT,
    score INT,
    FOREIGN KEY (hacker_id) REFERENCES Hackers(hacker_id)
);


INSERT INTO Submissions (submission_date, submission_id, hacker_id, score) VALUES 
('2016-03-01', 8494, 20703, 0),
('2016-03-01', 22403, 53473, 15),
('2016-03-01', 23985, 79722, 25),
('2016-03-01', 30173, 36396, 70),
('2016-03-02', 34928, 20703, 0),
('2016-03-02', 38740, 15758, 60),
('2016-03-02', 42769, 79722, 25),
('2016-03-02', 44364, 79722, 60),
('2016-03-03', 45440, 20703, 0),
('2016-03-03', 49050, 36396, 70),
('2016-03-03', 50273, 79722, 50),
('2016-03-04', 50344, 20703, 0),
('2016-03-04', 54404, 53473, 65),
('2016-03-04', 61533, 79722, 45),
('2016-03-05', 72852, 20703, 0),
('2016-03-05', 74546, 38289, 50),
('2016-03-05', 76487, 62529, 0),
('2016-03-06', 82439, 36396, 10),
('2016-03-06', 90008, 36396, 40),
('2016-03-06', 90404, 20703, 0);




WITH DailySubmissions AS (
    SELECT 
        submission_date,
        hacker_id,
        COUNT(submission_id) AS submissions_count
    FROM Submissions
    GROUP BY submission_date, hacker_id
),
MaxSubmissions AS (
    SELECT 
        submission_date,
        hacker_id,
        submissions_count,
        RANK() OVER (PARTITION BY submission_date ORDER BY submissions_count DESC, hacker_id ASC) AS rank
    FROM DailySubmissions
),
TopHackerPerDay AS (
    SELECT 
        ds.submission_date,
        ds.hacker_id,
        h.name
    FROM MaxSubmissions ds
    JOIN Hackers h ON ds.hacker_id = h.hacker_id
    WHERE ds.rank = 1
)
SELECT 
    t.submission_date,
    t.hacker_id,
    t.name
FROM TopHackerPerDay t
ORDER BY t.submission_date;
