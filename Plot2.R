rm(list=ls(all=TRUE))
setwd("D:/Mukund/MTech/Coursera/_DATA SCIENCE/04_ExploratoryDataAnalysis")
AllData <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
AllData$Date <- as.Date(AllData$Date, format="%d/%m/%Y")

## Subsetting the data
data <- subset(AllData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(AllData)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## ___________________________________________________________________________Plot 2
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Saving Plot 2
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

