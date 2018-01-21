# Read the data from file
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Change to Date type
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# subset the data only for two days
subsetData <- data[(data$Date == "2007-02-01" | data$Date == "2007-02-02"), ]

# Creating a temoparory variable to hold Date and Time
datetime <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 

# Change graphic device to PNG  
png("plot3.png", width = 480, height = 480)

# Plot
plot(datetime, subsetData$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(datetime, subsetData$Sub_metering_2, col = "red")
lines(datetime, subsetData$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col=c("black", "red", "blue"))

# Close the PNG device
dev.off()