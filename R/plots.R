
library(tidyverse)
library(dplyr)
library(lubridate)
library(ggplot2)
library(campsis)

#Count the number of typhoons every year
group_by_year <- cyclones %>% 
  group_by (year) %>% 
  summarise(freq = n())
ggplot(data = cyclones, aes(x = year)) + geom_bar()+theme_bw()

#Average pressure and speed for each cyclone category
ggplot(data = cyclones, aes (x = category_name, y = mean(pressure), fill=category_name))  + geom_bar(stat="identity") + coord_flip()
ggplot(data = cyclones, aes (x = category_name, y = mean(speed), fill=category_name)) + geom_bar(stat="identity") + coord_flip()


#Number of hours for each cyclone category
cyclones_1 <- cyclones %>% mutate(duration = seconds(end-start))
ggplot(data = cyclones_1, aes(x= category_name, y = duration, fill=category_name)) + geom_bar(stat="identity") + coord_flip() + theme_bw()
ggplot(data = cyclones_1, aes(x= factor(year), y = duration, fill=factor(year))) + geom_bar(stat="identity") + coord_flip() + theme_bw()

