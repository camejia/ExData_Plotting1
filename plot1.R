setwd("~/GitHub/ExData_Plotting1")

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              "exdata-data-household_power_consumption.zip");
unzip("exdata-data-household_power_consumption.zip")

# I opened the file in WordPad to determine that the column separator is a semicolon
hpc <- read.table("household_power_consumption.txt", header=TRUE, sep = ";")
hpc <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings="?", as.is=TRUE)
hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")
hpcdays <- hpc[hpc$DateTime >= strptime("2007-02-01", "%Y-%m-%d") &
                 hpc$DateTime < strptime("2007-02-03", "%Y-%m-%d"), ]

png(filename="plot1.png", width=480, height=480)
hist(hpcdays$Global_active_power,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     col="red")
dev.off()
