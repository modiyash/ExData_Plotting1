# Read and filter data
file_name <- "household_power_consumption.txt"
data <- read.table(file_name, header=T, sep=";")
finalData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#generate Plot #3
datetime <- strptime(paste(finalData$Date, finalData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
finalData$Sub_metering_1 <- as.numeric(as.character(finalData$Sub_metering_1))
finalData$Sub_metering_2 <- as.numeric(as.character(finalData$Sub_metering_2))
finalData$Sub_metering_3 <- as.numeric(as.character(finalData$Sub_metering_3))

png("plot3.png", width=480, height=480)
plot(datetime,finalData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime,finalData$Sub_metering_2,col="red")
lines(datetime,finalData$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
dev.off()