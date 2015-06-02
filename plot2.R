# Load Required Libraries 
library(sqldf) 
library(lubridate) 

# Read data for '1/2/2007' and '2/2/2007' 
hpc <- read.csv.sql("household_power_consumption.txt", sql = "select * from file  where Date in ('1/2/2007', '2/2/2007')", sep = ";") 

# Convert Date and Time to proper types 
hpc$Date<-dmy(hpc$Date) 
hpc$Time<-hms(hpc$Time) 
hpc$DateTime<-hpc$Date+hpc$Time 

# Open PNG Graphic Device
png(filename = "plot2.png", width = 480, height = 480)

# Draw Graphic
plot(hpc$DateTime, hpc$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)") 

# Close Graphic Device
dev.off()
