library(lubridate)

# Import the data

raw <- read.table("household_power_consumption.txt", skip = 66637, nrows = (69517-66638), sep = ";", col.names = c("date","time","globalActivePower","globalReactivePower","voltage","globalIntensity","sub1","sub2","sub3"), colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings = "?")

# merge 'date' and 'time' columns and parse it with lubridate

raw$time <- paste(raw$date, raw$time)
raw$time <- dmy_hms(raw$time)

# create plot number 2

plot(raw$time, raw$globalActivePower, type = "l",xlab = "",ylab = "Global Active Power (kilowatts)")
dev.copy(png, "plot2.png", bg = "white", width = 480, height = 480, units = "px")
dev.off()