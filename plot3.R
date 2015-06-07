plot3 <- function() {
  #this plot is dependent on data being created in plot1. Run plot1 to get the household_power_consumption written to your working directory
  dat <- read.csv("household_power_consumption.csv", sep=",", header=TRUE)
  
  library(datasets)
  png("plot3.png", width=480, height=480, units="px")
 
  plot(y = as.numeric(dat$"Sub_metering_1"), 
       x = as.POSIXct(paste(as.Date(dat$"Date_formatted"),dat$"Time")), 
       main = "Global Active Power",
       ylab = "Energy sub metering ",
       ylim = range(c(0,max(dat$Sub_metering_1))),
       xlab = "",
       type = "l",
       col = "black")
  axis(side = 2, at = c(0,10,20,30,40))
  par(new=TRUE)
  plot(y = as.numeric(dat$"Sub_metering_2"), 
       x = as.POSIXct(paste(as.Date(dat$"Date_formatted"),dat$"Time")), 
       ylab = "",
       ylim = range(c(0,max(dat$Sub_metering_1))),
       xlab = "",
       type = "l",
       col = "red",
       axes = FALSE)
  par(new=TRUE)
  plot(y = as.numeric(dat$"Sub_metering_3"), 
       x = as.POSIXct(paste(as.Date(dat$"Date_formatted"),dat$"Time")), 
       ylab = "",
       ylim = range(c(0,max(dat$Sub_metering_1))),
       xlab = "",
       type = "l",
       col = "blue",
       axes = FALSE)
  legend("topright",col=c("black","red","blue"),lty=1,legend=c("sub_metering1","sub_metering2","sub_metering3"))
  dev.off()
  
}