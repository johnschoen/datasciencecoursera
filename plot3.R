# Get the data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", dest = "consumption.zip", method="curl")
unzip("consumption.zip")
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, colClasses = "character")

# Subset submetering datasets for required days
submeter1 <- as.numeric(data[data$Date == "1/2/2007"|data$Date == "2/2/2007",7])
submeter2 <- as.numeric(data[data$Date == "1/2/2007"|data$Date == "2/2/2007",8])
submeter3 <- as.numeric(data[data$Date == "1/2/2007"|data$Date == "2/2/2007",9])

# Create a png file
png("plot3.png",width=480,height=480)

# Create the plot
plot(submeter1,type="l",col="black",axes=FALSE,ann=FALSE)
lines(submeter2,type="l",col="red")
lines(submeter3,type="l",col="blue")

axis(1, at=seq(0,2880,1440),labels=c("Thurs","Fri","Sat"))
axis(2, at=seq(0,40,by=10))

box()
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
dev.off()


