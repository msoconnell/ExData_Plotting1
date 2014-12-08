datesofinterest<-c("1/2/2007", "2/2/2007")
fulldata <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
filtereddata <- fulldata[fulldata$Date %in% datesofinterest,]
filtereddata$datetime <- strptime(paste(filtereddata$Date, filtereddata$Time), "%d/%m/%Y %H:%M:%S")
png(file="plot2.png", width=480, height=480, bg="transparent")
with (filtereddata, plot(datetime, Global_active_power, type="l", xlab ="", ylab="Global Active Power (kilowatts)"))
dev.off()