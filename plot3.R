
# reading file into data.frame
mytable <- read.table("household_power_consumption.txt",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings="?", header = TRUE, sep=";")

# set optimal class for date and time 
mytable.Date <- as.Date(mytable$Date, format="%d/%m/%Y")

# select only data from 1st and 2nd February 2007
mytable <- subset(mytable, Date=="1/2/2007"| Date=="2/2/2007")

# set optimal class for date and time 
mytable$newDate <- strptime(paste(mytable$Date,"!",mytable$Time, sep=""), format="%d/%m/%Y!%H:%M:%S")

# Print plot directly to PNG file
png("plot3.png", width=480, height=480)
plot(x=mytable$newDate,y=mytable$Sub_metering_1,col="black",type="l", ylab="Energy sub metering", xlab="")
lines(x=mytable$newDate,y=mytable$Sub_metering_2,col="red",type="l")
lines(x=mytable$newDate,y=mytable$Sub_metering_3,col="blue",type="l")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lwd=1)
dev.off()