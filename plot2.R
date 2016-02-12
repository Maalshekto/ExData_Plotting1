## 
## plot2.R
##
## This Script execute the following operations :
## 1. Extract the wanted data.
## 2. Create plot and save it to plot2.png
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
## 2. Create plot and save it to plot2.png
##
png("plot2.png")
with(dataExtract, plot(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()