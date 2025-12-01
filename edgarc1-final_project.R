library(ggplot2)

data <- read_csv("data.csv") #Storing the data.csv in an object

table(data$gov_party, data$gov_age) #A descriptive statistics table

ggplot(data, aes(x = gov_party, y = gov_age)) +
  geom_jitter(width = 0.15, height = 0.15, alpha = 0.4) + 
  scale_y_continuous(breaks = c(35, 40, 45, 50, 55, 60, 65, 70, 75)) +
  scale_x_continuous(breaks = c(1, 2, 3)) +
  labs(
    title = "Age of Gov. Against Party",
    x = "Party (1 - Democrats, 2 - Republicans, 3 - Other)",
    y = "Age When Elected"
  ) +
  theme_linedraw()

boxplot(gov_age ~ gov_party, data = data,
        main = "Age of Gov Against Party",
        xlab = "Party",
        ylab = "Age",
        sub = "|1 - Democratic | 2 - Republican | 3 - Other|", 
        col = c("dodgerblue1", "firebrick1", "darkorchid1"),
        medcol = "black")

o1 <- aov(gov_age ~ gov_party,
               data = data)

summary(o1)
