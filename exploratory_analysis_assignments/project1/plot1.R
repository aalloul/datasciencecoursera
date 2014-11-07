initial<-read.table("household_power_consumption.txt",sep=";",skip=0,nrows=100,na.strings = "?",header=TRUE)
mycolnames<-colnames(initial)
classes<-sapply(initial,class)
power<-read.table("household_power_consumption.txt",sep=";",skip=66637,nrows=2879,na.strings = "?",colClasses=classes,header=FALSE,col.names=mycolnames)
power$Date<-strptime(power$Date,"%d/%m/%Y")
power$Date<-as.Date(power$Date)
x<-paste(power$Date,power$Time)
power$mydates<-strptime(x,"%Y-%m-%d %T")

#plot 1
png(filename="plot1.png",width=480,height=480)
with(power,hist(Global_active_power,xlab="Global active power",main="Global active power",col="red"))
dev.off()