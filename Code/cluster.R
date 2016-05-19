
#Loading all packages required
library(scatterplot3d)
library(rgl)
library(cluster)
library(rgl)
library(biclust)

cat("\nUser Cluster - K means")



data <- read.csv("userCluster_date.csv")
plot(data)


classes <- data[,9]
filter_data <- data[,1:8]
filter_data[1:10,]
data.matrix(filter_data)

kclus <- kmeans(filter_data, centers=8)
table(data.frame(classes, kclus$cluster))
plot3d(filter_data, col=(kclus$cluster+1), main="Kmeans Clustering")


