plot1  <-function() {
  options(warn=-1)
  suppressMessages(library(chron))
  options(warn=0)
  
  dt <- read.csv("household_power_consumption.txt",header = TRUE, sep = ";")
  dt["Date"] <- as.Date(dt$Date,format="%d/%m/%Y")
  dt <- dt[dt$Date >= "2007-02-01" & dt$Date <= "2007-02-02", ]
  dt["Time"]<- times(dt$Time)
  hist(as.numeric(dt$Global_active_power)/1000,
       xlab="Global Active Power (kilowatts)", 
       main="Global Active Power", col="red",
       )
  dev.copy(png,filename="ExData_Plotting1\\plot1.png");
  dev.off ();
}