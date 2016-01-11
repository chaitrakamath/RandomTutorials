#FileName: AssociationRules-MBA.R
#Description: Implement Market Basket Analysis on a dummy grocery dataset to check list of items that are 
#most likely to be bought together so that these products can be placed close by in grocery store
#Reference: https://www.youtube.com/watch?v=Gy_nqzJMNrI
#Date: Jan 9th, 2016

#load library for association rules
library(arules)
data(package = 'arules')

#load grocery dataset and explore it
data(Groceries)
head(Groceries)
summary(Groceries)
inspect(Groceries[1:3])

#compute relative frequency of some items in the dataset and sort them 
sort(itemFrequency(Groceries), decreasing = TRUE)

#plot the items that are occur atleast 10% of the time in our dataset
itemFrequencyPlot(Groceries, support = 0.1)

#plot top 5 items in our dataset
itemFrequencyPlot(Groceries, topN = 5)

#compute confidence (probability that an item would be bought given that another set of items are bought)
model1 <- apriori(Groceries, parameter = list(support = 0.002, confidence = 0.15, minlen = 2))
summary(model1)
inspect(sort(model1, by = 'lift', decreasing = TRUE)[1:10])
