# Download and Unzip Data -------------------------------------------------

# download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
#               "exdata-data-household_power_consumption.zip");
# dateDownloaded <- date()
# dateDownloaded
# unzip("exdata-data-household_power_consumption.zip")
# file.info(dir())
# # unzip created a new text file "household_power_consumption.txt"
# # look at the first few lines of the text file to figure out what to do next
# readLines("household_power_consumption.txt", n=10)
# # Apparently there is a header row, and the column separator is a semicolon
# # We've also been told that in this dataset missing values are coded as ?

# Load and Subset Data ----------------------------------------------------

hpc <- read.table("household_power_consumption.txt",
                  header=TRUE, sep = ";", na.strings="?")

# Subset by date
hpcdays <- hpc[hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007", ]

# Create a column with combined Date and Time
hpcdays$DateTime <- strptime(paste(hpcdays$Date, hpcdays$Time),
                             "%d/%m/%Y %H:%M:%S")

# Plot Data ---------------------------------------------------------------

png(filename="plot1.png", width=480, height=480)
hist(hpcdays$Global_active_power,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     col="red")
invisible(dev.off())  # invisible suppresses output "RstudioGD 2"
