
#  Loading data, converting Date to Date class and subsetting
elconsum <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE )
elconsum$Date <- as.Date(elconsum$Date, format = "%d/%m/%Y")
elconsum_sub <- subset(elconsum, (elconsum$Date == "2007-02-01" | elconsum$Date == "2007-02-02"))

# Concatenate date and time
elconsum_sub$DateTime <- paste(elconsum_sub$Date, elconsum_sub$Time, sep = " ", collapse = NULL) 
elconsum_sub$DateTime <- strptime(elconsum_sub$DateTime, format= "%Y-%m-%d %H:%M:%S")

# setting time location to United states, so the weekdays in the graph are in English
Sys.setlocale("LC_TIME","English_United States")

#plotting to png device
png("plot3.png", width = 480, height = 480)
with(elconsum_sub, plot(DateTime, Sub_metering_1, type="l", col="black", xlab = "", ylab = "Energy sub metering"))
with(elconsum_sub, lines(DateTime, Sub_metering_2, col="red"))
with(elconsum_sub, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright", lty=1, col = c("black", "blue", "red"), legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"))
dev.off()

