# Unique values
# Shows the unique values in a column and the frequency

setwd("/home/cysakamoto/Data/programs")

count_values <- as.data.frame(table(data$ctyname))
