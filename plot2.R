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

#plot2
png("./data/plot2.png",width=480,height=480)
subsetData$Date <- as.Date(subsetData$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(subsetData$Date), subsetData$Time)
subsetData$Datetime <- as.POSIXct(datetime)

yval<-as.numeric(subsetData$Global_active_power)

plot(subsetData$Datetime,yval,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
