# Apriori Algorithm
#### IMP look for the intitution tutorial
# Data processing
# This data is containing so many items bought from this store. 
dataset <- read.csv("Market_Basket_Optimisation.csv", header = FALSE)
# Transform this matrix into sparse matrix that means it contains large no. of zeros.
#install.packages("arules")
library(arules)
dataset <- read.transactions('Market_basket_Optimisation.csv', sep = ",",
                             rm.duplicates = TRUE )# rm.dupliates remove duplicate transcations
summary(dataset)
# Visualize 
# Top ten items purchased by the customers
itemFrequencyPlot(dataset, topN = 10)
# Training Apriori on the dataset
#support = no of items(i) that are bought at least 3-4 times a day(oftently)for a week
# divide by total no .of transcations
# Calculate support
3*7/7501 
# Start confidence with default value = 0.8
rules <- apriori(dataset, parameter = list(support =.003 , confidence = 0.8))
# It shows there is no rules are set if we set confidence =0.8
# lets change the confidence level to half
rules <- apriori(dataset, parameter = list(support =.003 , confidence = 0.4))
# now I see 282 rules
# Visulaizing the results
inspect(sort(rules, by ="lift")[1:15])
# Now we see the items those have most support we see in the  most of the baskets.
# Reduce the confidence by half of 8
rules <- apriori(dataset, parameter = list(support =.003 , confidence = 0.2))
#  Now we see 1348 rules 
# Visulaizing the results, it looks more relvant rule if person buys mineral water,
# whole wheat pasta, he might buy olive oil.
inspect(sort(rules, by = "lift")[1:15])

# Lets change the support the items those are bought 4 times a day and in a week 
4*7/7501
rules <- apriori(dataset, parameter = list(support = 0.004, confidence = 0.2))
# Now we see 811 rules
# Visualzing the result
inspect(sort(rules, by = "lift")[1:15])
# What we see here that the association with 
#the items those are bought by most of the customers will buy the associtaed
#items in the rule like light cream will go with  chicken
