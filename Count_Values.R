# How to count frequency of values in R 
# Cristina Y. Sakamoto - cysakamoto@uchicago.edu
# df = dataframe 
# var = variable name

# Count the frequency of a specific value in the dataset:
# Substitute 11 for the value you're looking for
sum(df$var == 11, na.rm=TRUE)

# Count the frequency of every unique value in the dataset: 
count_values <- as.data.frame(table(df$var))

# Count the frequency of every unique value in two different columns
count_values2 <- as.data.frame(table(df$var1, df$var2))