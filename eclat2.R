# Eclat
# It is simplified version of Apriori.. 

dataset <- read.transactions("Market_Basket_Optimisation.csv",sep= "," ,rm.duplicates = TRUE)
summary(dataset)
itemFrequencyPlot(dataset, topN = 10)
# most top 10 frequent items mineral water, eggs, spaghetti etc..
# Training Eclat on the dataset
rules <- eclat(dataset, parameter = list(support = 0.004, minlen = 2))
# it shows 845 sets in the data set
# Visualizing the  results
inspect(sort(rules, by= "support")[1:15])
# It shows most purchased items mineral water, spaghetti with the support of 0.059
# lets change the support .004 to .003
rules <- eclat(dataset, parameter = list(support = 0.003, minlen = 2))
# it shows the 1328 sets of 2 items
inspect(sort(rules, by= "support")[1:15])
# But again mineral water and spaghetti are the most purchased items with support of 0.059