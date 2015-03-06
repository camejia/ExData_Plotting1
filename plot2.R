setwd("~/GitHub/ExData_Plotting1")

# See plot1.R for code to download and unzip data file

# TODO: Copy "optimized" code to read and subset data here.

png(filename="plot2.png", width=480, height=480)
plot(hpcdays$DateTime, hpcdays$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()
