plot2 <- function() {
  #this plot is dependent on data being created in plot1. Run plot1 to get the household_power_consumption written to your working directory
  dat <- read.csv("household_power_consumption.csv", sep=",", header=TRUE)
                       
  library(datasets)
  png("plot2.png", width=480, height=480, units="px")
 
  plot(y = as.numeric(dat$"Global_active_power"), 
       #x = paste(weekdays(as.Date(dat$"Date_formatted")),dat$"Time"), 
       x = as.POSIXct(paste(as.Date(dat$"Date_formatted"),dat$"Time")), 
       main = "Global Active Power",
       ylab = "Global Active Power (kilowats)",
       xlab = "",
       type = "l")
  dev.off()
}