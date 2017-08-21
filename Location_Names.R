####################################################
# Location Names 
# Cristina Y. Sakamoto
# The University of Chicago
# 2017
# Zipcode Level.
####################################################

######################################################
# LOCATION NAMES - ZIP CODES 
# Adding the name of the counties to the table. 
tmp_names <- read.csv("/home/cysakamoto/Data/results/zip_names.csv", header = TRUE, sep = ",", quote = "\"", dec = ".", na.strings="NA")

# Keeping some variables from the names file
tmp_names <- tmp_names[c("zip", "City", "State", "Location", "EstimatedPopulation", "TotalWages")]

# Merging the data and name objects.
data  <- merge(data, tmp_names, by="zip")

###################################################### 

# LOCATION NAMES - COUNTY 

#Loading the names files
tmp_names <- read.csv('/home/cysakamoto/Data/county_names/county_names_1986', header = TRUE, sep = ",", quote = "\"", dec = ".", na.strings="NA")

# Keeping the number of digits in each county code consistent.
tmp_names$fipstate <- sprintf("%02d", tmp_names$fipstate)
tmp_names$fipscty <- sprintf("%03d", tmp_names$fipscty)

# Merging the data and name objects.
data <- merge(tmp_jobs, tmp_names, by=c("fipstate", "fipscty"))

###################################################### 

# # Count the frequency of the counties
# count_values <- as.data.frame(table(tmp$industries))
# 
# # aggregate the total number of jobs for WHOLE COUNTRY, by sum 
# tmp_total <- aggregate(tmp$total_jobs, by=list(tmp$fipstate, tmp$fipscity), sum)
# 
# # change the name of the variables 
# names(tmp_total) <- c("industries", paste("totaljobs_", tmp_name[1], sep=""))
