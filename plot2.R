## Read the 2879 rows from the dataset starting from the row with the first date,
##because i do not want to read the entire dataset, 
##the dataset most be in the same project directory 


dataset<-read.table("household_power_consumption.txt", sep = ";",nrows=2879,  
                    skip=grep("1/2/2007", readLines("household_power_consumption.txt")), 
                    col.names = colnames(read.table("household_power_consumption.txt", nrow = 1, 
                                                    sep = ";", header = TRUE)))

##convert to Date object Date and Time columns

library(lubridate)
dataset$datatime<-paste(dataset$Date,dataset$Time)
dataset$datatime<-dmy_hms(dataset$datatime)

##construct the device first to save the plot.

png("plot2.png", width = 480, height = 480)

## plot the data
plot(dataset$datatime, dataset$Global_active_power, xlab="", ylab="Global active power(kilowatts)", type="l")

dev.off()
