setwd("~/GitHub/ExData_Plotting1")

# See plot1.R for code to download and unzip data file

# TODO: Copy "optimized" code to read and subset data here.

png(filename="plot4.png", width=480, height=480)
par(mfrow=c(2, 2))
with(hpcdays, {
  plot(hpcdays$DateTime, hpcdays$Global_active_power,
       type="l", xlab="", ylab="Global Active Power (kilowatts)")
  plot(hpcdays$DateTime, hpcdays$Voltage,
       type="l", xlab="", ylab="Voltage")
  plot(hpcdays$DateTime, hpcdays$Sub_metering_1,
       type="l", col="blue",
       xlab="", ylab="Energy sub metering")
  lines(hpcdays$DateTime, hpcdays$Sub_metering_2,
        type="l", col="red")
  lines(hpcdays$DateTime, hpcdays$Sub_metering_3,
        type="l", col="green")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         lty=c(1, 1, 1), col=c("blue", "red", "green"))
  plot(hpcdays$DateTime, hpcdays$Global_reactive_power,
       type="l", xlab="datetime",
       ylab="Global_reactive_power")
})
par(mfrow=c(1, 1))
dev.off()
