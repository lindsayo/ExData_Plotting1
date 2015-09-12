library(dplyr)
setwd(".")
df <- read.table("../household_power_consumption.txt", header=T, sep=";")
df$Date <- as.Date(df$Date, "%d/%m/%Y")
daysDF <- subset(df, Date == '2007-02-01' | Date == '2007-02-02')
daysDF$Global_active_power <- as.numeric(as.character(daysDF$Global_active_power))
daysDF$Sub_metering_2 <- as.numeric(as.character(daysDF$Sub_metering_2))
daysDF$Sub_metering_1 <- as.numeric(as.character(daysDF$Sub_metering_1))
daysDF$Global_reactive_power <- as.numeric(as.character(daysDF$Global_reactive_power))
daysDF$Voltage <- as.numeric(as.character(daysDF$Voltage))
daysDF <- mutate(daysDF, dateTime = paste(daysDF$Date, daysDF$Time, sep=" "))
daysDF$dateTime <- strptime(daysDF$dateTime, "%Y-%m-%d %H:%M:%S")

# Make the third line graph, plot3.PNG
png(file="plot3.PNG", bg="transparent", width = 480, height = 480, units = "px")
plot(daysDF$dateTime, daysDF$Sub_metering_1, 
     type="l", col="black", 
     xlab="", ylab="Energy sub metering"
)
lines(daysDF$dateTime, daysDF$Sub_metering_2, type="l", col="red")
lines(daysDF$dateTime, daysDF$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=c(2.5,2.5), lty=c(1,1,1), col=c("black","red","blue"))
dev.off()