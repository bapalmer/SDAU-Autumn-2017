####################################################################
#                     The tidyverse and beyond
#                           Workshop 2
#                 We built this software on base R code
#                        9th October 2017
####################################################################

# Worksheet 2: Part C
# Lets create a list and dataframe to examine

a_matrix <- matrix(1:16, 4, 4)

a_data_frame <- data.frame(number = 1:10,
                           char   = sample(letters, 10),
                           this_really_a_col_name  = rep(c(TRUE, FALSE), 5))

# 1. Along with the str() function you used in Part B, now try using
# the following commands to get information about your data structures.
# Note how the information you get back differs:
# i: "a_matrix
# ii: "a_dat_frame"

length()
ncol()
nrow()
class()
typeof()

# 2. Indexing data frames
# i: You can use $ for named columns
# e.g. a_data_frame$number
# To get the 1st element type;
a_data_frame$number[1]

# To get the second its;
a_data_frame$number[2]
# and so on

# (NOTE: One of the big changes with tidyverse is movement away from the [ function)
# To perform the same function you can type [row, column]
# In this example type;
a_data_frame[1, 1]

# ii: It's possible to select multiple elements
# e.g. Rows 1-3 of the first column
a_data_frame[1:3, 1]

# or row one of the first 3 columns
a_data_frame[1, 1:3]

# iii: If you want to select specific, non-sequential numbers try using concatenate:
a_data_frame[c(1, 3, 5:7), 1]

# iv: Maybe you want to select elements based on a condition
a_data_frame$number[a_data_frame$number > 7]

# 3. Indexing lists
# Lets first build a list using the examples in the lecture slides
this_is_a_list  <- list(1, TRUE, "Three")

all_numbers    <- c(1, 2, 0.5, -0.5, 3.4)

all_characters <- c("One", "too", "3")

all_logical    <- c(TRUE, FALSE)

this_is_also_a_list <- list(nums = all_numbers, chars = all_characters, logi = all_logical)
# Note that here we named the vectors that were used to build the list

# i: Selection of brackets is important
typeof(this_is_a_list[3]) # Will just return "list"

typeof(this_is_a_list[[3]]) # However using [[ returns the element

# ii: this_is_also_a_list contains many elements
# we can access them by their named input using $
this_is_also_a_list$nums
this_is_also_a_list$nums[1]
typeof(this_is_also_a_list$nums[1])

# iii: Just to complicate things.......
this_is_also_a_list[[1]][4]

# Here [[1]] identifies the first vector all_numbers (which is called all_nums in the list)
# [4] is then called to obtain the 4th element of the list
