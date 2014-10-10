# Reads 'Electric power consumption' dataset and plots active power
# as function of time. Project 1, Exploratory Data Analysis

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
png(file = "plot2.png", width = 480, height = 480)
plot(df$t,df$Global_active_power, xlab ="", ylab = "Global Active Power (kilowatts)", type = "l")
dev.off()
