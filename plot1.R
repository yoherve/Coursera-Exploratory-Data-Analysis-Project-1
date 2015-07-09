##IMPORTANT - Before running code, set your working directory in R, 
##then download household_power_consumption.txt to your working directory.

##Read the file "household_power_consumption.txt" and create the appropriate
##data subset "hpcsub":
hpc <- read.table("./household_power_consumption.txt", header = TRUE, 
                  sep = ";", stringsAsFactors = FALSE, dec = ".")
hpcsub <- hpc[hpc$Date %in% c("1/2/2007", "2/2/2007"), ]

##Convert globalActivePower column to numeric format:
globalActivePower <- as.numeric(hpcsub$Global_active_power)

##Open plot device and create Plot 1 in file plot1.png:
png("plot1.png", width = 480, height = 480)
hist(globalActivePower, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", 
     col = "red")

##Close plot device:
dev.off()
