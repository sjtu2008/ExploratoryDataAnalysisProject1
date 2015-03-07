## plot2.R  this the script which used to do the following.
## load the Electric power consumption  data from the dates 2007-02-01 and 2007-02-02
## plot plot2

## loading full dataset
dateFileURI <- "./data/household_power_consumption.txt"
epcData <- read.csv("./data/household_power_consumption.txt", sep = ";", na.strings = "?")

## read data from the dates 2007-02-01 and 2007-02-02
subSetEpcData1  <- subset(epcData,as.Date(epcData$Date,format ="%d/%m/%Y") == "2007-02-01")
subSetEpcData2  <- subset(epcData,as.Date(epcData$Date,format ="%d/%m/%Y") == "2007-02-02")

#combine the two sub date sets from  the dates 2007-02-01 and 2007-02-02
subEpcData <- rbind(subSetEpcData1,subSetEpcData2)


## plot the the plot2
globalActivePower <- as.numeric(subEpcData$Global_active_power)
datetime <- strptime(paste(subEpcData$Date, subEpcData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# save the plot to PNG
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
