# This file is used to create plot3.png from data in 
# the working directory.  It's a simple exercise designed
# to prove basic understanding of plotting and devices in R.
# The intent of the implementation is that the user will call
# plot3_main() and nothing else.
# I used the lubridate package instead of as.Date() and strptime().


# Call this function directly to produce plot3.png, which
# reproduces the line graph named "Plot 3" in the README.
plot3_main <- function() {
    #Retrieve data for required dates
    data<-getRelevantData()
    
    #Make a datetime column, then drop the redundant Date and Time.
    data<-joinDateAndTime(data)
    
    #Write plot to png (480x480 is the default size)
    png(filename="plot3.png")
    makePlot3(data)
    dev.off()
}


# Creates the plot and outputs it to the current device.
makePlot3 <- function(data) {
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
           lwd=1)
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