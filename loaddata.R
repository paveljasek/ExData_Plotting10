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
