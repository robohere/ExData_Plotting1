# Read the data from file
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Change to Date type
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# subset the data only for two days
subsetData <- data[(data$Date == "2007-02-01" | data$Date == "2007-02-02"), ]

# Change graphic device to PNG  
png("plot1.png", width = 480, height = 480)

# plot the histogram
hist(subsetData$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# Close the PNG device
dev.off()