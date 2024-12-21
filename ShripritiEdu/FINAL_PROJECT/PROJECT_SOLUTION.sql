-- ------------FINAL PROJECT QUERIES(STARTS)---------
USE FINAL_PROJECT;
-- ANALYSIS--
SELECT ROUND(AVG(IMDBSCORE),2) Avarage_IMDB_Score,GENREID FROM NETFLIX_ORIGINALS GROUP BY GENREID;
SELECT ROUND(AVG(IMDBSCORE),2) Avarage_IMDB_Score,GENREID FROM NETFLIX_ORIGINALS GROUP BY GENREID HAVING AVG(IMDBSCORE)>7.5;
SELECT TITLE,IMDBSCORE FROM NETFLIX_ORIGINALS ORDER BY IMDBSCORE DESC;
SELECT TITLE,RUNTIME FROM NETFLIX_ORIGINALS ORDER BY RUNTIME DESC LIMIT 10;
SELECT A.TITLE,B.GENRE FROM NETFLIX_ORIGINALS A INNER JOIN GENRE_DETAILS B ON A.GENREID=B.GENREID;
SELECT TITLE,GENREID,IMDBSCORE,RANK() OVER (PARTITION BY GENREID ORDER BY IMDBSCORE DESC) RANKED FROM NETFLIX_ORIGINALS;
SELECT TITLE,IMDBSCORE FROM NETFLIX_ORIGINALS WHERE IMDBSCORE>(SELECT AVG(IMDBSCORE) FROM NETFLIX_ORIGINALS);
SELECT GENREID,COUNT(GENREID) Numbers FROM NETFLIX_ORIGINALS GROUP BY GENREID;
SELECT B.GENRE,COUNT(B.GENRE) TOTAL FROM (SELECT GENREID,IMDBSCORE FROM NETFLIX_ORIGINALS WHERE IMDBSCORE>8) A INNER JOIN GENRE_DETAILS B ON A.GENREID=B.GENREID GROUP BY B.GENRE HAVING TOTAL>5;
-- |-- SELECT GENREID,COUNT(GENREID) FROM NETFLIX_ORIGINALS WHERE IMDBSCORE>8 GROUP BY GENREID

SELECT g.GENRE, COUNT(*) AS TOTAL, AVG(n.IMDBSCORE) AS AVG_IMDBSCORE
FROM NETFLIX_ORIGINALS n
JOIN GENRE_DETAILS g ON n.GENREID = g.GENREID
GROUP BY g.GENRE
ORDER BY AVG_IMDBSCORE DESC
LIMIT 3


-- ------------FINAL PROJECT QUERIES(ENDS)-----------