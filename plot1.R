header <- read.csv("household_power_consumption.txt", header=T, sep=";", nrow=1)
header <- names(header)

y <- read.table("household_power_consumption.txt", sep=";", skip=66000, nrows=4000, na.strings = "?")
colnames(y)<- header
y$Date <- as.Date(y$Date, format="%d/%m/%Y")
y <- subset(y, y$Date>"2007-01-31" & y$Date<"2007-02-03")


##Plot 1
##
png(filename = "plot1.png", width = 480, height = 480, units = "px")

hist(y$Global_active_power, breaks=12, col="red", xlab="Global Active Power(kilowatt)", main="Global Active Power")

dev.off()