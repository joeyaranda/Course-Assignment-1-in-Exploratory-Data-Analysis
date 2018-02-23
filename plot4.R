setwd("C:\\Course Assignment 1")

#create directory
if (!file.exists(".\\data"))
  dir.create("data")

#download data
fileurl<-"https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
download.file(fileurl,destfile="data/file.zip")
unzip(zipfile="./data/file.zip",exdir="./data")

#read and subset data
readtxt<-read.table("./data/household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)
subsetData<-subset(readtxt,Date %in% c("1/2/2007","2/2/2007"))

#plot4
png("./data/plot4.png",width=480,height=480)

par(mfcol=c(2,2))

subsetData$Date <- as.Date(subsetData$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(subsetData$Date), subsetData$Time)
subsetData$Datetime <- as.POSIXct(datetime)

yval<-as.numeric(subsetData$Global_active_power)
submeter1<-as.numeric(subsetData$Sub_metering_1)
submeter2<-as.numeric(subsetData$Sub_metering_2)
submeter3<-as.numeric(subsetData$Sub_metering_3)
volt<-as.numeric(subsetData$Voltage)
grp<-as.numeric(subsetData$Global_reactive_power)

plot(subsetData$Datetime,yval,type="l",xlab="",ylab="Global Active Power")
plot(subsetData$Datetime,submeter1,type="l",xlab="",ylab="Energy Sub Metering")
lines(subsetData$Datetime,submeter2,type="l",col="red")
lines(subsetData$Datetime,submeter3,type="l",col="blue")
legend("topright",legend=colnames(subsetData[7:9]),lty=c(1,1,1),col=c("black","red","blue"))
plot(subsetData$Datetime,volt,type="l",xlab="datetime",ylab="Voltage")
plot(subsetData$Datetime,grp,type="l",xlab="datetime",ylab="Global Reactive Power")

dev.off()
