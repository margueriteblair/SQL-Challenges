1. SELECT id, title
 FROM movie
 WHERE yr=1962
2. SELECT yr FROM movie WHERE title = 'Citizen Kane';
3. SELECT id, title, yr FROM movie WHERE title LIKE 'Star Trek%' ORDER BY yr;
4.SELECT id FROM actor WHERE name = 'Glenn Close'
5.SELECT id FROM movie WHERE title = 'Casablanca';
6.SELECT name FROM casting INNER JOIN actor ON actor.id = casting.actorid WHERE movieid=11768;
7.SELECT name FROM casting INNER JOIN actor on actor.id = casting.actorid WHERE movieid=(SELECT id FROM movie WHERE title='Alien');
8.SELECT title FROM movie INNER JOIN casting ON movie.id = casting.movieid WHERE casting.actorid = (SELECT id FROM actor WHERE name='Harrison Ford');
9.SELECT title FROM movie INNER JOIN casting ON movie.id = casting.movieid WHERE casting.actorid = (SELECT id FROM actor WHERE name='Harrison Ford') AND casting.ord != 1
10.SELECT movie.title, actor.name FROM movie INNER JOIN casting ON movie.id = casting.movieid INNER JOIN actor ON actor.id = casting.actorid WHERE ord = 1 AND yr = 1962;
11.SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2
12. SELECT title, name 
FROM 
   movie  JOIN casting ON movie.id=movieid
          JOIN actor   ON actorid=actor.id
WHERE ord = 1 AND movieid IN ( SELECT movieid 
                               FROM casting JOIN actor
                               ON actorid = actor.id
                               WHERE name = 'Julie Andrews')