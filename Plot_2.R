#Plot 2
# Load data
source("loaddata.R")

# Only one graph
par(mfrow=c(1,1))

plot(housedata$Time, housedata$Global_active_power, 
     type="l",
     xlab="",
     ylab="Global Active Power (in kilowatts)",
     cex.lab=0.7, cex.axis=0.8
)

dev.copy(png,'../output/plot2.png',  width = 480, height = 480)
dev.off()