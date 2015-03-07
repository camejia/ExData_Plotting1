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

png(filename="plot2.png", width=480, height=480)
plot(hpcdays$DateTime, hpcdays$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")
invisible(dev.off())
