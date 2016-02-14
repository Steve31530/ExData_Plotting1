# Plot 4
# Load data
source("loaddata.R")

# 2 x 2 graphs
par(mfrow=c(2,2))

# 1,1 = Top left
plot(housedata$Time, housedata$Global_active_power, 
     type="l",
     xlab="", ylab="Global Active Power", 
     cex.lab=0.7, cex.axis=0.8,)

# 1, 2 = topright
plot(housedata$Time, housedata$Voltage, 
     type="l",
     xlab="", ylab="Voltage", 
     cex.lab=0.7, cex.axis=0.8,)

# 2, 1 = bottomleft
plot(housedata$Time, housedata$Sub_metering_1, 
     type="l", ylab="Energy sub metering", xlab="", cex.lab=0.7, cex.axis=0.8)
lines(housedata$Time, housedata$Sub_metering_2, col="red")
lines(housedata$Time, housedata$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1), col=c("black","red", "blue"), cex=0.7, bty="n")

# 2, 2 = bottomright
plot(housedata$Time, housedata$Global_reactive_power, 
     type="l",lwd=0.5,
     xlab="datetime", ylab="Global_reactive_power", 
     cex.lab=0.7, cex.axis=0.8)

# save the output to plot4.png
dev.copy(png,'../output/plot4.png',  width = 480, height = 480)
dev.off()