##This script reads data from "household_power_consumption.txt" and plots a histograph of the global active power.
##The file "household_power_consumption.txt" must be in the same working directory. Note: the POSIXct time class is
##not necessary to generate a histograph, but allows for further analysis (ie. plot2-4).

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
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
                  
                
