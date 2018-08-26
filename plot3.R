##Plot 3
electric_consumption<-read.csv("household_power_consumption.txt", header=TRUE, sep = ";",na.strings="?",
                               check.names = F,stringsAsFactors = F,comment.char = "",quote='\"')

ec_subset<-subset(electric_consumption,electric_consumption$Date=="1/2/2007" | electric_consumption$Date=="2/2/2007")
##Getting data and pulling out applicable dates

ec_subset$Date<-as.Date(ec_subset$Date,format="%d/%m/%Y")
datetime<-paste(as.Date(ec_subset$Date),ec_subset$Time)
ec_subset$Datetime<-as.POSIXct(datetime)
##New Datetime format for date/time

with(ec_subset, {
        plot(Datetime,Sub_metering_1,type="line",xlab="",ylab="Energy Sub Metering")
        lines(Datetime,Sub_metering_2,col='Red')
        lines(Datetime,Sub_metering_3,col='Blue')
})

##Plotting same plot with 3 additional "sub" values

legend("topright",col=c("black","red","blue"),lty=1,lwd = 3,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

##Saving PNG
dev.copy(png,file="plot3.png",height=480,width=480)
dev.off()