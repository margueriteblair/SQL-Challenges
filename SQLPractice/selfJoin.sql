1. --HOW MANY STOPS ARE IN THE DATABASE
SELECT DISTINCT COUNT(id) FROM stops

2. --Find the id value for the stop 'Craiglockhart'
SELECT id FROM stops WHERE name = 'Craiglockhart';

3. --Give the id and the name for the stops on the '4' 'LRT' service.
SELECT id, name FROM stops INNER JOIN route ON route.stop = stops.id WHERE num = 4 ORDER BY pos;

4. --The query shown gives the number of routes that visit either London Road (149) or Craiglockhart (53). Run the query and notice the two services that link these stops have a count of 2. Add a HAVING clause to restrict the output to these two routes.
SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num HAVING COUNT(*) = 2
