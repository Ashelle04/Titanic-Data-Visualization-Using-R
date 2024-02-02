library(data.table)
library(ggplot2)
setDT(titanic)

names(titanic)


titanic[,Pclass:=factor(Pclass,ordered = T)]

titanic[,Survived:=factor(Survived,ordered = T)]

#Creates a bar plot showing the count of people who survived and didn't survive in the Titanic.
ggplot(titanic, aes(x = Survived)) + geom_bar() + theme_bw()

# Bar plot displaying the count of survivors and non-survivors based on gender.

ggplot(titanic, aes(x = Survived,fill=Sex)) + geom_bar() + theme_bw()

#Bar plot showing the count of survivors and non-survivors based on passenger class.
ggplot(titanic, aes(x = Survived,fill=Pclass)) + geom_bar() + theme_bw()


ggplot(titanic, aes(x = Pclass,fill=Survived)) + geom_bar() + theme_bw()

#Bar plot with facets for gender, showing the count of survivors and non-survivors in each passenger class.
ggplot(titanic, aes(x = Pclass,fill=Survived)) + geom_bar() + theme_bw() +
  facet_wrap(~Sex)

#Bar plot with facets for passenger class, showing the count of survivors and non-survivors for each gender.

ggplot(titanic, aes(x = Sex,fill=Survived)) + geom_bar() + theme_bw() +
  facet_wrap(~Pclass)

#Boxplot displaying the distribution of age for survivors and non-survivors.

ggplot(titanic, aes(x = Survived,y=Age)) + geom_boxplot() + theme_bw()

#Histogram showing the distribution of ages in the Titanic dataset.

ggplot(titanic, aes(x = Age)) + geom_histogram(binwidth = 5,color='white') + 
  theme_bw()

# Histogram with survival status as fill, displaying the distribution of ages for survivors and non-survivors.
ggplot(titanic, aes(x = Age,fill=Survived)) + geom_histogram(binwidth = 5,color='white') + 
  theme_bw()
# Faceted histogram for passenger class, displaying the distribution of ages for survivors and non-survivors.
ggplot(titanic, aes(x = Age,fill=Survived)) + geom_histogram(binwidth = 5,color='white') + 
  theme_bw() + facet_wrap(~Pclass)
#Faceted histogram for both gender and passenger class, displaying the distribution of ages for survivors and non-survivors.


ggplot(titanic, aes(x = Age,fill=Survived)) + geom_histogram(binwidth = 5,color='white') + 
  theme_bw() + facet_wrap(Sex~Pclass)