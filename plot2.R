## Read the data

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## make new column with date and time together using lubridate package
require(dplyr)
require(lubridate)

data$date_and_time <- dmy_hms(paste(data$Date, data$Time, sep = " "))
data$Date <- dmy(data$Date)


## filter data only for 2012
assignment_data <- filter(data, Date == ymd("2007-02-01") | Date == ymd("2007-02-02"))


## make the plot

png("plot2.png", height = 480, width = 480)

plot(assignment_data$date_and_time, 
     assignment_data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()

