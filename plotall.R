# Plotting Assignment 1 for Exploratory Data Analysis
# Johns Hopkins University, Coursera

# paveljasek@gmail.com


# Load the power consumption data -----------------------------------------------------------

data <- read.table("data/household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")

# The dataset has 2,075,259 rows and 9 columns
str(data)
head(data)

# We will only be using data from the dates 2007-02-01 and 2007-02-02
data.selected <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
rm(data)

# convert the Date to Date class
data.selected$Date <- as.Date(data.selected$Date, format="%d/%m/%Y")
str(data.selected)

# convert the Time variable to Time class
data.selected$Time <- strptime(paste(data.selected$Date, data.selected$Time), format="%Y-%m-%d %H:%M:%S")
str(data.selected)


# Constructing the plots --------------------------------------------------
# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels

# setting locale to en_US for proper day in a week labels
locale_original <- Sys.getlocale( category = "LC_TIME" )
Sys.setlocale("LC_TIME", "English")

# Plot 1 ---------------

with(data.selected, hist(Global_active_power, col="red", 
                         breaks=15,
                         xlab="Global Active Power (kilowatts)",
                         main="Global Active Power",
                         ylim=c(0,1200)))

dev.copy(png,'plot1.png',  width = 480, height = 480)
dev.off()

# Plot 2 ---------------

with(data.selected, plot(Time, Global_active_power, 
                         type="l",
                         xlab="",
                         ylab="Global Active Power (in kilowatts)",
                         cex.lab=0.7, cex.axis=0.8))
dev.copy(png,'plot2.png',  width = 480, height = 480)
dev.off()


# Plot 3 ---------------

plot(data.selected$Time, data.selected$Sub_metering_1, 
     type="l", ylab="Energy sub metering", cex.lab=0.7)
lines(data.selected$Time, data.selected$Sub_metering_2, col="red")
lines(data.selected$Time, data.selected$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1), col=c("black","red", "blue"), cex=0.8)
dev.copy(png,'plot3.png',  width = 480, height = 480)
dev.off()


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