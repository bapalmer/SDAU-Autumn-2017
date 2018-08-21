####################################################################
#                     The tidyverse and beyond 
#                           Workshop 3
#                     Send an SOS to the world
#                        23rd October 2017
#       Worksheet A: correcting basic errors in your code
####################################################################
# Start by loading the tidyverse package using the library() function
library(tidyverse)

# 1. 
# This code worked in Workshop 1, but won't work today
raw_gene_df <- read_delim("Brauer2008_DataSet1.tds", delim = "\t")

# The reason is that the .tds data file is not in your current working directory
# and you will get the error below

# Rather than having multiples if the same file in different locations
# lets try and direct R to the original Workshop_1 folder
# Use the import button and browse to the file location
# Copy the code identifying the path the the file from the "Code Preview" box
# and use it to load the file

# Example: The path that directs to it on my computer is; 
raw_gene_df <- read_delim("~/R_Users_Workshop/Workshop_1/workshop_1_project/Brauer2008_DataSet1.tds", delim = "\t")

# 2. 
# As with base R, tidyverse packages come with data we can practise on
# These are loaded when the tidyverse is loaded, but the don't appear in our
# global environment unless we assign them to an object. Do this now
dia_df <- diamonds

# The diamonds dataset comes in ggplot2 and contains information 
# about ~54,000 diamonds, including the price, carat, color, clarity, 
# and cut of each diamond 

# We're now to go through some examples and correct the errors as we go 
# 3.
# Inaccurate indexing can throw your code out
# Correct the following for the diamonds (dia_df) data set
# Remember when indexing data sets the syntax is [row number, column number]
# a. Return the first value in the last column
diamonds[1, 11]

# b. Return the last value in the first column
diamonds[53941, 1]

# c. Return the first four values for the last four columns
diamonds[1:4, 8:11]

# d. Return the first and last value of all columns
diamonds[c(1, 53941), ]

# In the last workshop factors were introduced
# These are useful when dealng with categorical data
# Lets create one
# 4. 
x <- c("low", "medium", "high")
class(x)
x_factor <- as_factor(x)
class(x_factor)

# It's very common to get an error message like to one that has appeared below
# It's due to the package containing the function not being loaded

# as_factor() is a function in the forcats package which is part of the tidyverse,
# but not one of the 6 core tidyverse packages loaded at the start of this session
# 5. load the "forcats" package and re-run the previous block of code 


# Correct the errors in the basic ggplot2 code below
# 6.
# a.
ggplot(data = dia.df) +
  geom_bar(mapping = aes(x = cut))

# b.
ggplot(data = dia_df) +
  geom_bar(mapping = aes(x = Cut))

# Those first two examples only return errors when we run the code

# Something is wrong with this code also, but what?
# Hover over the X to find out
# c. 
ggplot(data = dia_df) +
  geom_bar(mapping = aes(x = cut)
           


