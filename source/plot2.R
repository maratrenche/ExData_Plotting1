library(data.table)
housepc<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
good<-complete.cases(housepc)
hpowc<-housepc[good,]
hpconsump<-subset(hpowc, Date=="1/2/2007" | Date=="2/2/2007")
hpc<-hpconsump
hpc$Date_Time<-paste(hpc$Date, hpc$Time, sep=" ")
hpc$Date_Time<-strptime(hpc$Date_Time, format="%d/%m/%Y %H:%M:%S")
plot(hpc$Date_Time, hpc$Global_active_power, type="l", lty=1, xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width= 480, height= 480)
dev.off()

