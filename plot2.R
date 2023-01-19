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

#Plot 2 - line plot
#X- Thur Fri Sat Y- Global Active Power (kilowatts) 
png(filename = "plot2.png", width = 480, height = 480)
plot(selectData$pdate, selectData$Global_active_power, type = "l", xlab = "", ylab ="Global Active Power (kilowatts)")
dev.off()