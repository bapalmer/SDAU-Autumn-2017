####################################################################
#                     The tidyverse and beyond 
#                            Workshop 5
#            I still haven't found what I'm looking for
#                       13th November 2017
#             Worksheet A: working with dplyr part B
####################################################################
# Start by loading the tidyverse package
library(tidyverse)

# Lets return to where we left off last week
library(nycflights13)

flights <- nycflights13::flights

# summarise() collapses a lot of data down to a single row
# Consider the following code
# What is the mean departure delay time?
summarise(flights, delay = mean(dep_delay, na.rm = TRUE))

# If we re-run this code, but first group the data, 
# the information returned is much more useful
gp_mnt <- flights %>%
    group_by(year, month)

summarise(gp_mnt, delay = mean(dep_delay, na.rm = TRUE))

# This returns the mean for each month
# 1. Complete the code to give a mean departure delay for each day of each month
gp_day <- flights %>%
    group_by()

# Take note of the change to the type of data you have just created in
# the environment tab

# Check the output
summarise(gp_day, delay = mean(dep_delay, na.rm = TRUE))

# 2. Now, additionally group by airport and month
# This information might influence where you depart from next time!
gp_mth_origin <- flights %>%
    group_by()

summarise(gp_mth_origin, delay = mean(dep_delay, na.rm = TRUE))

# Let look again at the flights that have no departure information
# From the last day:
no_departure <- flights %>%
    filter(is.na(dep_time)) %>%
    select(-c(4,6,7,9, 15:18))
    
    ggplot(data = no_departure) +
        geom_bar(mapping = aes(x = time_hour))
 
# It looks as though February wasn't a great month for flight departures
# Lets filter the data for February and group the data
# What day had the most cancelled flights?
worst_day_feb <- flights %>%
    filter(month == 2, is.na(dep_time)) %>%
    group_by(day, origin) %>%
    count(day) %>%
    arrange(desc(n)) # Re-arrange the rows to give the highest value first

ggplot(data = worst_day_feb) +
    geom_point(mapping = aes(x = day, y = n, colour = origin)) +
    theme_classic()
    
head(worst_day_feb, n = 10) # Default head() output is the first 6 entries

# What happened on the 8th and 9th February?
weather <- nycflights13::weather

# Lets examine the rainfall for February
# First, we need to group the data
feb_weather <- weather %>% 
    filter(month == 2) %>%
    select(-year) %>%
    group_by(origin, day)

# Then we want to build our summaries
feb_daily <- summarise(feb_weather, avg_rainfall = mean(precip, na.rm = TRUE),
                       # Gives us the average rainfall each day
                       max_wind = max(wind_speed), # Maximum windspeeds by day
                       min_viz = min(visib)) # Minimums daily visibilities

ggplot(feb_daily) +
    geom_point(aes(x = as.factor(day), 
                   y = avg_rainfall, colour = origin)) +
    theme_classic()
# Looks like the worst rainfall was on the 27th of February
# No real clues there

ggplot(feb_daily) +
    geom_jitter(aes(x = as.factor(day), 
                   y = min_viz, colour = origin)) +
    theme_classic()

# Visibility wasn't great on the 8th or 9th, but again, it wasn't the worst
# What's going on here??????

