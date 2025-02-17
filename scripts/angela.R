# Function to describe the dataset ----

## Function to create a bar graph by year a count of how many cyclones per year ----
  ### First summarizing the data by year and then plotting it as a bar graph ----

organize_data_year <- function(data) {
  data[order(data$year)]
}

## Function to calculate mean pressure and speed by year and plot it ----
plot_mean_pressure_speed_chart <- function(data) {
  ### Calculate mean pressure and speed by year ----
  mean_values <- data %>%
    group_by(year) %>%
    summarise(mean_pressure = mean(pressure, na.rm = TRUE),
              mean_speed = mean(speed, na.rm = TRUE))
  ### Create bar plot ----
ggplot(mean_values, aes(x = factor(year))) +
  geom_bar(aes(y = mean_pressure), stat = "identity", fill = "skyblue", position = "dodge") +
  geom_bar(aes(y = mean_speed), stat = "identity", fill = "orange", position = "dodge") +
  labs(title = "Mean Pressure and Speed by Year",
       x = "Year",
       y = "Mean Pressure") +
  theme_minimal() +
  scale_y_continuous(sec.axis = sec_axis(~., name = "Mean Speed"))
}
