####################################################################
#                     The tidyverse and beyond 
#                           Workshop 1
#                     Welcome to the ggungle
#                        2nd October 2017
#                       Bauer dataset code
####################################################################
# We are now going to repeat the steps from script1, only this time
# we will be piping the data directly from function to function
# using the magrittr operator (%>%)

# The main point of difference here is that the first input to each function
# is no longer a data input, but rather a function argument input

# Create an object listing the conditions that were tested in the paper
# and that align with the column name labels
nutrient_names <- c(G = "Glucose", L = "Leucine", P = "Phosphate",
                    S = "Sulfate", N = "Ammonia", U = "Uracil")

#Load the gene data and process into a useable format
cleaned_genes_df <- read_delim("Brauer2008_DataSet1.tds", delim = "\t") %>%
  separate(NAME, c("name", "BP", "MF", "systematic_name", "number"),
           sep = "\\|\\|")  %>%
  mutate_at(vars(name:systematic_name), funs(trimws)) %>%
  select(-number, -GID, -YORF, -GWEIGHT) %>%
  gather(sample, expression, G0.05:U0.3) %>%
  separate(sample, c("nutrient", "rate"), sep = 1, convert = TRUE) %>%
  mutate(nutrient = plyr::revalue(nutrient, nutrient_names)) %>%
  filter(!is.na(expression), systematic_name != "")

# The key here is to first perfect the individual lines of code
# They can then be combined in the final version of the script

# Plot the data for a gene of interest
cleaned_genes_df %>%
  filter(BP == "leucine biosynthesis") %>%
  ggplot(mapping = aes(x = rate, y = expression, color = nutrient)
         ) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  # using "facet_wrap" we can create subplots
  facet_wrap(~name)

# In this last chunk of code we piped our new data frame directly to
# the graphical outputs
