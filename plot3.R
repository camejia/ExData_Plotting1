# See plot1.R for code to download and unzip data file

# Load and Subset Data ----------------------------------------------------

hpc <- read.table("household_power_consumption.txt",
                  header=TRUE, sep = ";", na.strings="?")

# Subset by date
hpcdays <- hpc[hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007", ]

# Create a column with combined Date and Time
hpcdays$DateTime <- strptime(paste(hpcdays$Date, hpcdays$Time),
                             "%d/%m/%Y %H:%M:%S")

# Plot Data ---------------------------------------------------------------

png(filename="plot3.png", width=480, height=480)
plot(hpcdays$DateTime, hpcdays$Sub_metering_1,
     type="l", col="black",
     xlab="", ylab="Energy sub metering")
lines(hpcdays$DateTime, hpcdays$Sub_metering_2,
      type="l", col="red")
lines(hpcdays$DateTime, hpcdays$Sub_metering_3,
      type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1, 1, 1), col=c("black", "red", "blue"))
invisible(dev.off())

# NOTE: I couldn't get an exact match on the blue color,
# but hopefully it's close enough!
