# Read the data from file
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Change to Date type
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# subset the data only for two days
subsetData <- data[(data$Date == "2007-02-01" | data$Date == "2007-02-02"), ]

# Creating a temoparory variable to hold Date and Time
datetime <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), "%Y-%m-%d %H:%M:%S")

# Change graphic device to PNG  
png("plot4.png", width = 480, height = 480)

# Create 4 blocks with 2 rows and 2 columns
par(mfrow = c(2,2))

plot(datetime, subsetData$Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")
plot(datetime, subsetData$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")

plot(datetime, subsetData$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(datetime, subsetData$Sub_metering_2, col = "red")
lines(datetime, subsetData$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col=c("black", "red", "blue"))

plot(datetime, subsetData$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type = "l")

# Close the PNG device
dev.off()