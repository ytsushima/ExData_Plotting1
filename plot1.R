# reading data
data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

data2 <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

Sys.setlocale("LC_TIME","us")

data2$Date <- strptime(data2$Date, "%d/%m/%Y")
data2$datetime <- paste(data2$Date, data2$Time)
data2$datetime <- strptime(data2$datetime, "%Y-%m-%d %H:%M:%S")

data2$day <- weekdays(data2$datetime, abbreviate = TRUE)


# plot1 

png(file="plot1.png")
hist(data2$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

