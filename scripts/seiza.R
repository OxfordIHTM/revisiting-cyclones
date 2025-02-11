## plot the number of cyclones per year

# Count the number of cyclones in each year
count_cyclone <- table (cyclones$year)

# Create the data frame showing the number of cyclones per year
data <- data.frame (year = names(count_cyclone),
                     num_cyclones = as.integer (count_cyclone))

# Calculate mean of the number of cyclones per year
mean_cyclones <- mean(data$num_cyclones)

# plot the number of cyclones per year
plot(data$year, data$num_cyclones,
     xlab = "Year",
     ylab = "Number of typhoon per year",
     main = "number of typhoon per year between 2017 and 2021",
     pch = 16,
     col = "black")

# Add the information related to mean and variance
abline(h = mean_cyclones, col = "red", lwd = 2, lty = 3)
