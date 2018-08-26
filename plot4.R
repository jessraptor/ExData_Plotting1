##Plot 4
electric_consumption<-read.csv("household_power_consumption.txt", header=TRUE, sep = ";",na.strings="?",
     check.names = F,stringsAsFactors = F,comment.char = "",quote='\"')

ec_subset<-subset(electric_consumption,electric_consumption$Date=="1/2/2007" | electric_consumption$Date=="2/2/2007")
##Getting data and pulling out applicable dates

ec_subset$Date<-as.Date(ec_subset$Date,format="%d/%m/%Y")
datetime<-paste(as.Date(ec_subset$Date),ec_subset$Time)
ec_subset$Datetime<-as.POSIXct(datetime)
##New Datetime format for date/time

par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))
with(ec_subset,{
        plot(Datetime,Global_active_power,type="line",xlab="",ylab="Global Active Power (kilowatts)")
        plot(Datetime,Voltage,type="line",xlab="",ylab="Voltage")
        plot(Datetime,Sub_metering_1,type="line",ylab="Energy Sub Metering",xlab="")
                lines(Datetime,Sub_metering_2,col='Red')
                lines(Datetime,Sub_metering_3,col='Blue')
                legend("topright",col=c("black","red","blue"),lty=1,lwd = 3,
                       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        plot(Datetime,Global_reactive_power,type="line",ylab="Global Reactive Power (kilowatts)",xlab = "")
})

##Saving PNG
dev.copy(png,file="plot4.png",height=480,width=480)
dev.off()
















