1.SELECT DISTINCT CITY 
FROM STATION
WHERE CITY LIKE '[^aeiouAEIOU]%[^aeiouAEIOU]';

2.SELECT NAME FROM CITY WHERE COUNTRYCODE = 'JPN';

3. SELECT CASE             
            WHEN A + B > C AND B + C > A AND A + C > B THEN
                CASE 
                    WHEN A = B AND B = C THEN 'Equilateral'
                    WHEN A = B OR B = C OR A = C THEN 'Isosceles'
                    ELSE 'Scalene'
                END
            ELSE 'Not A Triangle'
        END
FROM TRIANGLES;

4. SELECT CASE             
        WHEN (A+B>=C AND B+C>=A AND A+C>=B) AND A=B AND B=C THEN "Equilateral"
        WHEN (A+B>C AND B+C>A AND A+C>B) AND A=B OR B=C OR A=C THEN "Isosceles"
        WHEN (A+B>=C AND B+C>=A AND A+C>=B) AND A!=B AND B!=C AND A!= C THEN "Scalene"
        ELSE "Not A Triangle"
END
FROM TRIANGLES;

5. SELECT CASE             
        WHEN A=B AND B=C THEN "Equilateral"
        WHEN (A+B>C AND B+C>A AND A+C>B) AND A=B OR B=C OR A=C THEN "Isosceles"
        WHEN (A+B>=C AND B+C>=A AND A+C>=B) AND A!=B AND B!=C AND A!= C THEN "Scalene"
        ELSE "Not A Triangle"
END
FROM TRIANGLES;

6.SELECT name FROM Employee WHERE salary > 2000 AND months < 10 ORDER BY employee_id;

6.5 SELECT DISTINCT CITY FROM STATION WHERE CITY LIKE '[aeiouAEIOU]%';

7. SELECT name FROM EMPLOYEE ORDER BY name;

8. SELECT name FROM STUDENTS WHERE Marks > 75 ORDER BY SUBSTRING(name, LEN(name)-2, 3), ID;

9.SELECT TOP 1 CITY, LEN(CITY) FROM STATION ORDER BY LEN(CITY), CITY;
SELECT TOP 1 CITY, LEN(CITY) FROM STATION ORDER BY LEN(CITY) DESC, CITY;

10. SELECT DISTINCT CITY FROM STATION WHERE ID % 2 = 0;

11.SELECT CONCAT(Name,'(',SUBSTRING(Occupation, 1, 1), ')') FROM OCCUPATIONS ORDER BY Name;
SELECT CONCAT('There are a total of ', COUNT(Occupation), ' ', LOWER(Occupation), 's.') FROM OCCUPATIONS GROUP BY Occupation order by COUNT(Occupation);

12. SELECT DISTINCT CITY FROM STATION WHERE CITY NOT LIKE "[aeiouAEIOU]%" OR CITY NOT LIKE "%[aeiouAEIOU]";

--the square brackets aren't actually necessary
--you need to aggregate the data within the PIVOT function
13. SELECT
    [Doctor], [Professor], [Singer], [Actor]
FROM
(
    SELECT ROW_NUMBER() OVER (PARTITION BY OCCUPATION ORDER BY NAME) [RowNumber], * FROM OCCUPATIONS
) AS tempTable
PIVOT
(
    MAX(NAME) FOR OCCUPATION IN ([Doctor], [Professor], [Singer], [Actor])
) AS pivotTable

14. SELECT IF(grade < 8, NULL, name), grade, mark FROM students LEFT JOIN grades on STUDENTS.marks BETWEEN grades.min_mark AND grades.max_mark
ORDER BY grade DESC,name;

15. 
/*
Enter your query here.
*/
select h.hacker_id, name, sum(score) as total_score
from
hackers as h inner join
/* find max_score*/
(select hacker_id,  max(score) as score from submissions group by challenge_id, hacker_id) max_score

on h.hacker_id=max_score.hacker_id
group by h.hacker_id, name

/* don't accept hackers with total_score=0 */
having total_score > 0

/* finally order as required */
order by total_score desc, h.hacker_id
;