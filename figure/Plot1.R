# Reading data file.
header <- read.table('household_power_consumption.txt', nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE, na.strings="?")
dat   <- read.table('household_power_consumption.txt', skip = 2, header = FALSE, stringsAsFactors = FALSE, sep =';',na.strings="?")
colnames( dat ) <- unlist(header)

# Converting date format %d/%m/%Y to %Y-%m-%d.
dat$Date <- strptime(dat$Date, format="%d/%m/%Y")
subData <- dat[as.Date(dat$Date) == as.Date("2007-02-01") | as.Date(dat$Date) == as.Date("2007-02-02"), ]

# Opening plot device.
png(filename="Plot1.png", width=480, height=480)

# Plotting histogram.
hist(finalData$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
dev.off()