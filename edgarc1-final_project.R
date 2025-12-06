library(ggplot2) #Adding packages with necessary commands

data <- read_csv("data.csv") #Storing the data.csv in an object

table(data$gov_party, data$gov_age) #A descriptive statistics table

boxplot(gov_age ~ gov_party, data = data, #Creating the boxplot with x, y,and data
        main = "Figure 1: Age of Gov Against Party", #Naming the title
        xlab = "Party", #Naming the x-axis
        ylab = "Age", #Naming the y-axis
        sub = "|1 - Democratic | 2 - Republican | 3 - Other|", #Naming the subtitle
        col = c("dodgerblue1", "firebrick1", "darkorchid1"), #Coloring the boxes by the color of their parties (and purple, being the combination of the other two)
        medcol = "black")  #Coloring the median line

figure2 <- aov(gov_age ~ gov_party, #Creating and storing the ANOVA
               data = data) #Setting the data

summary(figure2) #Viewing the ANOVA

figure3 <- lm(gov_age~gov_party, data=data) #Storing the Q-Q model which will test the assumption of normality

residuals <- resid(figure3) #Creating an object storing residuals

ggplot(data.frame(residuals = residuals), aes(x = residuals)) + #Visualizing residuals to test the noramlity assumption
  geom_histogram(binwidth = 0.5, fill = "lightblue", color = "darkblue") + #Deciding binwidth and colors
  ggtitle("Figure 3: Histogram of Residuals") + #Naming the title
  xlab("Residuals") + #Naming the x-axis
  ylab("Frequency") #Naming the y-axis
