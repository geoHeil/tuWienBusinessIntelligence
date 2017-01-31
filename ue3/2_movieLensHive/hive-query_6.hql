SELECT title, COUNT(*) AS cn
FROM movieLens.tags
	JOIN movieLens.movies ON tags.movieId = movies.movieId
WHERE tags.tag = 'mars'
GROUP BY movies.title, movies.movieId
ORDER BY cn DESC
LIMIT 15
