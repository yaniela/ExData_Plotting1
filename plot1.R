## Read the 2879 rows from the dataset starting from the row with the first date,
##because i do not want to read the entire dataset, 
##the dataset most be in the same project directory 


dataset<-read.table("household_power_consumption.txt", sep = ";",nrows=2879,  
skip=grep("1/2/2007", readLines("household_power_consumption.txt")), 
col.names = colnames(read.table("household_power_consumption.txt", nrow = 1, 
                                sep = ";", header = TRUE)))

## to save the plot to a PNG file with a width of 480 pixels and a height of 480 pixels, is necesary
## to construct the device first.

png("plot1.png", width = 480, height = 480)

hist(dataset$Global_active_power, main ="Global Active Power", col="red", 
     xlab = "Global active power(kilowatts)" )

dev.off()
