# Get the data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", dest = "consumption.zip", method="curl")
unzip("consumption.zip")
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, colClasses = "character")

# Subset active power for the first two days in February 2007
active <- as.numeric(data[data$Date == "1/2/2007"|data$Date == "2/2/2007",3])

# Create a png 
png("plot1.png",width=480,height=480)

#Create the histogram
hist(active,main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()

