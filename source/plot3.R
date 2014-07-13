library(data.table)
housepc<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
good<-complete.cases(housepc)
hpowc<-housepc[good,]
hpconsump<-subset(hpowc, Date=="1/2/2007" | Date=="2/2/2007")
hpc<-hpconsump
hpc$Date_Time<-paste(hpc$Date, hpc$Time, sep=" ")
hpc$Date_Time<-strptime(hpc$Date_Time, format="%d/%m/%Y %H:%M:%S")
plot(hpc$Date_Time, hpc$Sub_metering_1, type="n", lty=1, xlab="", ylab="Energy sub metering")
lines(hpc$Date_Time, hpc$Sub_metering_1, lty=1, xlab="", ylab="", col="black")
lines(hpc$Date_Time, hpc$Sub_metering_2, lty=1, xlab="", ylab="", col="red")
lines(hpc$Date_Time, hpc$Sub_metering_3, lty=1, xlab="", ylab="", col="blue")
legend("top", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1",
          "Sub_metering_2", "Sub_metering_3"), xjust=1, bty="n")
dev.copy(png, file="plot3.png", width= 480, height= 480)
dev.off()
