####################################################################
#                     The tidyverse and beyond
#                           Workshop 2
#                 We built this software on base R code
#                        9th October 2017
####################################################################

# Factors example

vehicles <- c("car", "bicycle", "motorbike", "bicycle", "motorbike", "bus",
              "car", "bicycle", "motorbike", "bus", "car", "bicycle", "motorbike")

f_vehicles <- factor(vehicles)

levels(vehicles)

# The order of the levels matters. By default, they will be in alphabetical order
levels(f_vehicles)

table(vehicles)

table(f_vehicles)

str(vehicles)

str(f_vehicles)
