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

## Labelling variables


