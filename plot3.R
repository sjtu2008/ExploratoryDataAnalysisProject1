## plot3.R  this the script which used to do the following.
## load the Electric power consumption  data from the dates 2007-02-01 and 2007-02-02
## plot plot3

## loading full dataset
dateFileURI <- "./data/household_power_consumption.txt"
epcData <- read.csv("./data/household_power_consumption.txt", sep = ";", na.strings = "?")

## read data from the dates 2007-02-01 and 2007-02-02
subSetEpcData1  <- subset(epcData,as.Date(epcData$Date,format ="%d/%m/%Y") == "2007-02-01")
subSetEpcData2  <- subset(epcData,as.Date(epcData$Date,format ="%d/%m/%Y") == "2007-02-02")

#combine the two sub date sets from  the dates 2007-02-01 and 2007-02-02
subEpcData <- rbind(subSetEpcData1,subSetEpcData2)


## getting data for plot3
globalActivePower <- as.numeric(subEpcData$Global_active_power)
Sub_metering_1 <- as.numeric(subEpcData$Sub_metering_1)
Sub_metering_2 <- as.numeric(subEpcData$Sub_metering_2)
Sub_metering_3 <- as.numeric(subEpcData$Sub_metering_3)
datetime <- strptime(paste(subEpcData$Date, subEpcData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## plot the plot3
plot(datetime, Sub_metering_1, type="l",xlab="",ylab="Energy Submetering")
lines(datetime, Sub_metering_2, type="l", col="red")
lines(datetime, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

# save the plot to PNG
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
