## 
## plot1.R
##
## This Script execute the following operations :
## 1. Extract the wanted data.
## 2. Create plot and save it to plot1.png
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
## 2. Create plot and save it to plot1.png
##
png("plot1.png")
with(dataExtract, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
dev.off()