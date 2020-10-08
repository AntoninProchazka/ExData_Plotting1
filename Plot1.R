
#  Loading data, converting Date to Date class and subsetting
elconsum <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE )
elconsum$Date <- as.Date(elconsum$Date, format = "%d/%m/%Y")
elconsum_sub <- subset(elconsum, (elconsum$Date == "2007-02-01" | elconsum$Date == "2007-02-02"))

# Plotting plot1 to PNG device
png("plot1.png", width = 480, height = 480)  
with(elconsum_sub, hist(Global_active_power, col="red"))
dev.off()

