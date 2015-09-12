## This source code plots the fourth graph required for Course project 1, Explanatory Data Analysis, by Coursera
## Assumptions:
##      the file with the dataset (household_power_consumption.txt) should be in the working directory
##      dates are handles with lubridate package and dplyr is used for subsetting
## Output:
##      plot4.png - file containing the required plot

## Read the data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## make new column with date and time together using lubridate package
require(dplyr)
require(lubridate)

data$date_and_time <- dmy_hms(paste(data$Date, data$Time, sep = " "))
data$Date <- dmy(data$Date)


## filter data only for 2007-02-01 and 2007-02-02
assignment_data <- filter(data, Date == ymd("2007-02-01") | Date == ymd("2007-02-02"))


## make the plots and save them
scale_factor <- 0.9
png("plot4.png", height = 480, width = 480)

par(mfrow = c(2, 2))
## first plot
plot(assignment_data$date_and_time, 
     assignment_data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power", 
     cex.lab = scale_factor,
     cex.axis = scale_factor)


## second plot
plot(assignment_data$date_and_time, 
     assignment_data$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage",
     cex.lab = scale_factor,
     cex.axis = scale_factor)

## third plot
plot(assignment_data$date_and_time, 
     assignment_data$Sub_metering_1,
     type = "n",
     xlab = "",
     ylab = "Energy sub metering",
     cex.lab = scale_factor,
     cex.axis = scale_factor)

points(assignment_data$date_and_time, 
       assignment_data$Sub_metering_1,
       type = "l",
       col = "black")
points(assignment_data$date_and_time, 
       assignment_data$Sub_metering_2,
       type = "l",
       col = "red")
points(assignment_data$date_and_time, 
       assignment_data$Sub_metering_3,
       type = "l",
       col = "blue")
legend("topright", 
       legend = c(names(assignment_data[7:9])),
       lty = c(1, 1, 1), 
       col = c("black", "red", "blue"),
       border = "white",
       cex = scale_factor,
       bty = "n")

## fourth plot
plot(assignment_data$date_and_time, 
     assignment_data$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power",
     cex.lab = scale_factor,
     cex.axis = scale_factor)


dev.off()
