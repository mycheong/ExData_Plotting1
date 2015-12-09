header <- read.csv("household_power_consumption.txt", header=T, sep=";", nrow=1)
header <- names(header)

y <- read.table("household_power_consumption.txt", sep=";", skip=66000, nrows=4000, na.strings = "?")
colnames(y)<- header
y$Date <- as.Date(y$Date, format="%d/%m/%Y")
y <- subset(y, y$Date>"2007-01-31" & y$Date<"2007-02-03")
xlabel <- c("Thu", "Fri", "Sat")


## Plot 2
##
png(filename = "plot2.png", width = 480, height = 480, units = "px")

plot(y$Global_active_power, type="l", ylab="Active Global Power (kilowatts)", xaxt="n", xlab="")
axis(side=1, at =c(1, 1441, 2880), labels=xlabel)

dev.off()
