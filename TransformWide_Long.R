#############################################
# Transform wide format to long 
# Cristina Y. Sakamoto
# The University of Chicago
#############################################

# There are two methods to change the data from wide to long

# First method involves the time, and similar names with time as variant. 
chi_arts_long <- reshape(chi_data_arts, varying=c(2:19), direction="long", idvar = "zip", sep="_", timevar="time")

# Second method allows for any transformation, as long as you define which variables vary. 
rank_anc_long <- melt(rank_anc, id=c("Zipcode", "AreaKey", "AreaName"))

 

