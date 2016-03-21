SELECT * FROM movies;

SELECT title, movieid FROM movies;
LIMIT 10

SELECT * FROM movies WHERE movieid = 485;

SELECT movieid FROM movies WHERE title = 'Made in America (1993)';

SELECT * FROM movies
ORDER BY title ASC
LIMIT 10;

SELECT * FROM movies WHERE title LIKE '%(2002)%';

SELECT * FROM movies WHERE title like '%Godfather%';
SELECT title FROM movies WHERE movieid=858;

SELECT * FROM movies WHERE genres like '%Comedy%';

SELECT * FROM movies WHERE genres like '%Comedy%' and title like '%1992%';

SELECT * FROM tags WHERE tag like '%death%';
SELECT * FROM movies WHERE movieid in (36, 1006, 1237, 1545, 1719, 2312, 3502, 4160, 4296, 6852, 8382) AND genres LIKE '%Comedy%';

SELECT * FROM movies WHERE title LIKE '%Super%' AND (title LIKE '%2001%' OR title LIKE '%2002%');







SELECT m.title, r.rating
FROM movies m JOIN ratings r ON m.movieid = r.movieid
WHERE m.title = 'Godfather, The (1972)';

SELECT m.title, r.rating
FROM movies m JOIN ratings r ON m.movieid = r.movieid
WHERE m.title = 'Godfather, The (1972)'
ORDER BY r.timestamp ASC;

SELECT m.title, l.imdbid, m.genres
FROM movies m JOIN links l ON m.movieid = l.movieid
WHERE m.title LIKE '%(2005)%' and m.genres LIKE '%Comedy%';

SELECT m.title, r.rating
FROM movies m LEFT JOIN ratings r ON m.movieid = r.movieid
WHERE r.rating is NULL;


SELECT AVG(r.rating), count(r.rating)
FROM movies m LEFT JOIN ratings r ON m.movieid = r.movieid
WHERE m.title = 'Godfather, The (1972)'

SELECT count(movieid) FROM movies
WHERE genres LIKE '%Horror%'


SELECT AVG(rating)
FROM ratings
WHERE userid = '35';

SELECT count(rating), userid
FROM ratings
GROUP BY userid
ORDER BY count(rating) DESC
LIMIT 1;


SELECT AVG(rating), userid
FROM ratings
GROUP BY userid
ORDER BY AVG(rating) DESC
LIMIT 1;

SELECT userid, AVG(rating), count(rating)
FROM ratings
GROUP BY userid
HAVING count(rating) > 50
ORDER BY AVG(rating) DESC;

SELECT m.title, AVG(r.rating)
FROM movies m LEFT JOIN ratings r ON m.movieid = r.movieid
GROUP BY m.title
HAVING AVG(r.rating) > 4
ORDER BY AVG(r.rating);


SELECT g.genres, count(r.rating), AVG(r.rating)
FROM ratings r JOIN movie_genre mg ON r.movieid = mg.movieid
JOIN genre g ON mg.genre_id = g.id
GROUP BY g.genres
ORDER BY AVG(r.rating) DESC;