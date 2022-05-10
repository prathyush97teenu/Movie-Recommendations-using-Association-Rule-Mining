# Apriori
#options(warn=-1) 
# install.packages('arules')
#install.packages("arulesViz")
#install.packages("graphlayouts")
library(igraph)   
library(ggraph)   
library(graphlayouts)

library(arules)
library(arulesViz)
library(ggplot2)
dataset = read.csv('C:\\Users\\prath\\Desktop\\CA683 DA&DM Assignment\\ml-1m\\action_transactions.csv', header = FALSE)
dataset = read.transactions('C:\\Users\\prath\\Desktop\\CA683 DA&DM Assignment\\ml-1m\\action_transactions.csv', sep = ',', rm.duplicates = TRUE)
summary(dataset)
itemFrequencyPlot(dataset, topN = 10)

# Training Apriori on the dataset
rules = apriori(data = dataset, parameter = list(support = 0.2, confidence = 0.7, minlen = 3, maxlen = 3))

gi <- generatingItemsets(rules)

#removing duplicates on lhs and rhs
d <- which(duplicated(gi))
rules_no_duplicates <- rules[-d]
rules_no_duplicates

# Visualizing the results (top 5 rules)
#??arulesViz
inspect(sort(rules_no_duplicates, by = 'support')[1:5])

plot(rules_no_duplicates, interactive = TRUE)

#Visualise using a parallel coordinates plot
fiveRules <- sort(rules_no_duplicates, by = 'support')[1:5]
inspect(fiveRules)

plot(fiveRules, method = "paracoord", control = list(reorder = TRUE))


??arulesViz




