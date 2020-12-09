1. --HOW MANY STOPS ARE IN THE DATABASE
SELECT DISTINCT COUNT(id) FROM stops

2. --Find the id value for the stop 'Craiglockhart'
SELECT id FROM stops WHERE name = 'Craiglockhart';

3. --Give the id and the name for the stops on the '4' 'LRT' service.
SELECT id, name FROM stops INNER JOIN route ON route.stop = stops.id WHERE num = 4 ORDER BY pos;
