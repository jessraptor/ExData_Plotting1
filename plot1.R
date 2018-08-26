electric_consumption<-read.table("household_power_consumption.txt", header=TRUE, sep = ";",na.strings="?")
ec_subset<-subset(electric_consumption,electric_consumption$Date=="1/2/2007" | electric_consumption$Date=="2/2/2007")
##Getting data and pulling out applicable dates


hist(ec_subset$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency",col="red")
##Plotting and labeling the histogram

##Saving PNG
dev.copy(png,file="plot1.png",height=480,width=480)
dev.off()