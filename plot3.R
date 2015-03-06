setwd("~/GitHub/ExData_Plotting1")

# See plot1.R for code to download and unzip data file

# TODO: Copy "optimized" code to read and subset data here.

png(filename="plot3.png", width=480, height=480)
plot(hpcdays$DateTime, hpcdays$Sub_metering_1,
     type="l", col="blue",
     xlab="", ylab="Energy sub metering")
lines(hpcdays$DateTime, hpcdays$Sub_metering_2,
      type="l", col="red")
lines(hpcdays$DateTime, hpcdays$Sub_metering_3,
      type="l", col="green")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1, 1, 1), col=c("blue", "red", "green"))
dev.off()
