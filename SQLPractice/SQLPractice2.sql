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