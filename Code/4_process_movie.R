library("readxl")
library("dplyr")
library("plyr")

data <- read.csv('C:\\Users\\prath\\Downloads\\ml-1m\\merged_drama.csv')
head(data,n=10)

#data$genre <- NULL

data <- data[complete.cases(data), ]
data %>% mutate(movie = as.factor(movie))

data$movie <- gsub(",","",data$movie)

glimpse(data)

transactionData <- ddply(data,c("user_id"),
                         function(df1)paste(df1$movie,
                                            collapse = ","))

head(transactionData)
str(transactionData)

#set column user_id to null of dataframe transactionData
transactionData$user_id <- NULL
#Remove column to items
colnames(transactionData) <- c("items")

data$movie <- as.factor(data$movie)
str(data)


write.csv(transactionData,"C:\\Users\\prath\\Downloads\\ml-1m\\drama_transactions.csv", quote = FALSE, row.names = FALSE)
