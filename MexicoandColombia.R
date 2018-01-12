library(tidyverse)

#Step 1: Loading data into a variable
casualties <- read.csv('preprocessed.csv')
casualties. <- casualties
View(casualties.)
unique(casualties.Mexico$Year)

#Step 2: Seperating the data on 'Mexico' and on 'Colombia'
casualties.Mexico <- casualties. %>%
  filter(Country %in% c('Mexico'))
View(casualties.Mexico)
casualties.Colombia <- casualties. %>%
  filter(Country %in% c('Colombia'))
View(casualties.Colombia)

casualties.Mexico. <- casualties.Mexico
casualties.Colombia. <- casualties.Colombia

#Step 3: Making the numbers in types_of_violence characters, for better colours in graph
casualties.Mexico$Type_of_violence <- as.character(casualties.Mexico.$Type_of_violence)
casualties.Colombia$Type_of_violence <- as.character(casualties.Colombia.$Type_of_violence)

#Step 4:Creating maps for Mexico and Colombia
library(ggplot2)
library(ggmap)
library(maps)
library(mapdata)

ggplot() + 
  geom_polygon(data = map_data('worldHires', 'Colombia'), mapping = aes(x=long, y=lat, group=group)) +
  geom_point(data = casualties.Colombia, mapping = aes(x = Longitude, y = Latitude, size = Best_est, colour = Type_of_violence))

ggplot() + 
  geom_polygon(data = map_data('worldHires', 'Mexico'), mapping = aes(x=long, y=lat, group=group)) +
  geom_point(data = casualties.Mexico, mapping = aes(x = Longitude, y = Latitude, size = Best_est, colour = Type_of_violence))

#Step 5: Total casualties in Colombia and Mexico
total.Colombia <- sum(casualties.Colombia$Best_est)
total.Mexico <- sum(casualties.Mexico$Best_est)

#Step 6: Populations in year 2017 for Mexico and Colombia
population <- read.csv('populations.csv')
population. <- population
View(population.)

population.Mexico <- population. %>%
  filter(Country %in% c('Mexico'))
population.Mexico
population.Colombia <- population. %>%
  filter(Country %in% c('Colombia'))
population.Colombia


#Step 7: Percentage of casualties relative to population in 2017
relative.Mexico <- ((total.Mexico / population.Mexico$Population) * 100)
relative.Mexico
relative.Colombia <- ((total.Colombia / population.Colombia$Population) * 100)
relative.Colombia
