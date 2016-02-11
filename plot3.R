startOfTable <- read.table("household_power_consumption.txt", header = TRUE, nrows = 1, sep=";", stringsAsFactors = FALSE)
namesCol <- colnames(startOfTable)

firstTableDate <- strptime(paste(startOfTable$Date[1], startOfTable$Time[1]), "%d/%m/%Y %H:%M:%S")

firstUsefulDate <- strptime("01/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S")

endDate <- strptime("03/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S")

linesToSkip <- as.numeric(difftime(firstUsefulDate, firstTableDate, units = c("mins")))
linesToGet <- as.numeric(difftime(endDate, firstUsefulDate, units = c("mins")))

dataExtract <- read.table("household_power_consumption.txt", header = TRUE, skip = linesToSkip, nrows = linesToGet, sep=";", stringsAsFactors = FALSE)
colnames(dataExtract) <- namesCol

png("plot3.png")
with(dataExtract, plot(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
with(dataExtract, lines(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_1))
with(dataExtract, lines(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_2, col = "red"))
with(dataExtract, lines(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_3, col = "blue"))
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1), # gives the legend appropriate symbols (lines)
       col=c("black","red", "blue"))
dev.off()