
#  Loading data, converting Date to Date class and subsetting
elconsum <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE )
elconsum$Date <- as.Date(elconsum$Date, format = "%d/%m/%Y")
elconsum_sub <- subset(elconsum, (elconsum$Date == "2007-02-01" | elconsum$Date == "2007-02-02"))


# Concatenate date and time
elconsum_sub$DateTime <- paste(elconsum_sub$Date, elconsum_sub$Time, sep = " ", collapse = NULL) 
elconsum_sub$DateTime <- strptime(elconsum_sub$DateTime, format= "%Y-%m-%d %H:%M:%S")


# setting time location to United states, so the weekdays in the graph are in English
Sys.setlocale("LC_TIME","English_United States")

# Printing to png device
png("plot2.png", width = 480, height = 480) 
with(elconsum_sub, plot(DateTime, Global_active_power, type="l", xlab = "", ylab = "Global active power (KW)"))
dev.off()
