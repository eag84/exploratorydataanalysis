setwd("C:\\Users\\eliza\\OneDrive\\Documents\\R\\Coursera")
library(dplyr)

#read in data set
data <- read.table("household_power_consumption.txt", header=T, sep=";")
#create full date and time variable
data$pdate <- paste(data$Date, data$Time)
#convert character date to data class in R
data$pdate <- strptime(data$pdate, format = "%d/%m/%Y %H:%M:%S")
#subset dates of interest
selectData <- data[data$pdate >= "2007-02-01 00:00:00" & data$pdate <= "2007-02-02 23:59:59", ]
#convert other variables to appropriate classes
selectData[, 3:7] <- sapply(selectData[, 3:7], as.numeric)
selectData$Sub_metering_2 <- as.numeric(selectData$Sub_metering_2)

#Plot 3 - line plot
#X - Thur Fri Sat Y- Energy sub metering
#sub 1 is black, sub 2 is red, sub 3 is blue
#legend in upper R hand corner
png(filename = "plot3.png", width = 480, height = 480)
plot(selectData$pdate, selectData[,7], type = "l", xlab = "", ylab ="Energy sub metering")
lines(selectData$pdate, selectData[,8], col = "red")
lines(selectData$pdate, selectData[,9], col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"), lty =  1)
dev.off()