#reads data
data <- read.csv("D:/Work/household_power_consumption.txt", header=T, sep=';', na.strings="?", quote='\"')
#formats date
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
#subsets data
data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
#creates datetime from dates and time
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
#spaces out plots
par(mfrow=c(2,2))
#first plot
with(data, plot(Global_active_power~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
#second plot
with(data, plot(Voltage~Datetime, type="l", ylab="Voltage", xlab="datetime"))
#thiord plot and legend
with(data, plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub metering", xlab=""))
with(data, lines(Sub_metering_2~Datetime,col='Red'))
with(data, lines(Sub_metering_3~Datetime,col='Blue'))
legend("topright", col=c("black", "red", "blue"), lty=1, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = .4, text.width = strwidth("Sub_metering_1"))
#fourth plot
with(data, plot(Global_reactive_power~Datetime, type="l", ylab="Global_reactive_power", xlab="datetime"))
#saves file
dev.copy(png, file="plot4.png", height=480, width=480)
#closes file
dev.off()