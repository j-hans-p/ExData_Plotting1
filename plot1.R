#Read datafile
df <- read.table('household_power_consumption.txt', header = TRUE, sep = ";", dec = ".", na.strings = "?")

#Filter data to only desired dates
df$Date <- dmy(df$Date)
plotdata <- filter(df, df$Date >= "2007-02-01" & df$Date <= "2007-02-02" )

#Create DateTime
plotdata$DateTime <- strptime(paste(plotdata$Date, plotdata$Time), tz = "", format = "%Y-%m-%d %H:%M:%S")

#Create Plot
png(file = "plot1.png")
hist(plotdata$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()