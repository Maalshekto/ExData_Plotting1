startOfTable <- read.table("household_power_consumption.txt", header = TRUE, nrows = 1, sep=";", stringsAsFactors = FALSE)
namesCol <- colnames(startOfTable)

firstTableDate <- strptime(paste(startOfTable$Date[1], startOfTable$Time[1]), "%d/%m/%Y %H:%M:%S")

firstUsefulDate <- strptime("01/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S")

endDate <- strptime("03/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S")

linesToSkip <- as.numeric(difftime(firstUsefulDate, firstTableDate, units = c("mins")))
linesToGet <- as.numeric(difftime(endDate, firstUsefulDate, units = c("mins")))

dataExtract <- read.table("household_power_consumption.txt", header = TRUE, skip = linesToSkip, nrows = linesToGet, sep=";", stringsAsFactors = FALSE)
colnames(dataExtract) <- namesCol

png("plot1.png")
with(dataExtract, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
dev.off()