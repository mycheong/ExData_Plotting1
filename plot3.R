header <- read.csv("household_power_consumption.txt", header=T, sep=";", nrow=1)
header <- names(header)

y <- read.table("household_power_consumption.txt", sep=";", skip=66000, nrows=4000, na.strings = "?")
colnames(y)<- header
y$Date <- as.Date(y$Date, format="%d/%m/%Y")
y <- subset(y, y$Date>"2007-01-31" & y$Date<"2007-02-03")
xlabel <- c("Thu", "Fri", "Sat")

png(filename = "plot3.png", width = 480, height = 480, units = "px")

## Plot 3
##
plot(y$Sub_metering_1, type="l", ylab="Energy sub metering", col="black", xaxt="n", xlab="")
lines(y$Sub_metering_2, col="red")
lines(y$Sub_metering_3, col="blue")
axis(side=1, at =c(1, 1441, 2880), labels=xlabel)
legend("topright", names(y[,7:9]), lty=1, col=c(1,2,4))

dev.off()