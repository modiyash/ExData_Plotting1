# Read and filter data
file_name <- "household_power_consumption.txt"
data <- read.table(file_name, header=T, sep=";")
finalData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#generate Plot #1
globalActivePower <- as.numeric(finalData$Global_active_power)

png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()