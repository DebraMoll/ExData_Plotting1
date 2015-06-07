plot1 <- function(filepath) {
  filename = paste(filepath,"/household_power_consumption.txt", sep="")
  
  #uses sqldf for filtering a text file when reading it in
  require(sqldf)
  dat <- read.csv.sql(filename,
                      sql = "select * from (
                      select *, 
                      substr(Date, -4) 
                      || '-' || 
                        substr('0' || replace(substr(Date, instr(Date, '/') + 1, 2), '/', ''), -2) 
                      || '-' || 
                        substr('0' || replace(substr(Date, 1, 2), '/', ''), -2) as Date_formatted
                      from file)
                      where Date_formatted between '2007-02-01' and '2007-02-02'", 
                      sep=";", header=TRUE)

  #write this to csv for use in other plots to increase speed of plotting
  write.csv(dat,"household_power_consumption.csv", row.names=FALSE)
                      
  library(datasets)
  png("plot1.png", width=480, height=480, units="px")
  hist(dat$"Global_active_power", col="red", xlab="Global Active Power (kilowats)", main="Global Active Power")
  dev.off()
}