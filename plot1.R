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


hist(data_wanted$Global_active_power,col = "Red",xlab = "Global Active Power(Kilowatts)",
     main = "Global Active Power",ylim = range(0,1200))

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
