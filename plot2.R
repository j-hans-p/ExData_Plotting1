#Read datafile
df <- read.table('household_power_consumption.txt', header = TRUE, sep = ";", dec = ".", na.strings = "?")

#Filter data to only desired dates
df$Date <- dmy(df$Date)
plotdata <- filter(df, df$Date >= "2007-02-01" & df$Date <= "2007-02-02" )

#Create DateTime
plotdata$DateTime <- strptime(paste(plotdata$Date, plotdata$Time), tz = "", format = "%Y-%m-%d %H:%M:%S")

#Create Plot
png(file = "plot2.png")
with(plotdata, plot(DateTime,Global_active_power, type = "l", xlab ="", ylab = "Global Active Power (kilowatts"))
dev.off()