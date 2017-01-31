LOAD DATA INPATH '/movieLens/movies.csv' OVERWRITE INTO TABLE movies;
LOAD DATA INPATH '/movieLens/tags.csv' OVERWRITE INTO TABLE tags;
LOAD DATA INPATH '/movieLens/ratings.csv' OVERWRITE INTO TABLE ratings;
LOAD DATA INPATH '/movieLens/genome-scores.csv' OVERWRITE INTO TABLE genome_scores;
LOAD DATA INPATH '/movieLens/genome-tags.csv' OVERWRITE INTO TABLE genome_tags;
