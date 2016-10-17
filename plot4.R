# Get the data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", dest = "consumption.zip", method="curl")
unzip("consumption.zip")
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, colClasses = "character")

# Create a png file
png("plot4.png",width=480,height=480)

# Format the png file for four plots
par(mfrow=c(2,2),mar=c(4.5,4,4.5,4))

#First plot : subset active power for the required two days
active <- as.numeric(data[data$Date == "1/2/2007"|data$Date == "2/2/2007",3])

#Create the plot
plot(active,type="l",axes=FALSE, xlab="", ylab="Global Active Power")
axis(1, at=seq(0,2880,1440),labels=c("Thurs","Fri","Sat"))
axis(2, at=seq(0,8,by=2))
box()

#Second plot : subset voltage for the required two days
voltage <- as.numeric(data[data$Date == "1/2/2007"|data$Date == "2/2/2007",5])

#Create the plot
plot(voltage,type="l",axes=FALSE,xlab="",ylab="Voltage")

axis(1, at=seq(0,2880,1440),labels=c("Thurs","Fri","Sat"))
axis(2)
box()
title(xlab = "datetime")

#Third plot : subset sub metering for the required two days

submeter1 <- as.numeric(data[data$Date == "1/2/2007"|data$Date == "2/2/2007",7])
submeter2 <- as.numeric(data[data$Date == "1/2/2007"|data$Date == "2/2/2007",8])
submeter3 <- as.numeric(data[data$Date == "1/2/2007"|data$Date == "2/2/2007",9])

# Create the plot 
plot(submeter1,type="l",col="black",axes=FALSE,ann=FALSE)
lines(submeter2,type="l",col="red")
lines(submeter3,type="l",col="blue")

axis(1, at=seq(0,2880,1440),labels=c("Thurs","Fri","Sat"))
axis(2, at=seq(0,40,by=10))

title(ylab="Energy sub metering")


legend("topright",cex=.84,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"),bty="n")
box()

#Fourth plot: subset global reactive power for the required two days
x <- as.numeric(data[data$Date == "1/2/2007"|data$Date == "2/2/2007",4])

#Create the plot
plot(x,type="l",axes=FALSE,ylab="Global_reactive_power",xlab="")

axis(1, at=seq(0,2880,1440),labels=c("Thurs","Fri","Sat"))
axis(2)
title(xlab = "datetime")
box()

dev.off()
