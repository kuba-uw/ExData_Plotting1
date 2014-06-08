Sys.setlocale("LC_TIME", "English")
data <- read.table("household_power_consumption.txt", sep=";", header = TRUE,
                   na.strings = "?")

data$Date <- strptime(data$Date, format = "%d/%m/%Y")
data2 <- data[data$Date >= as.POSIXct("2007-02-01") 
              & data$Date <= as.POSIXct("2007-02-02"), ]

data2$datetime <- as.POSIXct(paste(data2$Date, data2$Time))

png("ExData_Plotting1/plot4.png", height = 480, width = 480)

par(mfcol = c(2,2))

plot(data2$datetime, data2$Global_active_power, type = "l", 
     ylab = "Global Active Power", xlab = "")

plot(data2$datetime, data2$Sub_metering_1, type = "l", 
     ylab = "Energy sub metering", xlab = "")
lines(data2$datetime, data2$Sub_metering_2, col = "red")
lines(data2$datetime, data2$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = rep(1, 3), col=c("black","red","blue"))

plot(data2$datetime, data2$Voltage, type = "l", 
     ylab = "Voltage", xlab = "datetime")

plot(data2$datetime, data2$Global_reactive_power, type = "l", 
     ylab = "Global reactive power", xlab = "datetime")

dev.off()
