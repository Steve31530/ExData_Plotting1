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