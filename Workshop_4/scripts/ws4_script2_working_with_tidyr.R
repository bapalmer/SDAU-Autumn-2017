####################################################################
#                     The tidyverse and beyond 
#                            Workshop 4
#              It's the end of base R as you know it
#                       6th November 2017
#                Worksheet B: working with tidyr
####################################################################
# Start by loading the tibble and tidyr packages using the library() function
library(tibble)
library(tidyr)

messy_data <- read_csv("messy_data.csv")

# Lets start by converting "dob" into day, month and year
# 1. The separate function will generate three new columns based on the input column 
messy_data_v1 <- separate(messy_data, dob, c("day", "month", "year"), sep = "-")

# 2. Now do the same for the name column. What will your new columns be?
# What will the separator be?

messy_data_v2 <- separate()

# gather() takes multiple columns, and gathers them into key-value pairs: 
# i.e. it makes "wide" data longer
# The orignal column names become values in new column A
# The original values are placed in new column B
# e.g. long_data <- gather(wide_data, new_column_A_name, new_column_B_name, column_1:column_n)
# 3a. Use the example code to gather columns work to play
messy_data_v3_a <- gather(messy_data, condition, value, work:play)

# 3b. Rather than naming the columns, you can call on them by their positional number
# Try it
messy_data_v3_b <- gather(messy_data, condition, value, 3:4)

# 3. What is the result of the following?
messy_data_v3_a == messy_data_v3_b

# 5. Missing data is a big problem in data analysis and requires careful consideration
# We'll talk about it in more detail during Workshop 5
# For now, lets just remove those rows with missing data using drop_na()
messy_data_v3_NA <- drop_na(messy_data_v3_a)

# To reverse some of the actions above, we can use the functions unite() and spread()
# unite() collapses cells across the columns selected to give a single column 
# 6. Lets reverse our "dob" action from section 1
messy_data_dob <- unite(data, columns_to_be_combined, col = "new_column_name", sep = "/")

# spread() will essentially make long data wider
# 7. Use spread() to reverse what you did in section 2
messy_data_wide <- spread(messy_data_v3_a, condition, value)

# Way back in workshop 1 we looked at the functions in isolation
# This generated lots of intermediary data sets in our environment
# 8. Can you combine the commands from sections 1-3 and 5 using "%>%"?
tidy_data <- messy_data %>%
    separate() %>%
    separate() %>%
    gather() %>%
    drop_na()
    