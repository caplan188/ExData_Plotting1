#reads data
data <- read.table("D:/Work/household_power_consumption.txt", header=T, sep=';', na.strings="?", quote='\"')
#formats date
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
#subsets dates
data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
#creates datetime from dates and time
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
#creates graph
with(data, plot(Global_active_power~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
#saves file
dev.copy(png, file="plot2.png", height=480, width=480)
#closes file
dev.off()