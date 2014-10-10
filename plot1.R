# Reads 'Electric power consumption' dataset and plots
# histogram. Project 1, Exploratory Data Analysis

# Change working directory as needed
setwd("~/Data Science Specialization/Exploratory Data Analysis")

# Read data
df = read.table(file = "household_power_consumption.txt", header = TRUE,sep = ";",na.strings = "?", stringsAsFactors=FALSE)

# Subset on the two days of interest
df = subset(df, (df$Date == "1/2/2007") | (df$Date == "2/2/2007"))

# Plot histogram to a png file
png(file = "plot1.png", width = 480, height = 480)
hist(df$Global_active_power,col = "red",xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()

