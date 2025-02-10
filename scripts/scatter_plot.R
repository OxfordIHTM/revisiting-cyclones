# Scatter plot of pressure against speed ----

plot(x = cyclones$pressure, y = cyclones$speed,
     col = "darkblue",
     main = "Pressure vrs Speed",
     xlab = "pressure",
     ylab = "speed"
     )




## Wrangling data by year and drawing bar graph ----

nrow(cyclones[cyclones$year, ])
