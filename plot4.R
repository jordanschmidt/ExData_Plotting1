##This script reads data from "household_power_consumption.txt" and generates four plots: Global active power 
##vs time, voltage vs time, sub meter readings vs time and global reactive power vs time. 
##The file "household_power_consumption.txt" must be in the same working directory.

## Initialize a data frame and read the text file
data <- data.frame()
data <- read.csv("household_power_consumption.txt", na.strings = "?", sep = ";")

## Correct the formatting of the Date column
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

## Create a subset for the dates required
StartDate <- as.Date("2007-02-01")
EndDate <- as.Date("2007-02-02")
data <- data[data$Date >= StartDate & data$Date <= EndDate,]

## Generate a new column "timestamp" which pastes together the Date and Time in the POSIXct time class
data$timestamp <- as.POSIXct(paste(data$Date, data$Time))

## Generate the plot and save as a .png file
par(mfrow = c(2, 2))

plot(data$timestamp, data$Global_active_power, type="n", xlab="", ylab="Global Active Power")
lines(data$timestamp, data$Global_active_power, type="l")

plot(data$timestamp, data$Voltage, type="n", xlab="datetime", ylab="Voltage")
lines(data$timestamp, data$Voltage, type="l")

plot(data$timestamp, data$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(data$timestamp, data$Sub_metering_1, type="l", col="black")
lines(data$timestamp, data$Sub_metering_2, type="l", col="red")
lines(data$timestamp, data$Sub_metering_3, type="l", col="blue")
legend('topright', c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3 "), lty=1, col=c("black", "red", "blue"), bty = "n")

plot(data$timestamp, data$Global_reactive_power, type="n", xlab="datetime", ylab="Global_reactive_power")
lines(data$timestamp, data$Global_reactive_power, type="l")

dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
                  
                
