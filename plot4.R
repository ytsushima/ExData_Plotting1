
data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

data2 <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

Sys.setlocale("LC_TIME","us")

data2$Date <- strptime(data2$Date, "%d/%m/%Y")
data2$datetime <- paste(data2$Date, data2$Time)
data2$datetime <- strptime(data2$datetime, "%Y-%m-%d %H:%M:%S")

data2$day <- weekdays(data2$datetime, abbreviate = TRUE)


#plot4
png(file="plot4.png")
par(mfrow=c(2,2))
with(data2, plot(datetime, Global_active_power, type="l", xlab = "", ylab = "Global Active Power"))
with(data2, plot(datetime, Voltage, type="l"))

with(data2, plot(datetime, Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering", ylim = c(0,40), yaxp = c(0, 30, 3)))
par(new=T)
with(data2, plot(datetime, Sub_metering_2, col="red", type="l", xlab = "", ylab = "Energy sub metering", ylim = c(0,40), yaxp = c(0, 30, 3)))
par(new=T)
with(data2, plot(datetime, Sub_metering_3, col="blue", type="l", xlab = "", ylab = "Energy sub metering", ylim = c(0,40), yaxp = c(0, 30, 3)))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1,1,1), bty="n",cex=0.8)

with(data2, plot(datetime, Global_reactive_power, type="l", ylim=c(0,0.5), yaxp=c(0,0.5,5)))
dev.off()
