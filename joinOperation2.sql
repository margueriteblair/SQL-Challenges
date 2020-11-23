1. SELECT id, title
 FROM movie
 WHERE yr=1962
2. SELECT yr FROM movie WHERE title = 'Citizen Kane';
3. SELECT id, title, yr FROM movie WHERE title LIKE 'Star Trek%' ORDER BY yr;
4.SELECT id FROM actor WHERE name = 'Glenn Close'
5.SELECT id FROM movie WHERE title = 'Casablanca';
6.SELECT name FROM casting INNER JOIN actor ON actor.id = casting.actorid WHERE movieid=11768;