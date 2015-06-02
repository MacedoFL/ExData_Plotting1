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
png(filename = "plot3.png", width = 480, height = 480)

# Draw Graphic
plot(hpc$DateTime, hpc$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black") 
lines(hpc$DateTime,hpc$Sub_metering_2, col="red") 
lines(hpc$DateTime,hpc$Sub_metering_3, col="blue") 
legend('topright', names(hpc)[7:9], col=c("black","red","blue"), lty=1) 

# Close Graphic Device
dev.off()
