Sys.setlocale("LC_ALL", "English_United States.1252")

library(data.table)
dataFile = "household_power_consumption.txt"
dat <- fread(paste('grep "^[12]/2/2007"', dataFile), na.strings="?")
setnames(dat, colnames(fread(dataFile, nrows=0)))
dat$datetime <- as.POSIXct(dat$Date, format = "%d/%m/%Y") + as.ITime(dat$Time, format = "%H:%M:%S")

## Plot4
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
with(dat, {
    plot(datetime, Global_active_power, type = 'l', xlab="", ylab="Global Active Power")
    plot(datetime, Voltage, type = 'l', ylab="Voltage")
    plot(datetime, Sub_metering_1, type = 'l', xlab="", ylab="Energey sub metering")
    points(datetime, Sub_metering_2, col = "red", type = 'l')
    points(datetime, Sub_metering_3, col = "blue", type = 'l')
    legend("topright", lwd=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")
    plot(datetime, Global_reactive_power, type = 'l', ylab="Global_reactive_power")
})
dev.off()