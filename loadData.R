## 
## loadData.R
##
## This Script execute the following operations :
## 1. Extract the header & first data line of the household_power_consumption.txt file.
## 2. Store the header for future usage.
## 3. Get the date of the first line 
## 4. By observing there is a observation for each minute, Retrieve the number of lines to skip
##    corresponding to the difference on minutes between the retrieved date and 01/02/2007.
## 5. Retrieve the number of observation during the wanted 2 days.
## 6. Read the wanted data.
##

## 
## Author   - Thomas MARTIN
## Date     - 11/02/2016
## Email    - tmartin@live.fr
## Version  - 1.0
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
dataExtract <- read.table("household_power_consumption.txt", header = TRUE, skip = linesToSkip, nrows = linesToGet, na.strings= '?', sep=";", stringsAsFactors = FALSE)
colnames(dataExtract) <- namesCol