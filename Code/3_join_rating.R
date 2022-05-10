rating = read.csv('C:\\Users\\prath\\Desktop\\rating.csv', header = TRUE)
movie = read.csv('C:\\Users\\prath\\Desktop\\movie.csv', header = TRUE)


head(rating)
head(movie)

merged <- merge(rating, movie, by = "movie_id")
head(merged)

write.csv(merged,"C:\\Users\\prath\\Downloads\\ml-1m\\merged_rating.csv", row.names = FALSE)
