## Read the 2879 rows from the dataset starting from the row with the first date,
##because i do not want to read the entire dataset, 
##the dataset most be in the same project directory 


dataset<-read.table("household_power_consumption.txt", sep = ";",nrows=2879,  
                    skip=grep("1/2/2007", readLines("household_power_consumption.txt")), 
                    col.names = colnames(read.table("household_power_consumption.txt", nrow = 1, 
                                                    sep = ";", header = TRUE)))


##construct the device first to save the plot.

png("plot3.png", width = 480, height = 480)

## plot the data

plot(dataset$datatime ,dataset$Sub_metering_1 , type="l", ylab = "Energy sub metering", xlab="", ylim = c(0, max(as.numeric(dataset$Sub_metering_1), as.numeric(dataset$Sub_metering_2), as.numeric(dataset$Sub_metering_3))) )
lines(dataset$datatime, dataset$Sub_metering_2, type = "l", col = "red")
lines(dataset$datatime, dataset$Sub_metering_3, type = "l", col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1.5, col=c("black", "red", "blue"))

dev.off()