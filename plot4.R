##IMPORTANT - Before running code, set your working directory in R, 
##then download household_power_consumption.txt to your working directory.

##Read the file "household_power_consumption.txt" and create the appropriate
##data subset "hpcsub":
hpc <- read.table("./household_power_consumption.txt", header = TRUE, 
                  sep = ";", stringsAsFactors = FALSE, dec = ".")
hpcsub <- hpc[hpc$Date %in% c("1/2/2007", "2/2/2007"), ]

##Convert needed columns to date/time or numeric formats:
datetime <- strptime(paste(hpcsub$Date, hpcsub$Time, sep = " "), 
                     "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(hpcsub$Global_active_power)
globalReactivePower <- as.numeric(hpcsub$Global_reactive_power)
voltage <- as.numeric(hpcsub$Voltage)
submeter1 <- as.numeric(hpcsub$Sub_metering_1)
submeter2 <- as.numeric(hpcsub$Sub_metering_2)
submeter3 <- as.numeric(hpcsub$Sub_metering_3)

##Open plot device and create Plot 4 in file plot4.png:
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

plot(datetime, globalActivePower, type = "l", xlab = "", 
     ylab = "Global Active Power")

plot(datetime, voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(datetime, submeter1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, submeter2, type = "l", col = "red")
lines(datetime, submeter3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, lwd = 1, col = c("black", "red", "blue"), bty = "n")

plot(datetime, globalReactivePower, type = "l", xlab = "datetime", 
     ylab = "Global_reactive_power")

##Close plot device:
dev.off()