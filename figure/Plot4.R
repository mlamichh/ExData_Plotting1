# Reading File.
header <- read.table('household_power_consumption.txt', nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE, na.strings="?")
dat   <- read.table('household_power_consumption.txt', skip = 2, header = FALSE, stringsAsFactors = FALSE, sep =';',na.strings="?")
colnames( dat ) <- unlist(header)
dat$Date <- strptime(dat$Date, format="%d/%m/%Y")

# Selecting only data corresponding with the Date 2007-02-01 and 2007-02-02.

subData <- dat[as.Date(dat$Date) == as.Date("2007-02-01") | as.Date(dat$Date) == as.Date("2007-02-02"), ]
finalData$newdate = with(finalData, as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S"))

# Plotting all four plots opening device png.
png(filename="Plot4.png", width=480, height=480)

par(mfcol=c(2,2))
#Plotting 1st plot. 
with(finalData, {plot(newdate, Global_active_power, type="l", ylab="Global Active Power", xlab="")
})
# Plotting 2nd plot.
with(finalData, {
plot(newdate, Sub_metering_1, col="black", type="l", ylim = range(c(0, 40)),xlab="", ylab="Energy sub metering")
par(new=TRUE)
plot(newdate, Sub_metering_2, col = "red",type="l",ylim = range(c(0, 40)) ,xlab="", ylab="")
par(new=TRUE)
plot(newdate, finalData$Sub_metering_3, col = "blue", type="l",ylim = range(c(0, 40)),xlab="", ylab="")

legend("topright",col = c("black", "red", "blue"),lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
})
# Plotting 3rd plot.
with(finalData,{plot(newdate, Voltage, type="l", xlab="datetime", ylab="Voltage")
})
# Plotting 4th Plot.
with(finalData, {plot(newdate, Global_reactive_power, type="l",  ylab="Global_reactive_power", xlab="datetime")
})
dev.off()