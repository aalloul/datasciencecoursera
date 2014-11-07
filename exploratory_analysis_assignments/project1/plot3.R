initial<-read.table("household_power_consumption.txt",sep=";",skip=0,nrows=100,na.strings = "?",header=TRUE)
mycolnames<-colnames(initial)
classes<-sapply(initial,class)
power<-read.table("household_power_consumption.txt",sep=";",skip=66637,nrows=2879,na.strings = "?",colClasses=classes,header=FALSE,col.names=mycolnames)
power$Date<-strptime(power$Date,"%d/%m/%Y")
power$Date<-as.Date(power$Date)
x<-paste(power$Date,power$Time)
power$mydates<-strptime(x,"%Y-%m-%d %T")

#plot 3
png(filename="plot3.png",width=480,height=480)
with(power,{plot(mydates,Sub_metering_1,col="black",type="l",ylab="",xlab="",main="")})
with(power,{lines(mydates,Sub_metering_2,ylab="",xlab="",main="",col="red",type="l")})
with(power,{lines(mydates,Sub_metering_3,ylab="",xlab="",main="",col="blue",type="l")})
title(ylab="Global active power (kilowatts)",xlab="",main="Global active power")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
dev.off()

