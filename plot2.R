plot2  <-function() {
  options(warn=-1)
  suppressMessages(library(chron))
  suppressMessages(library(lubridate))
  
  options(warn=0)
  
  dt <- read.csv("household_power_consumption.txt",
                 header = TRUE, sep = ";",na.strings=c("?"))
  dt["Date"] <- as.Date(dt$Date,format="%d/%m/%Y")
  dt <- dt[dt$Date >= "2007-02-01" & dt$Date <= "2007-02-02", ]
  dt["Time"]<- times(dt$Time)

  plot(wday(dt$Date)+dt$Time,
       as.numeric(dt$Global_active_power),
       type='l',ylab="Global Active Power(kilowatts)",
       xlab = "",xaxt = "n")
  axis(1, at=5:7, labels=c("Thur","Fri","Sat"))
  dev.copy(png,filename="ExData_Plotting1\\plot2.png");
  dev.off ();
}