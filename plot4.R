# Read and filter data
file_name <- "household_power_consumption.txt"
data <- read.table(file_name, header=T, sep=";")
finalData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#generate Plot #4
datetime <- strptime(paste(finalData$Date, finalData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
finalData$Global_active_power <- as.numeric(finalData$Global_active_power)
finalData$Global_reactive_power <- as.numeric(finalData$Global_reactive_power)
finalData$Voltage <- as.numeric(finalData$Voltage)
finalData$Sub_metering_1 <- as.numeric(as.character(finalData$Sub_metering_1))
finalData$Sub_metering_2 <- as.numeric(as.character(finalData$Sub_metering_2))
finalData$Sub_metering_3 <- as.numeric(as.character(finalData$Sub_metering_3))

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

#Row 1 Col 1
plot(datetime, finalData$Global_active_power, type="l", xlab="", ylab="Global Active Power")

#Row 1 Col 2
plot(datetime, finalData$Voltage, type="l", xlab="datetime", ylab="Voltage")

#Row 2 Col 1
plot(datetime,finalData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime,finalData$Sub_metering_2,col="red")
lines(datetime,finalData$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))

#Row 2 Col 2
plot(datetime, finalData$Global_reactive_power, type="l", xlab="datetime", ylab="Global Rective Power")

dev.off()