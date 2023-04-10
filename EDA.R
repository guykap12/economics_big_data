# Load necessary libraries
library(tidyverse)
library(lubridate)
library(plotly)

# Load the data
listings <- read_csv("EinBDW_github/datasets/listings.csv")
calendar <- read_csv("EinBDW_github/datasets/calendar.csv")

# View the structure of the data
str(listings)
str(calendar)

# Summary statistics for numeric columns in listings
summary(listings %>% select_if(is.numeric))

# Summary statistics for numeric columns in calendar
summary(calendar %>% select_if(is.numeric))

# Interactive histogram of price in listings
listings %>%
  plot_ly(x = ~price, type = "histogram", nbinsx = 30)

# Interactive histogram of price in calendar
calendar %>%
  plot_ly(x = ~price, type = "histogram", nbinsx = 30)

# Interactive plot of availability over time
calendar %>%
  mutate(date = ymd(date)) %>%
  plot_ly(x = ~date, y = ~available, type = "scatter", mode = "lines")