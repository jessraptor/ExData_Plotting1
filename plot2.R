##Plot 2 
electric_consumption<-read.csv("household_power_consumption.txt", header=TRUE, sep = ";",na.strings="?",
check.names = F,stringsAsFactors = F,comment.char = "",quote='\"')

ec_subset<-subset(electric_consumption,electric_consumption$Date=="1/2/2007" | electric_consumption$Date=="2/2/2007")
##Getting data and pulling out applicable dates

ec_subset$Date<-as.Date(ec_subset$Date,format="%d/%m/%Y")
datetime<-paste(as.Date(ec_subset$Date),ec_subset$Time)
ec_subset$Datetime<-as.POSIXct(datetime)
##New Datetime format for date/time

with(ec_subset, {
        plot(Datetime,Global_active_power,type="line",xlab="",ylab="Global Active Power (kilowatts)")
})
##Plotting second plot for day vs power

##Saving PNG
dev.copy(png,file="plot2.png",height=480,width=480)
dev.off()