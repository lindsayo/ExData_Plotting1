df <- read.table("../household_power_consumption.txt", header=T, sep=";")
df$Date <- as.Date(df$Date, "%d/%m/%Y")
daysDF <- subset(df, Date == '2007-02-01' | Date == '2007-02-02')
daysDF$Global_active_power <- as.numeric(as.character(daysDF$Global_active_power))

# Make the first histogram, for plot1.PNG
hist(daysDF$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# Make the line graph, for plot2.PNG
mutate(daysDF, dateTime = paste(daysDF$Date, daysDF$Time, sep=" "))
daysDF$dateTime <- strptime(daysDF$dateTime, "%Y-%m-%d %H:%M:%S")
plot(daysDF$dateTime,daysDF$Global_active_power, type="l", main="Global Active Power per Day", ylab="Global Active Power (kilowatts)")

# Make the third line graph, plot3.PNG
plot(daysDF$dateTime, daysDF$Sub_metering_1, 
  type="l", col="black", 
  xlab="", ylab="Energy sub metering", 
  lines(daysDF$dateTime, daysDF$Sub_metering_2, type="l", col="red"),
  lines(daysDF$dateTime, daysDF$Sub_metering_3, type="l", col="blue"),
  legend(2000,9.5,c("foo","bar"),lty=c(1,1), lwd=c(2.5,2.5), col=c("blue","red"))
)
