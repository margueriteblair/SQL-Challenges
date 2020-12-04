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

7. SELECT name FROM EMPLOYEE ORDER BY name;

8. SELECT name FROM STUDENTS WHERE Marks > 75 ORDER BY SUBSTRING(name, LEN(name)-2, 3), ID;