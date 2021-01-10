1. SELECT company.company_code, company.founder, COUNT(DISTINCT lead_manager_code), COUNT(DISTINCT senior_manager_code),COUNT(DISTINCT manager_code), COUNT(DISTINCT employee_code) FROM company INNER JOIN employee ON employee.company_code = company.company_code 
GROUP BY company.company_code, company.founder
ORDER BY company.company_code;

2. select TRUNCATE(ABS(MIN(lat_n)-MAX(lat_n)) + ABS(MIN(long_w)-MAX(long_w)), 4) from station;

3. select TRUNCATE(ROUND(ABS(MIN(lat_n)-MAX(lat_n)) + ABS(MIN(long_w)-MAX(long_w)),4), 4) from station;

4. WITH salaries AS (
    SELECT (months * salary) total_salary FROM Employee
)
select total_salary, COUNT(*) from salaries
group by total_salary
having total_salary = (SELECT MAX(total_salary) FROM salaries);


5. SELECT SUM(POPULATION) FROM CITY WHERE DISTRICT = 'California'

6. --BST labelling
SELECT N,
CASE 
WHEN P IS NULL THEN 'Root'
WHEN N IN (SELECT P FROM bst) THEN 'Inner'
ELSE 'Leaf'
END AS relationship
FROM bst
ORDER BY N;

7. --find the euclidian distance between two points on a 2D plane
SELECT TRUNCATE(SQRT(POWER(MIN(LAT_N)-MAX(LAT_N) ,2)+POWER(MIN(LONG_W)-MAX(LONG_W),2)), 4) FROM STATION;

8. --FINDING THE MEDIAN
WITH median AS (
SELECT TOP 1 PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY lat_n) OVER() med
FROM station
)
SELECT CAST(ROUND(med,4) AS DECIMAL(16, 4)) FROM median;

9. --Report generating
SELECT IF(Grades.Grade < 8, NULL, Students.Name), Grades.Grade, Students.Marks FROM Students INNER JOIN Grades ON Students.Marks BETWEEN Grades.Min_Mark AND Grades.Max_Mark ORDER BY Grades.grade DESC, Students.Name;

10. --Reviewing aggregates
SELECT AVG(POPULATION) FROM CITY WHERE DISTRICT = 'CALIFORNIA';

11. --finding symmetric pairs
SELECT f1.X, f1.Y FROM Functions f1
INNER JOIN Functions f2 ON f1.X=f2.Y AND f1.Y=f2.X
GROUP BY f1.X, f1.Y
HAVING COUNT(f1.X)>1 or f1.X<f1.Y
ORDER BY f1.X;

12. --reversing the triangle 2
WITH cte as (
SELECT 1 AS Number
    UNION ALL
    SELECT Number+1 FROM cte
    WHERE Number < 20
)
SELECT replicate('* ', Number) FROM cte;

13. --type of triangle
SELECT
CASE
WHEN A = B AND B = C THEN 'Equilateral'
WHEN (A != B AND B != C AND A != C) AND ((A+B >= C and a < c and b < c) OR (B+C >= A AND B < A AND C < A) OR (C+A>=B AND C < B AND A < B)) THEN 'Scalene'
WHEN (A = B OR B = C OR A = C) AND ((A + B > C AND A < C AND B < C) OR (B + C > A AND B < A AND C < A) OR (A + C > B AND A < B AND C < B)) THEN 'Isosceles'
ELSE 'Not A Triangle'
END AS triangleType
FROM TRIANGLES;

14. --Challenges 2
SELECT Hackers.hacker_id, Hackers.name, SUM(t2.totalscore) totalscore2 FROM Hackers INNER JOIN
(SELECT Submissions.hacker_id, MAX(Submissions.score) AS totalscore FROM Submissions GROUP BY Submissions.challenge_id, Submissions.hacker_id) AS t2 ON t2.hacker_id = Hackers.hacker_id GROUP BY Hackers.hacker_id, Hackers.name HAVING totalscore2 > 0 ORDER BY totalscore2 DESC, Hackers.hacker_id;


15. --weather station 15
SELECT CAST(ROUND(LONG_W, 4) AS NUMERIC(16, 4)) FROM STATION WHERE LAT_N = (SELECT MAX(LAT_N) FROM STATION WHERE LAT_N < 137.2345);