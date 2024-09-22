# Load necessary libraries
library(dplyr)
library(forecast)
library(lubridate)

# Read the data
read_data <- read.csv("C:/Users/nihar/Desktop/R_PROJECT/r_data/daily_AAPL.csv")

# Select relevant columns
data_frame <- select(read_data, timestamp, high, low, open, close)

data_frame = data_frame[1:30,]

# Convert 'timestamp' to Date type and create a time series object
data_frame$timestamp <- as.Date(data_frame$timestamp)
ts_data <- ts(data_frame$close, start = c(year(min(data_frame$timestamp)), month(min(data_frame$timestamp))), frequency = 365)

ts_data

# Plot the time series
plot(ts_data, main = "AAPL Daily Closing Prices", ylab = "Price", xlab = "Date", col = "blue")

# Fit the ARIMA model
arima_model <- auto.arima(ts_data)

# Summary of the model
summary(arima_model)

# Forecasting the next 10 days
forecasted_values <- forecast(arima_model, h = 10)

# Plot the forecast with different colors
plot(forecasted_values, main = "AAPL Closing Price Forecast", ylab = "Price", xlab = "Date", 
     col = "blue", shadecols = "lightgray", 
     flty = 1, fcol = "red", lwd = 2)

# Add custom colors for the forecast lines
lines(forecasted_values$mean, col = "red", lwd = 2)  # Forecasted values in red
