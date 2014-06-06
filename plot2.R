Sys.setlocale("LC_TIME", "English")
data <- read.table("household_power_consumption.txt", sep=";", header = TRUE,
                   na.strings = "?")

data$Date <- strptime(data$Date, format = "%d/%m/%Y")
data2 <- data[data$Date >= as.POSIXct("2007-02-01") 
              & data$Date <= as.POSIXct("2007-02-02"), ]

data2$datetime <- as.POSIXct(paste(data2$Date, data2$Time))

png("ExData_Plotting1/plot2.png", height = 480, width = 480)
plot(data2$datetime, data2$Global_active_power, type = "l", 
     ylab = "Global Active Power (kilowatts)",
     main = "Global Active Power in Time",
     xlab = "")
dev.off()
