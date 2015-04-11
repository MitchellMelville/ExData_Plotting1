#gettin and cleaning the data
setwd("C:/Users/C16Mitchell.Melville/Desktop/M Days/Math 378/ExData_Plotting1/exdata-data-household_power_consumption")
importdata=read.csv("household_power_consumption.txt",sep=";",na.strings="?")
test=importdata
importdata$Date=as.Date(importdata$Date,"%d/%m/%Y")
dataedit1=importdata[importdata$Date<"2007-02-03",]
data=dataedit1[dataedit1$Date>"2007-01-31",]
time=paste(as.Date(data$Date),data$Time)
data$DateTime<- as.POSIXct(time)


#Plot 2

plot( data$Global_active_power~data$DateTime, type= "l",ylab="Global Active Power (Kilowatts)")#;axis(1,at=NULL,labels=c("Thursday", "Friday", "Saturday"))
dev.copy(png, file="plot2.png", height=480,width=480)
dev.off()
