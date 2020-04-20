#Read datafile
df <- read.table('household_power_consumption.txt', header = TRUE, sep = ";", dec = ".", na.strings = "?")

#Filter data to only desired dates
df$Date <- dmy(df$Date)
plotdata <- filter(df, df$Date >= "2007-02-01" & df$Date <= "2007-02-02" )

#Create DateTime
plotdata$DateTime <- strptime(paste(plotdata$Date, plotdata$Time), tz = "", format = "%Y-%m-%d %H:%M:%S")

#Create Plot
png(file = "plot4.png")
par = par(mfrow = c(2,2))

#plot1
with(plotdata, plot(DateTime,Global_active_power, type = "l", xlab ="", ylab = "Global Active Power (kilowatts"))

#plot2
with(plotdata, plot(DateTime,Voltage, type = "l", xlab ="datetime", ylab = "Voltage"))

#plot3
with(plotdata, plot(DateTime,Sub_metering_1, type = "l", xlab ="", ylab = "Energy sub metering", col = "red"))
with(plotdata, points(DateTime,Sub_metering_2, type = "l", col = "green"))
with(plotdata, points(DateTime,Sub_metering_3, type = "l", col = "blue"))
legend("topright", bty = "n", col = c(1:3),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#plot4
with(plotdata, plot(DateTime,Global_reactive_power, type = "l", xlab ="datetime", ylab = "Global_reactive_power"))

dev.off()