# Load and Subset Data ----------------------------------------------------

hpc <- read.table("household_power_consumption.txt",
                  header=TRUE, sep = ";", na.strings="?")

# Subset by date
hpcdays <- hpc[hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007", ]

# Create a column with combined Date and Time
hpcdays$DateTime <- strptime(paste(hpcdays$Date, hpcdays$Time),
                             "%d/%m/%Y %H:%M:%S")

# Plot Data ---------------------------------------------------------------

png(filename="plot4.png", width=480, height=480)
par(mfrow=c(2, 2))
with(hpcdays, {
  plot(hpcdays$DateTime, hpcdays$Global_active_power,
       type="l", xlab="", ylab="Global Active Power")
  plot(hpcdays$DateTime, hpcdays$Voltage,
       type="l", xlab="", ylab="Voltage")
  plot(hpcdays$DateTime, hpcdays$Sub_metering_1,
       type="l", col="black",
       xlab="", ylab="Energy sub metering")
  lines(hpcdays$DateTime, hpcdays$Sub_metering_2,
        type="l", col="red")
  lines(hpcdays$DateTime, hpcdays$Sub_metering_3,
        type="l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         lty=c(1, 1, 1), col=c("black", "red", "blue"))
  plot(hpcdays$DateTime, hpcdays$Global_reactive_power,
       type="l", xlab="datetime",
       ylab="Global_reactive_power")
})
par(mfrow=c(1, 1))
invisible(dev.off())

# NOTE: I couldn't get an exact match on the line widths,
# I experimented by calling plot with values of lwd less than 1, but with
# the png device there is a limit to how fine the line resolution can be.