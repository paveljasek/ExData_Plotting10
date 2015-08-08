# Plotting Assignment 1 for Exploratory Data Analysis
# Johns Hopkins University, Coursera

# paveljasek@gmail.com

source("loaddata.R")

# Plot 1 ---------------

with(data.selected, hist(Global_active_power, col="red", 
                         breaks=15,
                         xlab="Global Active Power (kilowatts)",
                         main="Global Active Power",
                         ylim=c(0,1200)))

dev.copy(png,'plot1.png',  width = 480, height = 480)
dev.off()


# Restore locale settings
Sys.setlocale( category = "LC_TIME", locale = locale_original )