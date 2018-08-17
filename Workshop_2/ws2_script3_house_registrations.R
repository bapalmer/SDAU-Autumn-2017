####################################################################
#                     The tidyverse and beyond
#                           Workshop 1
#                We built this software on baseR code
#                        9th October 2017
#                       House registrations
####################################################################
#Load the packages you need
library(tidyverse)

##### Might want to show base R alongside tidyverse as you go
### For example hist(x$y) or plot(x$y) for quick visualisations

# Load the housing completion data and tidy it up
house_reg_df <- read_csv("house_registrations.csv") %>%
  gather("1978":"2015", key = "year", value = "number")
  #New note: it can also written as `1978`:`2015` due to the use of years as colnames

# Define counties of interest to compare
main_areas <- c("Cork", "Dublin", "Waterford", "Limerick", "Galway")

# Plot the data by year, looking specifically at the main population areas
house_reg_df %>%
  filter(county %in% main_areas) %>%
  ggplot(mapping = aes(x = year, y = number, color = county)) +
  geom_point()

# Lets attempt to add up the county by county totals for this period
# We can first tell R to group the information by county using the function group_by()
by_county <- group_by(house_reg_df, county) %>%
  summarise(total = sum(number)) # view the by county

house_reg_df %>%
  filter(county %in% main_areas) %>%
  group_by(county) %>%
  summarise(total = sum(number)) %>%
  ggplot(mapping = aes(x = county, y = total, color = county)) +
  geom_bar(stat = "identity")

# Better to use fill for the barplots
house_reg_df %>%
  filter(county %in% main_areas) %>%
  group_by(county) %>%
  summarise(total = sum(number)) %>%
  ggplot(mapping = aes(x = county, y = total, fill = county)) +
  geom_bar(stat = "identity")

# Probably useful to add a title to our graph
house_reg_df %>%
  filter(county %in% main_areas) %>%
  group_by(county) %>%
  summarise(total = sum(number)) %>%
  ggplot(mapping = aes(x = county, y = total, fill = county)) +
  geom_bar(stat = "identity") +
  # We can add one with the following line
  ggtitle("Total house completions from 1978 - 2017")

# The legend isn't really necessary here
house_reg_df %>%
  filter(county %in% main_areas) %>%
  group_by(county) %>%
  summarise(total = sum(number)) %>%
  ggplot(mapping = aes(x = county, y = total, fill = county)) +
  geom_bar(stat = "identity") +
  ggtitle("Total house completions from 1978 - 2017") +
  # We can remove it by adding the following line
  theme(legend.position="none")

# Maybe we want to view the information as a heatmap
house_reg_df %>%
  filter(county %in% main_areas) %>%
  ggplot(mapping = aes(x = county, y = year)) +
  geom_tile(mapping = aes(x = county, y = year, fill = number)) +
  ggtitle("Total house completions from 1978 - 2017") +
    # the possibilities for colour are endless, here is one option
    scale_fill_gradient(low = "red", high = "green")
