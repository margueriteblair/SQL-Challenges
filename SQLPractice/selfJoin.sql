1. --HOW MANY STOPS ARE IN THE DATABASE
SELECT DISTINCT COUNT(id) FROM stops

2. --Find the id value for the stop 'Craiglockhart'
SELECT id FROM stops WHERE name = 'Craiglockhart';