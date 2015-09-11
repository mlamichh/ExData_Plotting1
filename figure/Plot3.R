# Reading data file.
header <- read.table('household_power_consumption.txt', nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE, na.strings="?")
dat   <- read.table('household_power_consumption.txt', skip = 2, header = FALSE, stringsAsFactors = FALSE, sep =';',na.strings="?")
colnames( dat ) <- unlist(header)
dat$Date <- strptime(dat$Date, format="%d/%m/%Y")

# Selecting data with date 2007-02-01 and 2007-02-02.

subData <- dat[as.Date(dat$Date) == as.Date("2007-02-01") | as.Date(dat$Date) == as.Date("2007-02-02"), ]
finalData$newdate = with(finalData, as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S"))

# Opening plot device png.

png(filename="Plot3.png", width=480, height=480)
plot(finalData$newdate, finalData$Sub_metering_1, col="black", type="l", ylim = range(c(0, 40)), xlab="", ylab="Energy sub metering")
par(new=TRUE)
plot(finalData$newdate, finalData$Sub_metering_2, col = "red", type="l", ylim = range(c(0, 40)), xlab="", ylab="")
par(new=TRUE)
plot(finalData$newdate, finalData$Sub_metering_3, col = "blue", type="l", ylim = range(c(0, 40)),xlab="", ylab="")
legend("topright",col = c("black", "red", "blue"),lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()