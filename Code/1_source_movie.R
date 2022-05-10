library("readxl")
library("dplyr")
library("plyr")

data <- read.csv('C:\\Users\\prath\\Desktop\\CA683 DA&DM Assignment\\ml-1m\\original\\movies.csv')
head(data, n=12)

data$movie <- gsub(':{1}$', '', data$movie)
data$movie <- gsub(', The', '', data$movie)
data$genre <- gsub("\\|.*","", data$genre)



write.csv(data,"C:\\Users\\prath\\Downloads\\ml-1m\\movie.csv", row.names = FALSE)
