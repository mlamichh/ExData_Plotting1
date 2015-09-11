# Reading data file with heading.
header <- read.table('household_power_consumption.txt', nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE, na.strings="?")
dat   <- read.table('household_power_consumption.txt', skip = 2, header = FALSE, stringsAsFactors = FALSE, sep =';',na.strings="?")
colnames( dat ) <- unlist(header)

# Converting date format to %Y-%m-%d.
dat$Date <- strptime(dat$Date, format="%d/%m/%Y")

# Selecting data only with the date 2007-02-01 and 2007-02-02.
subData <- dat[as.Date(dat$Date) == as.Date("2007-02-01") | as.Date(dat$Date) == as.Date("2007-02-02"), ]
finalData$newdate = with(finalData, as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S"))

# Opening plot device.
png(filename="Plot2.png", width=480, height=480)
plot(finalData$newdate, finalData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()