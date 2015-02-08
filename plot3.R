Sys.setlocale("LC_ALL", "English_United States.1252")

library(data.table)
dataFile = "household_power_consumption.txt"
dat <- fread(paste('grep "^[12]/2/2007"', dataFile), na.strings="?")
setnames(dat, colnames(fread(dataFile, nrows=0)))
dat$datetime <- as.POSIXct(dat$Date, format = "%d/%m/%Y") + as.ITime(dat$Time, format = "%H:%M:%S")

## Plot3
png("plot3.png", width = 480, height = 480)
par(mfrow=c(1,1))
with(dat, plot(datetime, Sub_metering_1, type = 'l', xlab="", ylab="Energey sub metering"))
with(dat, points(datetime, Sub_metering_2, col = "red", type = 'l'))
with(dat, points(datetime, Sub_metering_3, col = "blue", type = 'l'))
legend("topright", lwd=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()