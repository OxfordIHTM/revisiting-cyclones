# Function to describe the dataset ----

## Function to create a scatter plot describing the relationship between wind speed and pressure ----
create_scatterplot <- function(x, y, main, xlab, ylab, col) {
  plot(x = x, y = y, main = main, xlab = xlab, ylab = ylab, col = col)
}

### Function to create a bar graph by year a count of how many cyclones per year ----
  #### First summarizing the data by year and then plotting it as a bar graph ----

organize_data_year <- function(data) {
  data[order(data$year)]
}
