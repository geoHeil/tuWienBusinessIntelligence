SELECT genome_tags.tag, genome_scores.relevance
FROM genome_tags
  JOIN genome_scores ON genome_tags.tagid = genome_scores.tagid
WHERE movieId = 1
ORDER BY genome_scores.relevance DESC
LIMIT 15
