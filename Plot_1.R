#Plot 1
# Load data
source("loaddata.R")

# Only one graph
par(mfrow=c(1,1))

hist(housedata$Global_active_power,col="red", 
     breaks=15,
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power",
     ylim=c(0,1200))

dev.copy(png,'../output/plot1.png',  width = 480, height = 480)
dev.off()