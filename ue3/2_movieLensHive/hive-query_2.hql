SELECT COUNT(*)
FROM movieLens.movies
WHERE array_contains(genres, 'Film-Noir')
