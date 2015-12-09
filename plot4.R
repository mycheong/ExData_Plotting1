header <- read.csv("household_power_consumption.txt", header=T, sep=";", nrow=1)
header <- names(header)

y <- read.table("household_power_consumption.txt", sep=";", skip=66000, nrows=4000, na.strings = "?")
colnames(y)<- header
y$Date <- as.Date(y$Date, format="%d/%m/%Y")
y <- subset(y, y$Date>"2007-01-31" & y$Date<"2007-02-03")
xlabel <- c("Thu", "Fri", "Sat")


png(filename = "plot4.png", width = 480, height = 480, units = "px")

## plot 4
##
par(mfcol=c(2,2))

plot(y$Global_active_power, type="l", ylab="Active Global Power (kilowatts)", xaxt="n", xlab="")
axis(side=1, at =c(1, 1441, 2880), labels=xlabel)

plot(y$Sub_metering_1, type="l", ylab="Energy sub metering", col="black", xaxt="n", xlab="")
lines(y$Sub_metering_2, col="red")
lines(y$Sub_metering_3, col="blue")
axis(side=1, at =c(1, 1441, 2880), labels=xlabel)
legend("topright", names(y[,7:9]), lty=1, col=c(1,2,4), bty = "n")

plot(y$Voltage, type="l", ylab="Voltage", xaxt="n", xlab="datetime")
axis(side=1, at =c(1, 1441, 2880), labels=xlabel)

plot(y$Global_reactive_power, type="l", ylab="Global_reactive_power", xaxt="n", xlab="datetime")
axis(side=1, at =c(1, 1441, 2880), labels=xlabel)

dev.off()

