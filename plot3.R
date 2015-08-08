# Plotting Assignment 1 for Exploratory Data Analysis
# Johns Hopkins University, Coursera

# paveljasek@gmail.com

source("loaddata.R")


# Plot 3 ---------------

plot(data.selected$Time, data.selected$Sub_metering_1, 
     type="l", ylab="Energy sub metering", cex.lab=0.7)

# add other submeterings as separate lines
lines(data.selected$Time, data.selected$Sub_metering_2, col="red")
lines(data.selected$Time, data.selected$Sub_metering_3, col="blue")

# annotate the graph with a legend
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1), col=c("black","red", "blue"), cex=0.8)

# save the output to plot3.png
dev.copy(png,'plot3.png',  width = 480, height = 480)
dev.off()


# Restore locale settings
Sys.setlocale( category = "LC_TIME", locale = locale_original )