# Reads 'Electric power consumption' dataset and plots four variables
# as function of time in a single graph. Project 1, Exploratory Data Analysis

# Change working directory as needed
setwd("~/Data Science Specialization/Exploratory Data Analysis")

# Read data
df = read.table(file = "household_power_consumption.txt", header = TRUE,sep = ";",na.strings = "?", stringsAsFactors=FALSE)

# Subset on the two days of interest
df = subset(df, (df$Date == "1/2/2007") | (df$Date == "2/2/2007"))

# Create vector with time combining 'Date' and 'Time' strings.
t = paste(as.character(df$Date), as.character(df$Time), sep = " ")
t = strptime(t, "%d/%m/%Y %H:%M:%S")
# Append to data frame
df <- cbind(t,df)

# Plot  to a png file
png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
with(df, {
  plot(t,Global_active_power, xlab ="", ylab = "Global Active Power", type = "l")
  plot(t,Voltage, xlab ="datetime", ylab = "Voltage", type = "l")
  plot(t, Sub_metering_1,type = "n", xlab ="", ylab = "Energy sub metering")
  points(t, Sub_metering_1, type = "l", col='black')
  points(t, Sub_metering_2, type = "l", col='red')
  points(t, Sub_metering_3, type = "l", col='blue')
  legend("topright", lty=1, lwd=1, col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty ="n")
  plot(t,Global_reactive_power, xlab ="datetime", ylab = "Global_reactive_power", type = "l")
})
dev.off()
