
SELECT title, genome_scores.relevance
FROM genome_tags
  JOIN genome_scores ON genome_tags.tagid = genome_scores.tagid
  JOIN movieLens.movies ON genome_scores.movieId = movies.movieId
WHERE tag = 'vienna'
ORDER BY genome_scores.relevance DESC
LIMIT 10
