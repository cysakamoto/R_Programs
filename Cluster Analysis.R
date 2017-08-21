#Cluster Analysis  

zip.names <- read.csv("zip_names.csv", header = TRUE, sep = ",", na.strings = "NA")

#Getting the relevant variables
data <- read.csv("datamiss_2016-10-18", header = TRUE, sep = ",", na.strings = "NA")
data <- data[c("zip", "ARTGOSLG98", "CollProfLv90", "CrimeRate1999county", "Democ92", "NonWhite_90", "Pop1990", "RentMed", "JobsN_2014", "ArtsN_2014")]

# data <- data[c("zip", "log.JobsW_2014", "log.ArtsW_2014")]
# data <- merge(data, merge_file, by="zip")

# str(data)

#Scatterplot 
plot(CollProfLv90 ~ ArtsN_2014, data)
with(data, text(CollProfLv90 ~ ArtsN_2014), labels=zip, pos=4, cex=.1)

#Normalization
z <- data[,-c(1, 1)] #only the variables
m <- apply(z, 2, mean)
s <- apply(z, 2, sd)
z <- scale(z, m, s)

#Euclidian distance
distance <- dist(z)
# print(distance, digits = 3)

#Cluster dendogram with complete linkage
hc.c <- hclust(distance)
plot(hc.c, labels = data$zip, hang = -1)

#Cluster dendogram with average linkage
hc.a <- hclust(distance, method = "average")
plot(hc.a, labels = data$zip, hang = -1)

#Membership
member.c <- cutree(hc.c, 4)
member.a <- cutree(hc.a, 4)
table(member.c, member.a)

aggregate(z, list(member.c), mean)
aggregate(data[,-c(1,1)], list(member.c), mean) #make easier interpretation

#Silhouette plot
library(cluster)
plot(silhouette(cutree(hc.c, 4), distance))

######################
#Scree plot
wss <- (nrow(z)-1)*sum(apply(z, 2, var))
for (i in 2:20) wss[i] <- sum(kmeans(z, center=i)$withinss)
plot(1:20, wss, type="b", xlab="Number of CLusters", ylab="Within group SS")

#K-means clustering
kc <- kmeans(z, 4)
plot(CollProfLv90 ~ JobsN_2014, data, col = kc$cluster)
aggregate(data, by=list(kc$cluster), FUN=mean)
data <- data.frame(data, kc$cluster)
######################

data_cluster <- data[c("zip", "kc.cluster")]
data <- merge(data, data_cluster, by="zip")
data <- merge(data, zip.names, by="zip")

######################

#Subset of data according to clusters on core
#K = 4

data_k1 <- data[which(data$kc.cluster == "1"), ]
data_k2 <- data[which(data$kc.cluster == "2"), ]
data_k3 <- data[which(data$kc.cluster == "3"), ]
data_k4 <- data[which(data$kc.cluster == "4"), ]


library(mclust)
fit <- Mclust(data)
plot(fit)
