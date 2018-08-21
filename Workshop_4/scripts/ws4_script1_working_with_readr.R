####################################################################
#                     The tidyverse and beyond 
#                           Workshop 4
#              It's the end of base R as you know it
#                       6th November 2017
#                Worksheet A: working with readr
####################################################################
# Start by loading the readr package using the library() function
library(readr)

# You are already familiar with using read_csv to read in a file
# e.g. data <- read_csv("path to input data.csv")

# There are many additional arguments that can be fed into this function
# 1. Examine them by running the following line of code
?read_csv()

# What about if the file header contains metadata (i.e. additional information)
# The skip argument can be used to pass over the first n lines before reading the data
# 2a. Import the meta_tidy_house_reg.csv and view the resultant data set
tidy_house <- read_csv("meta_tidy_house_reg.csv")

# 2b. Repeat this by including the skip argument (i.e. , skip = n)
# Again view the inputted data to see that you have the result you were after

# Similar to skip, you can also use a repeated term to skip lines
# In this instance the argument to be supplied is "comment = "

# 3. You can also provide inline data to the read_csv() function
# This is very useful when looking to provide reproducible examples
# e.g. when posting a question on stackoverflow
inline_eg_1 <- read_csv("col1, col2, col3 
                      cork, 1998, 120
                      dublin, 1999, 2200")

# Note the missing commas after "col3" and "120". This signifies a new row

# What happens when you supply the argument col_names = FALSE as below?
inline_eg_2 <- inline_eg <- read_csv("col1, col2, col3 
                      cork, 1998, 120
                      dublin, 1999, 2200", col_names = FALSE)

# 4. Complete the following code to produce 2 columns x 4 rows of data:
my_inline_eg <- read_csv("write your code here")

# 5. View the EAA13.px file downloaded from data.gov.ie
# This cannot be imported using readr, 
# however import packages exist for many obscure file formats 
# The pxR package allows us to import this .px file into a more recognisable format
# It strips away the metadata and returns the column headings and values

# 6. Import this file using the following lines of code
# Once you have done this, examine it
install.packages("pxR")
library(pxR)
my.px.object <- read.px("EAA13.px")
eaa13_df <- as.data.frame(my.px.object)

# readr also alllow you to write you data files back to disc
# write_csv(data_to_save, "filename.csv")
# 7. Create a file containing your tidy_house data
write_csv()

# NOTE: you may need to re-create column specifications when reloading

# 8. A useful function to stop your active environment cluttering up is rm()
# This removes data structures from your workspace
rm(tidy_house)
rm(inline_eg_1)

