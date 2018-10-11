## reading in data
power <- read.delim("household_power_consumption.txt", sep = ";", na.strings = "?")

## subsetting data
power <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")

## converting Date to date format
power$Date <- as.Date(as.character(power$Date),"%d/%m/%Y")

## converting Time to character format
power$Time <- format(strptime(power$Time, format="%H:%M:%S"),"%H:%M:%S")

## adding DateTime col
power$DateTime <- as.POSIXct(paste(power$Date, power$Time))

## create PNG file
png("plot4.png", width = 480, height = 480)

## change parameters to fit 4 plots
par(mfrow = c(2,2))

## create first plot
plot(power$DateTime, power$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

## second plot
plot(power$DateTime, power$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

## third plot
plot(power$DateTime, power$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(power$DateTime, power$Sub_metering_2, col = "red")
lines(power$DateTime, power$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         col = c("black", "red", "blue"), lty = "solid")

## fourth plot
plot(power$DateTime, power$Global_reactive_power, type = "l", 
     ylab = "Global_reactive_power", xlab = "datetime")

## close file device
dev.off()