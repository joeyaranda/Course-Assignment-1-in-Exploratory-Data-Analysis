setwd("C:\\Course Assignment 1")

if (!file.exists(".\\data"))
  dir.create("data")

fileurl<-"https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
download.file(fileurl,destfile="data/file.zip")
unzip(zipfile="./data/file.zip",exdir="./data")

readtxt<-read.table("./data/household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)
subsetData<-subset(readtxt,Date %in% c("1/2/2007","2/2/2007"))

#plot1
png("./data/plot1.png",width=480,height=480)
gap<-as.numeric(subsetData$Global_active_power)
hist(gap,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
