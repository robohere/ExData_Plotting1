# Read the data from file
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Change to Date type
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# subset the data only for two days
subsetData <- data[(data$Date == "2007-02-01" | data$Date == "2007-02-02"), ]

# Creating a temoparory variable to hold Date and Time
datetime <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 

# Change graphic device to PNG  
png("plot2.png", width = 480, height = 480)

# plot the histogram
plot(datetime, subsetData$Global_active_power, ylab = "Global Active Power (kilowatts)", type = "l", xlab = "")

# Close the PNG device
dev.off()