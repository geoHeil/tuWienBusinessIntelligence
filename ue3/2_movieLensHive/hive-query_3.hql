SELECT tag, COUNT(*) AS cn
FROM movieLens.tags
GROUP BY tag
ORDER BY cn DESC
LIMIT 10
