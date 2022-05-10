library(arules)
library(arulesViz)
library(ggplot2)



dataset = read.csv('C:\\Users\\prath\\Desktop\\CA683 DA&DM Assignment\\ml-1m\\action_transactions.csv', header = FALSE)
dataset = read.transactions('C:\\Users\\prath\\Desktop\\CA683 DA&DM Assignment\\ml-1m\\action_transactions.csv', sep = ',', rm.duplicates = TRUE)
#summary(dataset)
itemFrequencyPlot(dataset, topN = 10)

# Training Apriori on the dataset
performance_calc_apriori <- function(sup_value) {
start.time <- Sys.time()
rules = apriori(data = dataset, parameter = list(support = sup_value, confidence = 0.1, minlen = 2, maxlen = 2))

gi <- generatingItemsets(rules)
#removing duplicates on lhs and rhs
d <- which(duplicated(gi))
rules_no_duplicates <- rules[-d]
rules_no_duplicates

end.time <- Sys.time()
time.taken <- end.time - start.time
time.taken
}


# Training Eclat on the dataset
performance_calc_eclat <- function(sup_value) {
  start.time <- Sys.time()
  eclat_sets = eclat(data = dataset, parameter = list(support = sup_value, minlen = 2))
  end.time <- Sys.time()
  time.taken <- end.time - start.time
  time.taken
}


list1 = list()
for(i in c(0.05,0.1,0.15,0.2,0.25,0.3)){
  list1[[length(list1)+1]] = performance_calc_apriori(i)  
}
list1

list2 = list()
for(i in c(0.05,0.1,0.15,0.2,0.25,0.3)){
  list2[[length(list2)+1]] = performance_calc_eclat(i)  
}
list2

#Apriori's performance
x <- c(0.05,0.1,0.15,0.2,0.25,0.3)
y1 <- c(0.0926981,0.07873702,0.07779098,0.07380295,0.0758512,0.07779002)

plot(x, y1, type = "l",col = "red", xlab = "Minimum Support Threshold", ylab = "Time in Seconds", 
     main = "Performance of Apriori vs ECLAT", ylim=c(0.05,0.1))

#ECLAT's performance
y2 <- c(0.07779193,0.06779194,0.06486106,0.06379485,0.05983996,0.061836)
par(new=TRUE)
lines(x, y2, col = "blue")
legend(x = "topright",          # Position
       legend = c("Apriori", "ECLAT"),  # Legend texts
       lty = c(1, 1),           # Line types
       col = c(2, 4),           # Line colors
       lwd = 2)      


