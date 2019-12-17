library(lubridate)

# Import the data

raw <- read.table("household_power_consumption.txt", skip = 66637, nrows = (69517-66638), sep = ";", col.names = c("date","time","globalActivePower","globalReactivePower","voltage","globalIntensity","sub1","sub2","sub3"), colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings = "?")

# merge 'date' and 'time' columns and parse it with lubridate

raw$time <- paste(raw$date, raw$time)
raw$time <- dmy_hms(raw$time)

# create plot number 1

hist(raw$globalActivePower, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power", ylim = c(0,1200))
dev.copy(png, "plot1.png", bg = "white", width = 480, height = 480, units = "px")
dev.off()