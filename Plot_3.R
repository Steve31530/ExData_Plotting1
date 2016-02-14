#Plot 3
# Load data
source("loaddata.R")

# Only one graph
par(mfrow=c(1,1))

plot(housedata$Time, housedata$Sub_metering_1, 
     type="l", ylab="Energy sub metering", cex.lab=0.7)

# add other submeterings as separate lines
lines(housedata$Time, housedata$Sub_metering_2, col="red")
lines(housedata$Time, housedata$Sub_metering_3, col="blue")

# annotate the graph with a legend
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1), col=c("black","red", "blue"), cex=0.8)

# save the output to plot3.png
dev.copy(png,'../output/plot3.png',  width = 480, height = 480)
dev.off()