data <- read.table("household_power_consumption.txt", sep=";", header = TRUE,
                   na.strings = "?")

data$Date <- strptime(data$Date, format = "%d/%m/%Y")
data2 <- data[data$Date >= as.POSIXct("2007-02-01") 
              & data$Date <= as.POSIXct("2007-02-02"), ]


png("ExData_Plotting1/plot1.png", height = 480, width = 480)
hist(data2$Global_active_power, col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()
