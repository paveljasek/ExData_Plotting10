# Plotting Assignment 1 for Exploratory Data Analysis
# Johns Hopkins University, Coursera

# paveljasek@gmail.com

source("loaddata.R")

# Plot 2 ---------------

with(data.selected, plot(Time, Global_active_power, 
                         type="l",
                         xlab="",
                         ylab="Global Active Power (in kilowatts)",
                         cex.lab=0.7, cex.axis=0.8))

# save the output to plot2.png
dev.copy(png,'plot2.png',  width = 480, height = 480)
dev.off()


# Restore locale settings
Sys.setlocale( category = "LC_TIME", locale = locale_original )