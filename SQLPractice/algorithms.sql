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

16. SELECT CITY.Name FROM CITY INNER JOIN COUNTRY ON COUNTRY.Code = CITY.CountryCode WHERE COUNTRY.Continent = "Africa";

17. SELECT COUNTRY.Continent, AVG(CITY.Population) FROM COUNTRY INNER JOIN CITY ON COUNTRY.Code = CITY.CountryCode GROUP BY COUNTRY.Continent;

18. SELECT SUM(CITY.Population) FROM CITY JOIN COUNTRY ON CITY.CountryCode = COUNTRY.Code WHERE COUNTRY.Continent = 'Asia' GROUP BY COUNTRY.Continent;

19. --top competitors
SELECT Hackers.hacker_id, Hackers.name FROM Hackers INNER JOIN Submissions ON (Hackers.hacker_id = Submissions.hacker_id)
INNER JOIN Challenges ON (Challenges.challenge_id = Submissions.challenge_id)
INNER JOIN Difficulty ON Difficulty.difficulty_level = Challenges.difficulty_level
WHERE Difficulty.score = Submissions.score GROUP BY Hackers.hacker_id, Hackers.name 
HAVING COUNT(Hackers.hacker_id) > 1
ORDER BY COUNT(Hackers.hacker_id) DESC, Hackers.hacker_id;

20. --Olivanders 
SELECT W.id, P.age, W.coins_needed, W.power
FROM WANDS AS W
    INNER JOIN WANDS_PROPERTY AS P ON W.code = P.code
WHERE P.is_evil = 0 AND W.coins_needed = 
    (SELECT MIN(coins_needed)
     FROM WANDS AS W1
        INNER JOIN WANDS_PROPERTY AS P1 ON W1.code = P1.code
     WHERE W1.power = W.power AND P1.age = P.age)
ORDER BY W.power DESC, P.age DESC

21. --overview rough draft
SELECT Hackers.hacker_id, Hackers.name, COUNT(Challenges.challenge_id) FROM Hackers 
INNER JOIN Challenges ON Challenges.hacker_id = Hackers.hacker_id
GROUP BY Hackers.hacker_id, Hackers.name ORDER BY COUNT(challenge_id) DESC, Hackers.hacker_id;

select c.hacker_id, h.name ,count(c.hacker_id) as c_count

/* this is the join we want to output them from */
from Hackers as h
    inner join Challenges as c on c.hacker_id = h.hacker_id

/* after they have been grouped by hacker */
group by c.hacker_id
having 
    c_count = 
        /* the max count that anyone has */
        (SELECT MAX(temp1.cnt)
        from (SELECT COUNT(hacker_id) as cnt
             from Challenges
             group by hacker_id
             order by hacker_id) temp1)
    or c_count in 
        (select t.cnt
         from (select count(*) as cnt 
               from challenges
               group by hacker_id) t
         group by t.cnt
         having count(t.cnt) = 1)
order by c_count DESC, c.hacker_id;