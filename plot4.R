# This file is used to create plot4.png from data in 
# the working directory.  It's a simple exercise designed
# to prove basic understanding of plotting and devices in R.
# The intent of the implementation is that the user will call
# plot4_main() and nothing else.
# I used the lubridate package instead of as.Date() and strptime().


# Call this function directly to produce plot4.png, which
# reproduces the 2x2 grid of line graphs named "Plot 4" in the README.
plot4_main <- function() {
    #Retrieve data for required dates
    data<-getRelevantData()
    
    #Make a datetime column, then drop the redundant Date and Time.
    data<-joinDateAndTime(data)
    
    #Write plot to png (480x480 is the default size)
    png(filename="plot4.png")
    makePlot4(data)
    dev.off()
}

# Creates the 2x2 grid and then calls the 4 plots in succession.
# Note the use of 'mfcol' rather than 'mfrow'.
makePlot4 <- function(data) {
    op<-par(mfcol=c(2,2)) #Create grid and store old par values
    
    #Call plots
    makeTopLeftPlot(data)
    makeBottomLeftPlot(data)
    makeTopRightPlot(data)
    makeBottomRightPlot(data)
    
    par(op) #Reset par to prior values
}


# The same as makePlot2() from plot2.R except that the
# y label no longer include the units "(kilowatts)".
makeTopLeftPlot <- function(data) {
    plot(data$datetime, data$Global_active_power,
         xlab="", ylab="Global Active Power",
         type="l")
}


# The same as makePlot3() from plot3.R except 
# that the legend now has no border box.
makeBottomLeftPlot <- function(data) {
    #Add data incrementally to a new plot
    plot(data$datetime, data$Sub_metering_1,
         xlab="", ylab="Energy sub metering",
         type="l")
    lines(data$datetime, data$Sub_metering_2, col="red")
    lines(data$datetime, data$Sub_metering_3, col="blue")
    
    #Nothing special for the legend
    legend("topright",
           legend=c("Sub_metering_1",
                    "Sub_metering_2",
                    "Sub_metering_3"),
           col=c("black", "red", "blue"),
           lwd=1,
           bty="n")
}


# Short and sweet.
makeTopRightPlot <- function(data) {
    with(data, plot(datetime, Voltage, type="l"))
}

# Also short and sweet.
makeBottomRightPlot <- function(data) {
    with(data, plot(datetime, Global_reactive_power, type="l"))
}


# This function reads data from the household power consumption
# file from the UCI Machine Learning repository, and it
# returns a data.frame with only the rows for Feb 1-2, 2007.
# It assumes that the data is already downloaded
# and unzipped into a folder named "power" that is itself
# within the working directory.
getRelevantData <- function() {
    data<-read.table("power/household_power_consumption.txt",
                     header=TRUE, sep=";", stringsAsFactors=FALSE,
                     na.strings="?",
                     colClasses=c("character", "character", "numeric",
                                  "numeric", "numeric", "numeric",
                                  "numeric", "numeric", "numeric")
    )
    data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
}

# Takes a data.frame that has "Date" and "Time" columns of characters.
# Replaces them with a single "datetime" column of POSIXct objects.
# Assumes the format used in household_power_consumption.txt.
joinDateAndTime <- function(data) {
    require(lubridate)
    
    data[,1]<-paste(data$Date, data$Time)
    names(data)[1]<-"datetime"
    data$Time<-NULL
    
    data$datetime<-dmy_hms(data$datetime)
    data
}