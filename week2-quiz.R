## Week 1 Assignment
# Don't forget to
getwd()
# or
setwd("/Users/Mind/Desktop")
# Read CSV
data <- read.csv("hw1_data.csv",header = TRUE,sep = ",")
# Obtain first two rows
data[c(1,2),]
# Count # of rows
nrow(data)
# Get last two rows:
data[c(152,153),]
# Get the 47th row:
data[47,]
# Get number of missing values are in the Ozone column
sum(is.na(data[,1]))
# Get the mean of the column
mean(data[,1],na.rm = TRUE)
# Get the mean of subset column
mean(data$Solar.R[data$Ozone>31 & data$Temp>90],na.rm = TRUE)
mean(data$Temp[data$Month==6],na.rm=TRUE)
max(data$Ozone[data$Month==5],na.rm = TRUE)
