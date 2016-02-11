## 
## plot4.R
##
## This Script execute the following operations :
## 1. Extract the wanted data.
## 2. Create plot and save it to plot4.png
##

## 
## Author   - Thomas MARTIN
## Date     - 11/02/2016
## Email    - tmartin@live.fr
## Version  - 1.0
##

##
## 1. Extract the wanted data
##

## Retrieve the first line of data file to know the first date.
startOfTable <- read.table("household_power_consumption.txt", header = TRUE, nrows = 1, sep=";", stringsAsFactors = FALSE)
## Save column names for future usage.
namesCol <- colnames(startOfTable)

# As there is a row by minutes, deduct the lines to skip and the lines to get.
firstTableDate <- strptime(paste(startOfTable$Date[1], startOfTable$Time[1]), "%d/%m/%Y %H:%M:%S")
firstUsefulDate <- strptime("01/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S")
endDate <- strptime("03/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S")

linesToSkip <- as.numeric(difftime(firstUsefulDate, firstTableDate, units = c("mins")))
linesToGet <- as.numeric(difftime(endDate, firstUsefulDate, units = c("mins")))

## Finally obtain the expected data.
dataExtract <- read.table("household_power_consumption.txt", header = TRUE, skip = linesToSkip, nrows = linesToGet, sep=";", stringsAsFactors = FALSE)
colnames(dataExtract) <- namesCol

##
## 2. Create plot and save it to plot4.png
##

png("plot4.png")
## split in 2*2 graphics.
par(mfrow=c(2,2))

## First Graphic
with(dataExtract, plot(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Global_active_power, type = "n", xlab = "", ylab = "Global Active Power"))
with(dataExtract, lines(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Global_active_power))
# Second Graphic
with(dataExtract, plot(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Voltage, type = "n", xlab = "datetime", ylab = "Voltage"))
with(dataExtract, lines(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Voltage))
# Third Graphic
with(dataExtract, plot(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
with(dataExtract, lines(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_1))
with(dataExtract, lines(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_2, col = "red"))
with(dataExtract, lines(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_3, col = "blue"))
legend("topright",
       bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1), # gives the legend appropriate symbols (lines)
       col=c("black","red", "blue"))
## Fourth Graphic
with(dataExtract, plot(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Global_reactive_power, type = "n", xlab = "datetime", ylab = "Global_reactive_power"))
with(dataExtract, lines(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Global_reactive_power))

dev.off()