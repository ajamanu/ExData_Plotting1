# plot3.R
# Script for Exploratory Data Analysis course project 1
# Created by Aja Manu 9/12/15

# clear environment and set work directory
rm(list=ls()) # Clear working environment
setwd("U:/Data/Aja/Coursera/Exploratory Data Analysis/ExDataProject1") #set working directory

# Load data
sampleData <- read.table("./Data/household_power_consumption.txt", header = TRUE,
                         nrows = 5, sep = ';', na.strings = "?") # sample data to get column classes
colClasses <- sapply(sampleData, class) # extract classes from sample data
data <- read.table("./Data/household_power_consumption.txt", header = TRUE, 
                   colClasses = colClasses, sep = ';', na.strings = "?")

# tidy up data
names(data) <- tolower(names(data)) # change column heading to lower case
data$datetime <- paste(data$date, data$time) # combine date and times
data$datetime <- strptime(data$datetime, "%d/%m/%Y %H:%M:%S") # conver to R date and time
data$date <- as.Date(data$date, "%d/%m/%Y")

# subset data to data that we are after
subsetdata <- subset(data, as.Date(date) %in% as.Date(c("2007-02-01", "2007-02-02")))

# plot3
plot(subsetdata$datetime, subsetdata$sub_metering_1, type = 'l',
     ylab = "Energy sub metering", xlab = "")
lines(subsetdata$datetime, subsetdata$sub_metering_2, type = 'l', col = 'red')
lines(subsetdata$datetime, subsetdata$sub_metering_3, type = 'l', col = 'blue')
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       lwd = 1, col = c("black", "red", "blue"), cex=0.7)

# Write png plot to working directory
png('plot3.png', width = 480, height = 480, type = "cairo")
# plot3
plot(subsetdata$datetime, subsetdata$sub_metering_1, type = 'l',
     ylab = "Energy sub metering", xlab = "")
lines(subsetdata$datetime, subsetdata$sub_metering_2, type = 'l', col = 'red')
lines(subsetdata$datetime, subsetdata$sub_metering_3, type = 'l', col = 'blue')
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       lwd = 1, col = c("black", "red", "blue"), cex=0.7)
dev.off()

