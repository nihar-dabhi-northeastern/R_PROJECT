library(dplyr)
library(ggplot2)

cricket_data = read.csv("C:/Users/nihar/Downloads/df_batting.csv")

Virat_Kohli_data = cricket_data %>% filter(cricket_data$batsmanName == "Virat Kohli")

qplot(balls, runs, data = Virat_Kohli_data, geom = c("point", "smooth"), method = "lm")

lmModel <- lm(runs ~ balls, data=Virat_Kohli_data)

new_data <- data.frame(balls = 45)

predict_next_match_run = predict(lmModel, new_data)

print(predict_next_match_run)