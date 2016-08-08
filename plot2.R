# Read and filter data
file_name <- "household_power_consumption.txt"
data <- read.table(file_name, header=T, sep=";")
finalData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#generate Plot #2
datetime <- strptime(paste(finalData$Date, finalData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(finalData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()