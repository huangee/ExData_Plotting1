## reading in data
power <- read.delim("household_power_consumption.txt", sep = ";", na.strings = "?")

## subsetting data
power <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")

## converting Date to date format
power$Date <- as.Date(as.character(power$Date),"%d/%m/%Y")

## converting Time to character format
power$Time <- format(strptime(power$Time, format="%H:%M:%S"),"%H:%M:%S")

## create PNG file
png("plot1.png", width = 480, height = 480)

## create red histogram
hist(power$Global_active_power, main = "Global Active Power", 
     col = "red", xlab = "Global Active Power (kilowatts)")

## close file device
dev.off()