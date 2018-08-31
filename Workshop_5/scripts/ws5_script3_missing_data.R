####################################################################
#                     The tidyverse and beyond 
#                            Workshop 5
#            I still haven't found what I'm looking for
#                       13th November 2017
#                    Worksheet C: missing data
####################################################################
# Missing data is represented as NA in R
# We have seen some examples on this in previous classes
# WE have also seen cases where filter() uses TRUE/FALSE results to 
# return the data to you
data <- tibble(x = c(1,2,3, NA, 5, NA, 7, 8))

filter(data, x > 5)

# You can use logical operators to retain missing data
filter(data, is.na(x) | x > 5)
# i.e. is the data missing or is it greater than 5

#Some simple data to demonstrate tidyverse missing data functions
stocks <- tibble(
    year = c(2001, 2001, 2001, 2001, 2002, 2002, 2002),
    qtr = c(1, 2, 3, 4, 2, 3, 4),
    value = c( 12, 12, NA, 5, 6, 10, 15)) 

# The complete() function fills in explicit NA's where necessary
stocks %>%
    complete(year, qtr)
# Note the extra row added to the data frame

# Imputation of missing data is too broad a topic to cover here
# Often, depending on the data, the mean, median, 1 or 0 may be used
    
# Sophisticated packages have been developed to assist with imputation of 
# missing data from next generation sequencing data

# ggplot will not include missing data in the graph but it will tell you
# that they were dropped
ggplot(data = stocks) +
    geom_point(mapping = aes(x = qtr, y = value))

# This message can be silenced
ggplot(data = stocks) +
    geom_point(mapping = aes(x = qtr, y = value), na.rm = TRUE)

