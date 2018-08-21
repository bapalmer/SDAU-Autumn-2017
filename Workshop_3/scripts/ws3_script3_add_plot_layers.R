####################################################################
#                     The tidyverse and beyond 
#                           Workshop 3
#                     Send an SOS to the world
#                        23rd October 2017
#              Worksheet C: Adding layers to your plot
####################################################################
# Load the housing completion data

# Define counties of interest to compare
main_areas <- c("Waterford", "Limerick", "Galway")

# Start with a basic plot output and add to it
house_plot <- house_reg_df %>%
                filter(county %in% main_areas) %>%
                ggplot(mapping = aes(x = year, y = number, color = county)) +
                geom_point() 

# Using Stackoverflow, ggplot2 reference webpage or cheatsheet, do the following;
# 1. Add a title to the plot

# 2. Remove the legend

# 3. Change the axis labels

# 4. Remove the grey background/gridlines

# 5. Rotate the x-axis labels so that they become readable

# 6. Change the axis font/size
