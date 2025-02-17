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

### Create scatter plot plotting pressure against wind speed ----
  #### No need to create a separate function: plot() does the job just fine. 
plot(x = cyclones$pressure, y = cyclones$speed, 
                   main = "Cyclone Pressure vs Speed", 
                   xlab = "Pressure (hPa)", ylab = "Speed (kph)", 
                   col = "blue")

### Function to calculate a mean pressure and speed by year, create bar plot ----
library(ggplot2)
library(dplyr)
plot_mean_pressure_speed_chart(cyclones)


### Create a bar chart displaying average duration (in hours) of storm by year ----
nrow(cyclones[cyclones$year, ])

#### Calculate duration in days ----
cyclones$duration_days <- as.numeric(
  difftime(cyclones$end,cyclones$start, units = "days")
)

#### Calculate duration in hours ----
cyclones$duration_hours <- as.numeric(
  difftime(cyclones$end,cyclones$start, units = "hours")
)

#### Calculate average duration ----
average_duration <- mean(cyclones$duration_hours, na.rm = TRUE)
average_duration 
summary(average_duration)

#### Calculate average duration by year ----
average_duration_year <- cyclones %>%
  group_by(year) %>%
  summarise(average_duration = mean(duration_hours, na.rm = TRUE))
average_duration_year


##### Create line plot ----
plot(
  average_duration_year$year,
  average_duration_year$average_duration,
  type = "o",  # 'o' for both points and lines
  col = "blue",
  xlab = "Year",
  ylab = "Average Duration (hours)",
  main = "Average Storm Duration by Year"
)

#### Create bar plot ----
barplot (
  average_duration_year, 
  horiz = FALSE,cyclones$year %in% 2017:2021,
  xlab = "year",
  ylab = "duration by hours",
  main = "Duration of Cyclones by Year"
)


average_duration <- mean(cyclones$duration, na.rm = TRUE)

summary(average_duration)

average_duration <- as.numeric(
  difftime(cyclones$end,cyclones$start, units = "hours")
)

average_duration

average_duration_graph <- table (average_duration, cyclones$year)
average_duration_graph

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

