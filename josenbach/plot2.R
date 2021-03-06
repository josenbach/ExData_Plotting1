mydata <- read.table("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", nrows=71000, stringsAsFactors=FALSE)
str(mydata)
mydata <- within(mydata, DateTime <- as.POSIXlt(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))
mydata <- subset(mydata, DateTime >= as.POSIXlt("2007-02-01") & DateTime < as.POSIXlt("2007-02-03"))
plot(mydata$DateTime, mydata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, "plot2.png")
dev.off()