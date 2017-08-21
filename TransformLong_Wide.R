#############################################
# Transform long format to wide 
# Cristina Y. Sakamoto
# The University of Chicago
# August, 2017 
# http://www.cookbook-r.com/Manipulating_data/Converting_data_between_wide_and_long_format/
#############################################

library(tidyr) 
library(stringr)

csvfile <- "jobs_ind_zbp2015"

data_zbp1998$industries <- NULL
data_wide_1998 <- spread(data_zbp1998, sector, totaljobs_zbp1998)
colnames(data_wide_1998)[2:14] <- paste(colnames(data_wide_1998)[2:14], "1998", sep = "_")

setwd("/home/cysakamoto/Data/jobs_per_ind_zip_year")
csvfiles <- list.files("/home/cysakamoto/Data/jobs_per_ind_zip_year")

for (csvfile in csvfiles) {
  #############################################
  # Creating names and getting the year. 
  # grab the name of the file as a string.
  tmp_name <- as.character(csvfile)
  
  # split the name of the file according to the location of the . 
  tmp_name <- strsplit(tmp_name, "\\ind_") [[1]]
  
  # print the name of the file, so see the year
  print(tmp_name[2])
  
  # defining the year we're working on
  tmp_year <- str_sub(tmp_name[2], start= -4)
  
  #############################################
  # read the file
  tmp <- read.csv(csvfile, header = TRUE, sep = ",", quote = "\"", dec = ".", na.strings="NA")  
  
  # Removing the industries column
  tmp$industries <- NULL
  
  # Changing the name of columns to make it easier
  names(tmp) <- c("zip", "sector", "jobs")
  
  # Transforming the data from long to wide 
  tmp_wide <- spread(tmp, sector, jobs)
  
  # Adding the year to the column names
  colnames(tmp_wide)[2:14] <- paste(colnames(tmp_wide)[2:14], tmp_year, sep = "_")
  
  #############################################
  # Merging the different years 
  if (csvfile == "jobs_ind_zbp1998") {
    data <- tmp_wide 
  } else {
    data <- merge(data, tmp_wide, by=c("zip"), all=TRUE) }
}

write.csv(data, file="/home/cysakamoto/Data/results/ind_jobs_15_98", na = "", row.names=FALSE, append = TRUE, sep = ",")
