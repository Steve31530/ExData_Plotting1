setwd("~/My Tasks/2016-02 Exploratory-data-analysis/R")

# Check to see if folder exists
if(!file.exists("../output")){dir.create("../output")}

housedata <- read.table("./../data/household_power_consumption.txt", sep =";",header = TRUE, na.strings = "?")

head(housedata, 10)

#Date: Date in format dd/mm/yyyy
#Time: time in format hh:mm:ss
#Global_active_power: household global minute-averaged active power (in kilowatt)
#Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
#Voltage: minute-averaged voltage (in volt)
#Global_intensity: household global minute-averaged current intensity (in ampere)
#Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
#Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
#Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.

#Downselect specific dates
housedata <- housedata[housedata$Date=="1/2/2007" | housedata$Date=="2/2/2007",]

# convert the Date to Date class
housedata$Date <- as.Date(housedata$Date, format = "%d/%m/%Y")

# convert the Time variable to Time class
housedata$Time <- strptime(paste(housedata$Date, housedata$Time), format="%Y-%m-%d %H:%M:%S")

# Convert factor to numerical
housedata$Global_active_power <- as.numeric(housedata$Global_active_power)

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