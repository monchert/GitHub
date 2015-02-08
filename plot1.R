Sys.setlocale("LC_ALL", "English_United States.1252")

library(data.table)
dataFile = "household_power_consumption.txt"
dat <- fread(paste('grep "^[12]/2/2007"', dataFile), na.strings="?")
setnames(dat, colnames(fread(dataFile, nrows=0)))
dat$datetime <- as.POSIXct(dat$Date, format = "%d/%m/%Y") + as.ITime(dat$Time, format = "%H:%M:%S")

## Plot1
png("plot1.png", width = 480, height = 480)
par(mfrow=c(1,1))
hist(dat$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="Red")
dev.off()