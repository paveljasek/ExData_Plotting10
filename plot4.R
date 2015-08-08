# Plotting Assignment 1 for Exploratory Data Analysis
# Johns Hopkins University, Coursera

# paveljasek@gmail.com

source("loaddata.R")

# Plot 4 ---------------

par(mfrow=c(2,2))
# topleft
with(data.selected, plot(Time, Global_active_power, 
                         type="l",
                         xlab="", ylab="Global Active Power", 
                         cex.lab=0.7, cex.axis=0.8,
))

# topright
with(data.selected, plot(Time, Voltage, 
                         type="l",
                         xlab="", ylab="Voltage", 
                         cex.lab=0.7, cex.axis=0.8,
))

# bottomleft
plot(data.selected$Time, data.selected$Sub_metering_1, 
     type="l", ylab="Energy sub metering", xlab="", cex.lab=0.7, cex.axis=0.8)
lines(data.selected$Time, data.selected$Sub_metering_2, col="red")
lines(data.selected$Time, data.selected$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1), col=c("black","red", "blue"), cex=0.7, bty="n")

# bottomright
with(data.selected, plot(Time, data.selected$Global_reactive_power, 
                         type="l",lwd=0.5,
                         xlab="datetime", ylab="Global_reactive_power", 
                         cex.lab=0.7, cex.axis=0.8))

# PNG
dev.copy(png,'plot4.png',  width = 480, height = 480)
dev.off()


# Restore locale settings
Sys.setlocale( category = "LC_TIME", locale = locale_original )