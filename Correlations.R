#############################################
# Industries Correlations
# Cristina Y. Sakamoto
# The University of Chicago
# August, 2017 
# http://www.statmethods.net/stats/correlations.html 
# http://www.sthda.com/english/wiki/visualize-correlation-matrix-using-correlogram
#############################################

# Setting directory
setwd("/home/cysakamoto/Data/jobs_per_ind_zip_year")

# Reading the industry file
tmp <- read.csv("jobs_ind_zbp1998", header = TRUE, sep = ",", quote = "\"", dec = ".", na.strings="NA")

# Removing the industries column
tmp$industries <- NULL

# Changing the name of columns to make it easier
names(tmp) <- c("zip", "sector", "jobs")

# Transforming the data from long to wide 
tmp_wide <- spread(tmp, sector, jobs)

# Need to subset the data, so that it doesn't conflict
data <- tmp_wide[2:14]

#############################################

# Getting the simple correlation table 
cor_table <- cor(data, use="pairwise.complete.obs", method = "pearson")

#############################################

library(corrplot)

# Using the fancy correlation graphs library
corrplot(cor_table, method="number", type="lower", order="hclust")

corrplot(cor_table, method="number", type="lower", tl.col="black", tl.srt=45)
