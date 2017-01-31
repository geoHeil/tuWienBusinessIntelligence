SELECT title, AVG(rating), COUNT(*) AS cn
FROM movieLens.ratings
	JOIN movieLens.movies ON ratings.movieId = movies.movieId
GROUP BY movies.title, movies.movieId
HAVING cn > 1000
ORDER BY cn DESC
LIMIT 10
