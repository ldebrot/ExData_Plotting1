
# reading file into data.frame
mytable <- read.table("household_power_consumption.txt",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings="?", header = TRUE, sep=";")

# set optimal class for date and time 
mytable.Date <- as.Date(mytable$Date, format="%d/%m/%Y")

# select only data from 1st and 2nd February 2007
mytable <- subset(mytable, Date=="1/2/2007"| Date=="2/2/2007")

# set optimal class for date and time 
mytable$newDate <- strptime(paste(mytable$Date,"!",mytable$Time, sep=""), format="%d/%m/%Y!%H:%M:%S")

# Print plot directly to PNG file
png("plot2.png", width=480, height=480)
plot(x=mytable$newDate,y=mytable$Global_active_power,type="l",ylab="Global Active Power (kilowatts)", xlab="")
dev.off()