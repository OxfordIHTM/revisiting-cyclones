# Revisiting cyclones exercise ----

## Load bespoke functions in R folder and load libraries ----
for (i in list.files("R", full.names = TRUE)) source(i)
library(openxlsx2)


## Read cyclones dataset ----
cyclones <- read_data(
  url = "https://github.com/OxfordIHTM/teaching_datasets/raw/refs/heads/main/cyclones.xlsx", 
  destfile = "data/cyclones.xlsx"
)

source("scripts/angela.R")

## Describe the structure of the data ----
str(cyclones)

## Describe data ----
class(cyclones)
nrow(cyclones)
ncol(cyclones)
names(cyclones)

## Get summary statistics ----
summary(cyclones)

## In-class task: Plotting interesting things from the data ----

### Create scatter plot plotting pressure against wind speed
plot(x = cyclones$pressure, y = cyclones$speed, 
                   main = "Cyclone Pressure vs Speed", 
                   xlab = "Pressure (hPa)", ylab = "Speed (kph)", 
                   col = "blue")

### Create a bar chart displaying duration (in hours) of storm by year ----
nrow(cyclones[cyclones$year, ])

cyclones$duration <- as.numeric(
  difftime(cyclones$end,cyclones$start, units = "days")
)

average_duration <- mean(cyclones$duration, na.rm = TRUE)

cyclones$duration[cyclones$duration <= average_duration ] <- 0

cyclones$duration[cyclones$duration > average_duration] <- 1

cyclones$duration <- factor(
  cyclones$duration,
  labels = c("below average", "above average")
)

summary(cyclones$duration)

cyclones$duration <- as.numeric(
  difftime(cyclones$end,cyclones$start, units = "hours")
)

cyclones$duration 

duration.graph <- table (cyclones$duration, cyclones$year)
duration.graph

barplot (
  duration.graph, 
  horiz = FALSE,cyclones$year %in% 2017:2021,
  xlab = "year",
  ylab = "duration by hours",
  main = "Duration of Cyclones by Year"
)

cyclones[cyclones$year %in% 2017:2021, "speed"]

mean(cyclones[cyclones$year == 2017:2021, "speed"], na.RM = TRUE)

mean(cyclones[cyclones$year %in% 2017:2021, "speed"], na.RM = TRUE)