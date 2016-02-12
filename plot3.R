## 
## plot3.R
##
## This Script execute the following operations :
## 1. Extract the wanted data.
## 2. Create plot and save it to plot3.png
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
## 2. Create plot and save it to plot3.png
##

png("plot3.png")

## sub_metering_1
with(dataExtract, plot(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"),  ylab = "Energy sub metering", xlab="", Sub_metering_1, type = "l"))
## sub_metering_2
with(dataExtract, lines(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_2, col = "red"))
## sub_metering_3
with(dataExtract, lines(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_3, col = "blue"))
## add legend
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1), # gives the legend appropriate symbols (lines)
       col=c("black","red", "blue"))
dev.off()