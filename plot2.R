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

##Open plot device and create Plot 2 in file plot2.png:
png("plot2.png", width = 480, height = 480)
plot(datetime, globalActivePower, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")

##Close plot device:
dev.off()
