# Revisiting cyclones exercise ----

## Load bespoke functions in R folder and load libraries ----
install.packages("openxlsx2")
library(openxlsx2)
library(readxl)

## Download and Read cyclones dataset ----
get_dataset <- function(a, b) {
  download.file(url = a, destfile = b)
  }

get_dataset(
  a="https://github.com/OxfordIHTM/teaching_datasets/raw/refs/heads/main/cyclones.xlsx",
            b="data/cyclones.xlsx")

cyclones.data <- read_xlsx(file = "data/cyclones.xlsx" )

#1. Description of the data such as number of records, any missing values, and description of relevant variables.

## Data frame description

dim(cyclones.data)

str(cyclones.data)

head(cyclones.data)

tail(cyclones.data)

summary(cyclones.data)

summary(cyclones.data$speed)

table(cyclones.data$category_code)

## Quantifying missing variables

count_na <- function(df) {
  
### Count the number of NA values in each column
  na_counts <- sapply(df, function(x) sum(is.na(x)))
  
### Convert the result to a data frame for better readability
  na_counts_df <- data.frame(Column = names(na_counts), NA_Count = na_counts)
  
  return(na_counts_df)
}

na_summary <- count_na(cyclones.data)

na_summary

## Calculating average duration of a cyclone

### Duration of cyclones in days

cyclones.data$duration <- as.numeric(
  difftime(cyclones.data$end,cyclones.data$start, units = "days")
  )

## Calculate the average duration and categorising data set
average_duration <- mean(cyclones.data$duration, na.rm = TRUE)

cyclones.data$duration[cyclones.data$duration <= average_duration ] <- 0

cyclones.data$duration[cyclones.data$duration > average_duration] <- 1

cyclones.data$duration <- factor(
  cyclones.data$duration,
  labels = c("below average", "above average")
)

summary(cyclones.data$duration)

## Summarising continuous data through grouping

summary(cyclones.data$pressure)

cyclones.data$pressure_grouped <- NA

cyclones.data$pressure_grouped [cyclones.data$pressure < 965]<-0

cyclones.data$pressure_grouped [
  cyclones.data$pressure >= 965 & cyclones.data$pressure < 973.9]<-1

cyclones.data$pressure_grouped [
  cyclones.data$pressure >= 973.9 & cyclones.data$pressure < 995]<-2

cyclones.data$pressure_grouped [cyclones.data$pressure >= 995]<-3

### Adding labels to pressure grouped data

cyclones.data$pressure_grouped <- factor (
  cyclones.data$pressure_grouped,
  labels=c(
    "<965", "965-973.9", "973.9-995", ">995"
  )
)


#### Packages installed during construction of bar charts and histograms

##### install.packages("tidyverse"), install.packages("RColorBrewer")
##### library("tidyverse"), library("RColorBrewer")


### Creating a bar chart for the categorized data

pressure.grouped.graph <- table (cyclones.data$pressure_grouped)

barplot (
  pressure.grouped.graph,
  horiz = FALSE,
  xlab = "Pressure",
  ylab = "Number of Cyclones",
  main = "Pressure of Cyclones",
  col=heat.colors(4)
)

### Creating a histogram for continuous speed data

hist(
  cyclones.data$speed,
  xlim = c(25,185),
  xlab = "speed",
  ylab = "Number of Cyclones",
  main = "Cyclone speeds",
  col=heat.colors(12), density=100
)

## Categorising Cyclone speed data using a standard reference 
### India Meteorological Department (IMD) Scale Vs General classification used





