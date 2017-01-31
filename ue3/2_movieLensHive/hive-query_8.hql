SELECT title, AVG(rating), COUNT(*) AS cn
FROM movieLens.ratings
	JOIN movieLens.movies ON ratings.movieId = movies.movieId
WHERE array_contains(genres, 'Film-Noir')
GROUP BY movies.title, movies.movieId
HAVING cn > 10
ORDER BY cn DESC
LIMIT 10
