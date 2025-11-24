# STA145-Correlation-of-Governor-Party-on-Age-at-Election
A brief introductory review of the party and age when elected of American governors since 2000. The purpose of this correlation is merely review.

library(ggplot2)

data <- read_csv("data.csv") #Storing the data.csv in an object

table(data$gov_party, data$gov_age) #A descriptive statistics table

boxplot(gov_age ~ gov_party, data = data,
        main = "Age of Gov Against Party",
        xlab = "Party",
        ylab = "Age",
        sub = "|1 - Democratic | 2 - Republican | 3 - Other|", 
        col = c("darkblue", "darkred", "purple"),
        medcol = "white")
