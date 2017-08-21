#Data Sampling

sdf <- data1998[sample(1:nrow(data1998), 2000, replace=FALSE), ]
data1998 <- sdf

write.csv(sdf, file=paste("sample_data"))

sdf <- read.csv("sample_data.txt", header = TRUE, sep = ",", na.strings = "NA")


sdf <- read.csv("datamiss_2016-11-04", header = TRUE, sep = ",", na.strings = "NA")
sdf <- sdf[sample(1:nrow(sdf), 500, replace=FALSE), ]
data <- sdf
