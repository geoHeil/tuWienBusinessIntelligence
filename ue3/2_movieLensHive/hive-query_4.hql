SELECT movieId, VARIANCE(rating) AS v
FROM movieLens.ratings
WHERE timestamp BETWEEN unix_timestamp('2015-01-01 00:00:00') AND unix_timestamp('2015-12-31 00:00:00')
GROUP BY movieId
ORDER BY v DESC
LIMIT 10
