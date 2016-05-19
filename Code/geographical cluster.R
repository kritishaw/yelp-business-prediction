library(datasets)
library(RWeka)
library(caret)
library(class) 
library(e1071)
library(partykit)
library(leaderCluster)
library(cluster)
library(scatterplot3d)


yelp_train = read.csv("BusinessWithinAKm.csv")
summary(yelp_train)

trainData <- yelp_train[,c("business_id","latitude","longitude")]
train=trainData[,c(2:3)]
summary(train)


library(fields)
lat = trainData[,c(2)]
lon = trainData[,c(3)]

threshold.in.km <- 0.15
coors <- data.frame(lon,lat)



#distance matrix
dist <- rdist.earth(coors,miles = F,R=6371)

#clustering
fit <- hclust(as.dist(dist), method = "single")
clusters <- cutree(fit,h = threshold.in.km)

plot(lat, lon, col = clusters, pch = 20)

tab1clustn <-data.frame(lat,lon, clusters)
op <- data.frame(trainData[1], tab1clustn)

write.csv(op, file = "BusinessWithinAKm_Clustered.csv")

