plot3  <-function() {
  options(warn=-1)
  suppressMessages(library(chron))
  suppressMessages(library(lubridate))
  
  options(warn=0)
  
  dt <- read.csv("household_power_consumption.txt",
                 header = TRUE, sep = ";",na.strings=c("?"))
  dt["Date"] <- as.Date(dt$Date,format="%d/%m/%Y")
  dt <- dt[dt$Date >= "2007-02-01" & dt$Date <= "2007-02-02", ]
  dt["Time"]<- times(dt$Time)
  dt<-complete.cases(dt)
  plot(wday(dt$Date)+dt$Time,
       as.numeric(dt$Sub_metering_1),
       type='l',ylab="Energy sub metering",
       xlab = "",xaxt = "n")
  lines(wday(dt$Date)+dt$Time,as.numeric(dt$Sub_metering_2),col="red")
  lines(wday(dt$Date)+dt$Time,as.numeric(dt$Sub_metering_3),col="blue")
  axis(1, at=5:7, labels=c("Thur","Fri","Sat"))
  legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3") , 
  lty=1, col=c('Black', 'red', 'blue'), cex=.75)
  dev.copy(png,filename="ExData_Plotting1\\plot3.png");
  dev.off ();
}