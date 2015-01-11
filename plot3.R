#reads data
data <- read.csv("D:/Work/household_power_consumption.txt", header=T, sep=';', na.strings="?", quote='\"')
#formats date
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
#subsets data
data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
#creates datetime from dates and time
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
#creates plot 3 from 3 different calls
with(data, plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub metering", xlab=""))
with(data, lines(Sub_metering_2~Datetime,col='Red'))
with(data, lines(Sub_metering_3~Datetime,col='Blue'))
#creates legend
legend("topright", col=c("black", "red", "blue"), lty=1, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = .5, text.width = strwidth("Sub_metering_1"))
#saves file
dev.copy(png, file="plot3.png", height=480, width=480)
#closes file
dev.off()
