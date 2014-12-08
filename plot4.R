datesofinterest<-c("1/2/2007", "2/2/2007")
fulldata <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
filtereddata <- fulldata[fulldata$Date %in% datesofinterest,]
filtereddata$datetime <- strptime(paste(filtereddata$Date, filtereddata$Time), "%d/%m/%Y %H:%M:%S")
png(file="plot4.png", width=480, height=480, bg="transparent")
par(mfrow=c(2,2))
with (filtereddata, {
  #First
  plot(datetime, Global_active_power, type="l", xlab ="", ylab="Global Active Power")
  #Second
  plot(datetime, Voltage, type="l", xlab ="datetime", ylab="Voltage")
  #Third
  plot(datetime, Sub_metering_1, type="l", xlab ="", ylab="Energy sub metering", col="black")
  lines(datetime, Sub_metering_2, col="red")
  lines(datetime, Sub_metering_3, col="blue")
  legend("topright", col=c("black", "red", "blue"), lwd = 1, bty="n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  #Fourth
  plot(datetime, Global_reactive_power, type="l", xlab ="datetime", ylab="Global_reactive_power")
})
dev.off()