####################################################################
#                     The tidyverse and beyond 
#                           Workshop 1
#                     Welcome to the ggungle
#                        2nd October 2017
#                     House completions code
####################################################################
#Load the packages you need
library(tidyverse)

#Load the housing completion data and tidy it up
house_comp_df <- read_csv("house_completions.csv") %>%
  gather("1978":"2015", key = "year", value = "number")

#Define counties of interes to compare
main_areas <- c("Cork", "Dublin", "Waterford", "Limerick", "Galway")

#Plot the data by year, looking specifically at the main population areas
house_comp_df %>%
  filter(county %in% main_areas) %>%
  ggplot(mapping = aes(x = year, y = number, color = county)) +
  geom_point() 

#This looks a bit messy. Lets try Googling how to change the angle on the x-axis......
#ggplot x axis label rotate

#Lets attempt to add up the county by county totals for this period
#We can first tell R to group the information by county using group_by
by_county <- group_by(house_comp_df, county) %>%
  summarise(total = sum(number))

house_comp_df %>%
  filter(county %in% main_areas) %>%
  group_by(county) %>%
  summarise(total = sum(number)) %>%
  ggplot(mapping = aes(x = county, y = total, color = county)) +
  geom_bar(stat = "identity")

#Better to use fill for the barplots
house_comp_df %>%
  filter(county %in% main_areas) %>%
  group_by(county) %>%
  summarise(total = sum(number)) %>%
  ggplot(mapping = aes(x = county, y = total, fill = county)) +
  geom_bar(stat = "identity")

#Probably useful to add a title to our graph
house_comp_df %>%
  filter(county %in% main_areas) %>%
  group_by(county) %>%
  summarise(total = sum(number)) %>%
  ggplot(mapping = aes(x = county, y = total, fill = county)) +
  geom_bar(stat = "identity") +
  #We can add one with the following line
  ggtitle("Total house completions from 1978 - 2017")

#The legend isn't really neccessary here
house_comp_df %>%
  filter(county %in% main_areas) %>%
  group_by(county) %>%
  summarise(total = sum(number)) %>%
  ggplot(mapping = aes(x = county, y = total, fill = county)) +
  geom_bar(stat = "identity") +
  ggtitle("Total house completions from 1978 - 2017") +
  #We can remove it by adding the following line
  theme(legend.position="none")
