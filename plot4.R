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

source("loadData.R")

##
## 2. Create plot and save it to plot4.png
##

png("plot4.png")
## split in 2*2 graphics.
par(mfrow=c(2,2))

## First Graphic
with(dataExtract, plot(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))

# Second Graphic
with(dataExtract, plot(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))

# Third Graphic
with(dataExtract, plot(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"),  Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l"))
with(dataExtract, lines(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_2, col = "red"))
with(dataExtract, lines(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_3, col = "blue"))
legend("topright",
       bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1), # gives the legend appropriate symbols (lines)
       col=c("black","red", "blue"))
## Fourth Graphic
with(dataExtract, plot(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))

dev.off()