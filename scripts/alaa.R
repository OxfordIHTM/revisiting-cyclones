
##plot typhones by year 
#describe_data
summary(cyclones)
nrow(cyclones[cyclones$year == 2017,])
cyclones_2017 = nrow(cyclones[cyclones$year == 2017,])  # not needed

table(cyclones$year)
cyclones_count = table(cyclones$year)
barplot(cyclones_count, 
        main = "number of cyclones per year",
        xlab = "yaer",
        ylab = "number of cyclones")


##plot mean speed, mean pressure by year 

# mean pressure per year 

table(cyclones$pressure)

aggregate(pressure ~ year, data = cyclones, FUN = mean, na.rm = TRUE)

mean_pressure_year = aggregate(pressure ~ year, data = cyclones, FUN = mean, na.rm = TRUE)

plot(mean_pressure_year,
     main = "Mean Pressure Per Year", 
     xlab = "Year", 
     ylab = "Mean Pressure")
barplot(mean_pressure_year$pressure,      #provides the heights of the bars (mean pressure values).
        names.arg = mean_pressure_year$year,     #labels for each bar
        main = "Mean Pressure Per Year", 
        xlab = "Year", 
        ylab = "Mean Pressure")

#mean speed per year

mean_speed_year = aggregate(speed ~ year, data = cyclones, FUN = mean, na.rm = TRUE)

plot(mean_speed_year, 
     main = "mean speed per year", 
     xlab = "year", 
     ylab = "mean speed")
barplot(mean_speed_year$speed, 
        names.arg = mean_speed_year$speed,
        main = "mean speer per year",
        xlab = "year",
        ylab = "mean speed")

##calculate the no of hours typhones stayed in an area > results will be in seconds

Typhoons = cyclones[cyclones$category_name == "Typhoon", ]

difftime(Typhoons$end, Typhoons$start, units = "hours")
Typhoons_LOS_hrs = difftime(Typhoons$end, Typhoons$start, units = "hours")

difftime(Typhoons$end, Typhoons$start, units = "secs")
Typhoons_LOS_secs = difftime(Typhoons$end, Typhoons$start, units = "secs")

aggregate(difftime(end, start, units="hours") ~ name,
          data=Typhoons, FUN = function(x) mean(x, na.rm = TRUE))

aggregate(difftime(end, start, units="secs") ~ name,
          data=Typhoons, FUN = function(x) mean(x, na.rm = TRUE))

aggregate(Typhoons_LOS_secs ~ name, data = Typhoons, FUN = sum)

aggregate(Typhoons_LOS_hrs ~ name, data = Typhoons, FUN = sum)          

LOS_name_secs = aggregate(Typhoons_LOS_secs ~ name, data = Typhoons, FUN = sum)         

LOS_name_hrs = aggregate(Typhoons_LOS_hrs ~ name, data = Typhoons, FUN = sum)

plot(LOS_name_secs$Typhoons_LOS_secs, 
       main = "LOS by typhoon", 
       xlab = "typhoon name",
       ylab = "LOS")
plot(LOS_name_hrs$Typhoons_LOS_hrs, 
     main = "LOS by typhoon", 
     xlab = "typhoon name",
     ylab = "LOS")

LOS_name_hrs$Typhoons_LOS_hrs = as.numeric(LOS_name_hrs$Typhoons_LOS_hrs) # for the plot

barplot(LOS_name_hrs$Typhoons_LOS_hrs, # Errored not recognised as numeric why?
        names.arg = LOS_name_hrs$name, 
        main = "Length of Stay (in hours) by Typhoon", 
        xlab = "Typhoon Name", 
        ylab = "Length of Stay (hours)")



