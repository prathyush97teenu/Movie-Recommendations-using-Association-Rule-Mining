user = read.csv('C:\\Users\\prath\\Downloads\\ml-1m\\user.csv', header = TRUE)
movie = read.csv('C:\\Users\\prath\\Downloads\\ml-1m\\movie.csv', header = TRUE)


head(user)
head(movie)

merged <- merge(user, movie, by = "movie_id")
head(merged)

write.csv(merged,"C:\\Users\\prath\\Downloads\\ml-1m\\merged.csv", row.names = FALSE)
