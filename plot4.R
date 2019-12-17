library(lubridate)

# Import the data

raw <- read.table("household_power_consumption.txt", skip = 66637, nrows = (69517-66638), sep = ";", col.names = c("date","time","globalActivePower","globalReactivePower","voltage","globalIntensity","sub1","sub2","sub3"), colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings = "?")

# merge 'date' and 'time' columns and parse it with lubridate

raw$time <- paste(raw$date, raw$time)
raw$time <- dmy_hms(raw$time)

# create plot number 4

par(mfrow = c(2,2), mar = c(4,4,3,2))

plot(raw$time, raw$globalActivePower, type = "l",xlab = "",ylab = "Global Active Power (kilowatts)")

plot(raw$time, raw$voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(raw$time, raw$sub1, type = "l",xlab = "",ylab = "Energy sub metering")
lines(raw$time, raw$sub2, type = "l", col = "red")
lines(raw$time, raw$sub3, type = "l", col = "blue")
legend("topright", "(x,y)", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty =1, cex = 0.6, bty = "n")

plot(raw$time, raw$globalReactivePower, type="l", xlab = "datetime", ylab = "Global reactive power")
dev.copy(png, "plot4.png", bg = "white", width = 480, height = 480, units = "px")
dev.off()