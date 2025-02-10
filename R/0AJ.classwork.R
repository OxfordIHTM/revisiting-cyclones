# Function to download and read cyclones.xlsx dataset ----

read_data <- function(url, destfile) {
  download.file (url = url, destfile = destfile, mode = "wb")
  
  read_xlsx(
    file = destfile,
    types = c(
      year = 1, 
      category_code = 0,
      category_name = 0,
      name = 0,
      rsmc_name = 0,
      start = 3,
      end = 3,
      pressure = 1,
      speed = 1
    )
  )
}
# Revisiting cyclones exercise ----

## Load bespoke functions in R folder and load libraries ----
for (i in list.files("R", full.names = TRUE)) source(i)
library(openxlsx2)


## Read cyclones dataset ----
cyclones <- read_data(
  url = "https://github.com/OxfordIHTM/teaching_datasets/raw/refs/heads/main/cyclones.xlsx", 
  destfile = "data/cyclones.xlsx"
)

View(cyclones)

### Personal plots
barplot(cyclones$year)

boxplot(
  year ~ speed,
  data = cyclones,
  col = "red"
)

hist(
  cyclones$pressure[cyclones$speed >= 100],
  col = "lightblue",
  main = "Histogram of Cyclone Pressure",
  xlab = "Cyclone Pressure",
  col = "purple",
  ylab = "Speed < 100"
)