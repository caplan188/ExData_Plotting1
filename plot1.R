#reads data
data <- read.table("D:/Work/household_power_consumption.txt", header=T, sep=';', na.strings="?", quote='\"')
#formats date
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
#subsets dates
data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
#creates graph
with(data, hist(Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="Red"))
#saves file
dev.copy(png, file="plot1.png", height=480, width=480)
#closes file
dev.off()
