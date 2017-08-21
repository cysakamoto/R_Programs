#############################################
# Selecting Columns by REGEX
# Cristina Y. Sakamoto
# The University of Chicago
#############################################

attach(chi_data)

#changing the name of zip column to make it easier... 
colnames(chi_data)[1] <- "arts_wide_zip"

chi_data_arts <- subset(chi_data, select = grep("arts_wide*", names(chi_data)))

detach(chi_data)
