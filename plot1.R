## plot1.R  this the script which used to do the following.
## load the Electric power consumption  data from the dates 2007-02-01 and 2007-02-02
## plot plot1

## loading full dataset
dateFileURI <- "./data/household_power_consumption.txt"
epcData <- read.csv("./data/household_power_consumption.txt", sep = ";", na.strings = "?")

## read data from the dates 2007-02-01 and 2007-02-02
subSetEpcData1  <- subset(epcData,as.Date(epcData$Date,format ="%d/%m/%Y") == "2007-02-01")
subSetEpcData2  <- subset(epcData,as.Date(epcData$Date,format ="%d/%m/%Y") == "2007-02-02")

#combine the two sub date sets from  the dates 2007-02-01 and 2007-02-02
subEpcData <- rbind(subSetEpcData1,subSetEpcData2)

#plot the the plot1
globalActivePower <- as.numeric(subEpcData$Global_active_power)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# save the plot to PNG
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

