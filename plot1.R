# plot1.R
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

# plot1
hist(subsetdata$global_active_power, col = 'red', 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

# Write png plot to working directory
dev.copy(png,'plot1.png', width = 480, height = 480)
dev.off()


