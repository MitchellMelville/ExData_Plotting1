#gettin and cleaning the data
setwd("C:/Users/C16Mitchell.Melville/Desktop/M Days/Math 378/ExData_Plotting1/exdata-data-household_power_consumption")
importdata=read.csv("household_power_consumption.txt",sep=";",na.strings="?")
test=importdata
importdata$Date=as.Date(importdata$Date,"%d/%m/%Y")
dataedit1=importdata[importdata$Date<"2007-02-03",]
data=dataedit1[dataedit1$Date>"2007-01-31",]
time=paste(as.Date(data$Date),data$Time)
data$DateTime<- as.POSIXct(time)


#Plot 1

hist(data$Global_active_power,xlab="Global Active Power (Kilowatts)", main="Global Active Power", col="red")
dev.copy(png, file="plot1.png", height=480,width=480)
dev.off()
