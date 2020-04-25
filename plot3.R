# reading data

setwd("D:/PhD WORKS/DS/Coursera/Exploratory data analysis/Week 1/exdata_data_household_power_consumption")

data_file <- file("household_power_consumption.txt")
data <- read.table(text = grep("^[1,2]/2/2007", readLines(data_file), value = TRUE),
                   col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                   sep = ";", header = TRUE)

library(lubridate)

data$daytime <- paste(data$Date, data$Time)
data$daytime <- dmy_hms(data$daytime)

# transform into numeric
for (i in 3:9){data[,i] <- as.numeric(as.character(data[,i]))}



# Making plots
# Plot 3
png(filename = "plot3.png")
plot(data$daytime,data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$daytime,data$Sub_metering_2, col = "red")
lines(data$daytime,data$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1)
dev.off()