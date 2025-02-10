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

## Making personal barplot ----

###Plotting mean of typhoon speed to year

calculate_mean_speed <- function(data) {
    mean_speeds <- tapply(data$speed, data$year, mean, na.rm = TRUE)   ##I got this code from ChatGPT
}

mean_speed <- calculate_mean_speed(cyclones)

barplot(mean_speed,
        main = "Yearly Average of Typhoon Speed",
        xlab = "Year",
        ylab = "Average Speed",
        col = "darkblue")

###Plotting typhoon speed in 2017 

plot(cyclones$year, cyclones$speed)

speed_2017 <- cyclones$speed[cyclones$year == 2017]

barplot(speed_2017,
     main = "Typhoon Speed in 2017",
     xlab = "2017",
     ylab = "Speed",
     col = "brown")

