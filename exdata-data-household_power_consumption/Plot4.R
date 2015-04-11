#gettin and cleaning the data
setwd("C:/Users/C16Mitchell.Melville/Desktop/M Days/Math 378/ExData_Plotting1/exdata-data-household_power_consumption")
importdata=read.csv("household_power_consumption.txt",sep=";",na.strings="?")
test=importdata
importdata$Date=as.Date(importdata$Date,"%d/%m/%Y")
dataedit1=importdata[importdata$Date<"2007-02-03",]
data=dataedit1[dataedit1$Date>"2007-01-31",]
time=paste(as.Date(data$Date),data$Time)
data$DateTime<- as.POSIXct(time)


#plot4

par(mfrow = c(2, 2))

with(data, plotplot( data$Global_active_power~data$DateTime, type= "l",ylab="Global Active Power (Kilowatts)"))
with(data, plot(Voltage~DateTime,type="l",ylab="Voltage",xlab="datetime"))
with(data,{
  plot(Sub_metering_1~data$DateTime, type="l")
  
  plot(Sub_metering_2~data$DateTime,type="l", col="red")
  plot(Sub_metering_3~data$DateTime, type="l",col="blue")
  legend("topright", pch = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))})
with(data, plot(Global_reactive_power~DateTime, type= "l",xlab="datetime"))



dev.copy(png, file="plot4.png", height=480,width=480)
dev.off()







#help with the datetime part from 
#"https://github.com/semenoffalex/Exploratory-Data-Analysis/blob/master/plot2.R"
