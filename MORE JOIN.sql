SQLZOO_SOLUTIONS

SECTION 7
/// MORE JOIN ///


#1962 movies

SELECT id, title FROM movie
WHERE yr=1962


#When was Citizen Kane released?

SELECT yr FROM movie
WHERE title = 'Citizen Kane'


#Star Trek movies

SELECT id, title, yr FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr


#id for actor Glenn Close

SELECT id FROM actor
WHERE name='Glenn Close'


#id for Casablanca

SELECT id FROM movie
WHERE title='Casablanca'


#Cast list for Casablanca

SELECT name FROM actor, casting
WHERE id=actorid AND movieid= (SELECT id FROM movie WHERE title='Casablanca')


#Alien cast list

SELECT name FROM actor
JOIN casting ON (id=actorid AND movieid = (SELECT id FROM movie WHERE title='Alien'))


#Harrison Ford movies

SELECT title FROM movie
JOIN casting ON (id=movieid AND actorid = (SELECT id FROM actor WHERE name='Harrison Ford'))


#Harrison Ford as a supporting actor

SELECT title FROM movie
JOIN casting ON (id=movieid AND actorid = (SELECT id FROM actor WHERE name='Harrison Ford') AND ord!=1)


#Lead actors in 1962 movies

SELECT title, name FROM movie 
JOIN casting ON (id=movieid)
JOIN actor ON (actor.id = actorid)
WHERE ord=1 AND  yr = 1962


#Busy years for Rock Hudson

SELECT yr,COUNT(title) FROM movie 
JOIN casting ON movie.id=movieid
JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2


#Lead actor in Julie Andrews movies

SELECT title, name FROM movie
JOIN casting ON (movieid=movie.id AND ord=1)
JOIN actor ON (actorid = actor.id)
WHERE movie.id IN (SELECT movieid FROM casting WHERE actorid IN (SELECT id FROM actor WHERE name='Julie Andrews'))


#Actors with 15 leading roles

SELECT name FROM actor
JOIN casting ON (id = actorid AND (SELECT COUNT(ord) FROM casting WHERE actorid = actor.id AND ord=1)>=15)
GROUP BY name


#released in the year 1978

SELECT title, COUNT(actorid) AS cast FROM movie
JOIN casting ON id = movieid WHERE yr = 1978
GROUP BY title
ORDER BY cast DESC, title


#with 'Art Garfunkel'

SELECT DISTINCT name FROM actor
JOIN casting ON id=actorid
WHERE movieid IN (SELECT movieid FROM casting JOIN actor ON (actorid=id AND name='Art Garfunkel')) AND name != 'Art Garfunkel'
GROUP BY name