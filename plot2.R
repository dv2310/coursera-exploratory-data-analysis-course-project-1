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

#plot 2 
Sys.setlocale("LC_TIME","English")
plot(specific_time,data_wanted$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power(Kilowatts)")

#graphic device
dev.copy(png, "plot2.png", height=480, width=480)
dev.off()
