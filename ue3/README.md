# Project documentation

business intelligence project lab 3

## map reduce 1

Implementation:
 - gradle as build system (gradle)
 - mapper to parse the file and map to (key: product, value: 1)
 - reducer which produces (key: product, value: avg(product)) which calculates the arithmetic mean per product

Questions:
 - How many invocations of map reduce are there:
   - 2x (1x mapper, 1x reducer) per product
 - where is most of the runtime spent
   - parsing the file
 - what is the expected speedup when run on multiple machines
   - a bit less than linear due to cooridnation overhead

 Result: first 15 scores per category

```
TODO
```

## map reduce 2 sentiment analysis

Implementation:
 - gradle as build system
 - mapper to parse the file and map to (key: product, value1: numberPosWords, value2: numberNegWords)
 - reducer which produces (key: product, value: sentiment(product, #posWords, #negWords)) which calculates the sentiment score per product

Questions:
 - How many invocations of map reduce are there:
   - 2x (1x mapper, 1x reducer) per product
 - where is most of the runtime spent
   - parsing the json
 - what is the expected speedup when run on multiple machines
   - less than linear due to shuffle overhead (network is slow)

 Result: first 10 products per category

```
TODO
```

## hive

### Results for all queries

**How many movies are there in total in the dataset?**

**How many movies in the dataset belong to the "Film-Noir" genre?**



**Which are the 10 most frequently assigned tags (by users, i.e., from the tags table)?**



**Which 10 movies were the most controversial in 2015 (i.e., had the highest variance in ratings between 2015/01/01 and 2015/12/31)?**



**Which movies (titles) are the 10 most frequently tagged and how often have they been tagged?**



**Which 15 movies (titles) have been most frequently tagged with the label "mars"?**



**Which are the 10 best-rated movies (on average; list titles) with more than 1000 ratings?**



**Which are the highest-rated "Film-Noir" movies with more than 10 ratings (average rating; movies with genre "Film-Noir", max. 10)?**



**What are the 15 most relevant genome tags for the movie "Toy Story (1995)" (movieId=1)?**



**Which are the 10 most relevant movies for Vienna (i.e., with the highest genome tag relevance rating for the tag "vienna")?**




### Description of your understanding of what happens behind the scenes
including a discuss on how many MR jobs your queries are translated into and why. Finally, also comment on what scale-up you would expect when running your queries on a real cluster in paralle

