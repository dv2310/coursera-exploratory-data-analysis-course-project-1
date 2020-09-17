getwd()

#read the data fast
setwd("D:/Coursera/Specialization/Data Science Specialization/Exploratory Data Analysis/week1/exdata_data_household_power_consumption")
all_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                     nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

library(lubridate)

#character
class(all_data$Date)

#the data required
data_wanted <- subset(all_data,subset = (Date == "1/2/2007" | Date == "2/2/2007"))

data_wanted$Date <- as.Date(data_wanted$Date,format ="%d/%m/%Y")

#change the time to POSIXct
specific_time <- paste(data_wanted$Date,data_wanted$Time)
specific_time <- as.POSIXct(specific_time,tz = "GMT")
specific_time
Sys.setlocale("LC_TIME","English")

old_par <- par()
par(mfrow = c(2,2))

#subplot1
plot(specific_time,data_wanted$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power")

#subplot2
plot(specific_time,data_wanted$Voltage,xlab = "datetime",ylab = "Voltage",type = "l",col = "black")

#subplot3
with(data_wanted,{
    plot(specific_time,Sub_metering_1,type = "l",ylab = "Energy sub metering",xlab = "")
    lines(specific_time,Sub_metering_2,col = "Red")
    lines(specific_time,Sub_metering_3,col = "Blue")
    legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty = 1 ,bty = "n",lwd = 2,cex = 0.8 )
})

#subplot4
plot(specific_time,data_wanted$Global_reactive_power,xlab = "datetime",ylab = "Global_reactive_power",type = "l",col="black")

#graphic device
dev.copy(png, "plot4.png", height=480, width=480)
dev.off()
