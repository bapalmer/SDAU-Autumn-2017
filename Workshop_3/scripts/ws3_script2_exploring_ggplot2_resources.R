####################################################################
#                     The tidyverse and beyond 
#                           Workshop 3
#                     Send an SOS to the world
#                        23rd October 2017
#                     Worksheet B: Online help
####################################################################
# In this part of the workshop we will combine the ggplot2 cheatsheet 
# with the ggplot2 web resources 

# The basic example is on the ggplot2 cheatsheet
# More information can be found by visiting;
# http://ggplot2.tidyverse.org/reference/index.html

# For this section we will use the mpg data set that comes with ggplot2
mpg <- mpg

# Remember that the first part of building a plot is the data 
plot_a <- ggplot(mpg, aes(hwy))

# and second part is defining the coordinate system;
plot_a +
  geom_histogram(binwidth = 5)

# This can also be written as;
plot_a <- ggplot(mpg) +
  geom_histogram(mapping = aes(hwy), binwidth = 5)

# 1. Lets first attempt to plot a single continuous variable
plot_b <- ggplot(mpg, aes(hwy)) #Try  using + geom_area() or + geom_dotplot()

# 2. Now lets plot two continuous variables
plot_c <- ggplot(mpg, aes(cty, hwy)) # Compare + geom_point() and + geom_jitter()

# Whats different about these plots?

# 3. Visit #http://ggplot2.tidyverse.org/reference/index.html and find out more 
# about geom_jitter()


