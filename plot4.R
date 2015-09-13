plot4  <-function() {
  options(warn=-1)
  suppressMessages(library(chron))
  suppressMessages(library(lubridate))
  
  options(warn=0)
  
  dt <- read.csv("household_power_consumption.txt",
                 header = TRUE, sep = ";",na.strings=c("?"))
  dt["Date"] <- as.Date(dt$Date,format="%d/%m/%Y")
  dt <- dt[dt$Date >= "2007-02-01" & dt$Date <= "2007-02-02", ]
  dt["Time"]<- times(dt$Time)
  par(mfcol =c(2,2))
   
  plot(wday(dt$Date)+dt$Time,
      as.numeric(dt$Global_active_power),
      type='l',ylab="Global Active Power(kilowatts)",
      xlab = "",xaxt = "n")
  axis(1, at=5:7, labels=c("Thur","Fri","Sat"))

  plot(wday(dt$Date)+dt$Time,
       as.numeric(dt$Sub_metering_1),
       type='l',ylab="Energy sub metering",
       xlab = "",xaxt = "n")
  lines(wday(dt$Date)+dt$Time,as.numeric(dt$Sub_metering_2),col="red")
  lines(wday(dt$Date)+dt$Time,as.numeric(dt$Sub_metering_3),col="blue")
  axis(1, at=5:7, labels=c("Thur","Fri","Sat"))
  legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3") , 
         lty=1, col=c('Black', 'red', 'blue'),cex=0.4, )
  
  plot(wday(dt$Date)+dt$Time,
       as.numeric(dt$Voltage),
       type='l',ylab="Voltage", xlab="datetime",
       xaxt = "n")
  axis(1, at=5:7, labels=c("Thur","Fri","Sat"))
  
  plot(wday(dt$Date)+dt$Time,
       as.numeric(dt$Global_reactive_power),
       type='l',ylab="Global_reactive_power" ,
       xlab="datetime",
       xaxt = "n")
  axis(1, at=5:7, labels=c("Thur","Fri","Sat"))
  
  dev.copy(png,filename="ExData_Plotting1\\plot4.png")
  dev.off ()
}