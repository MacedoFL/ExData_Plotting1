# Load Required Libraries 
library(sqldf) 
library(lubridate) 

# Read data for '1/2/2007' and '2/2/2007' 
hpc <- read.csv.sql("household_power_consumption.txt", sql = "select * from file  where Date in ('1/2/2007', '2/2/2007')", sep = ";") 

# Convert Date and Time to proper types 
hpc$Date<-dmy(hpc$Date) 
hpc$Time<-hms(hpc$Time) 

# Open PNG Graphic Device
png(filename = "plot1.png", width = 480, height = 480)

# Draw Graphic
hist(hpc$Global_active_power, breaks=12, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)") 

# Close Graphic Device
dev.off()
