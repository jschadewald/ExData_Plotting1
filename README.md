Hi Reviewer!

This is a modification to the forked `README.md` to include this pre-introduction prepended to the original.  This section contains some notes about interpretations, assumptions, and reasoning about aspects of the assignment that were not stated explictly in the assignment.

My interpretation of this assignment is that we're supposed to show that we understand the base plotting functions well enough to perform the following common tasks:
* Show multiple variables in the same plot
* Use different colors
* Create lines graphs and histograms
* Specify text in titles and axes
* Create legends
* Print multiple plots to a single device

From the examples and instructions given, it appears that this assignment does not include:
* Setting fonts and sizes of text
* Making changes to margins (inner or outer)

The above two assumptions are also based partially on the fact that, on my Windows 7 64-bit machine, the default settings yield results that are extremely close to the reference plots.  Aside from that, it can be reasoned that font-matching is not generally a necessary or important skill for a Data Scientist to master (except in the case that the object of study is text itself such as seen here: https://medium.com/@adambanksdotcom/legos-letter-to-parents-and-how-not-to-tell-a-fake-when-you-dont-see-one-2ca9dfe586d7).

Also worth noting is that my first attempt involved creating the plots in the default RStudioGD device and then using dev.copy() to copy the plot on the screen to png.  This resulted in lower-quality png plots, including label/axis text that was too large and a legend that covered part of the graph.  By switching to calling png() directly, those issues disappeared.

##About the Code
To execute the code that produces the required png:

1. Download <https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip>
2. Unzip it so that the "power" folder is in your working directory.
3. Source the appropriate R file.
4. Run the corresponding top-level function: `plot1_main()`, `plot2_main()`, `plot3_main()`, or `plot4_main()`.
5. Verify that `plot<x>.png` was created according to requirements.


All four .R files follow the same basic structure:
* A top-level `plot<x>_main()` function that coordinates execution of other functions
* A `makePlot<x>()` function that draws the plot in a device-independent manner
* A `getRelevantData()` function to read data from the txt file and return only the rows for Feb 1-2, 2007.
* A `joinDateAndTime()` function that combines the "Date" and "Time" columns into a "datetime" column and converts the data to POSIXct by using `dmy_hms()` from the `lubridate` package.
* `plot4.R` has an additional four functions, each of which is responsible to draw one of the four sub-plots in `plot4.png`.


As an aside, I would ordinarily prefer to have common functions like `getRelevantData()` and `joinDateAndTime()` in a separate, common R file that would be sourced by the rest.  However, this assignment was very explicit in terms of instructions and grading criteria about the number and contents of the R files.  In a professional setting, I would take additional measures toward readability, scalability, and maintainability.


```
Note: Everything below is part of the original `README.md` from 
the forked repository, and I have left it unmodified.
```
## Introduction

This assignment uses data from
the <a href="http://archive.ics.uci.edu/ml/">UC Irvine Machine
Learning Repository</a>, a popular repository for machine learning
datasets. In particular, we will be using the "Individual household
electric power consumption Data Set" which I have made available on
the course web site:


* <b>Dataset</b>: <a href="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip">Electric power consumption</a> [20Mb]

* <b>Description</b>: Measurements of electric power consumption in
one household with a one-minute sampling rate over a period of almost
4 years. Different electrical quantities and some sub-metering values
are available.


The following descriptions of the 9 variables in the dataset are taken
from
the <a href="https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption">UCI
web site</a>:

<ol>
<li><b>Date</b>: Date in format dd/mm/yyyy </li>
<li><b>Time</b>: time in format hh:mm:ss </li>
<li><b>Global_active_power</b>: household global minute-averaged active power (in kilowatt) </li>
<li><b>Global_reactive_power</b>: household global minute-averaged reactive power (in kilowatt) </li>
<li><b>Voltage</b>: minute-averaged voltage (in volt) </li>
<li><b>Global_intensity</b>: household global minute-averaged current intensity (in ampere) </li>
<li><b>Sub_metering_1</b>: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered). </li>
<li><b>Sub_metering_2</b>: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light. </li>
<li><b>Sub_metering_3</b>: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.</li>
</ol>

## Loading the data





When loading the dataset into R, please consider the following:

* The dataset has 2,075,259 rows and 9 columns. First
calculate a rough estimate of how much memory the dataset will require
in memory before reading into R. Make sure your computer has enough
memory (most modern computers should be fine).

* We will only be using data from the dates 2007-02-01 and
2007-02-02. One alternative is to read the data from just those dates
rather than reading in the entire dataset and subsetting to those
dates.

* You may find it useful to convert the Date and Time variables to
Date/Time classes in R using the `strptime()` and `as.Date()`
functions.

* Note that in this dataset missing values are coded as `?`.


## Making Plots

Our overall goal here is simply to examine how household energy usage
varies over a 2-day period in February, 2007. Your task is to
reconstruct the following plots below, all of which were constructed
using the base plotting system.

First you will need to fork and clone the following GitHub repository:
[https://github.com/rdpeng/ExData_Plotting1](https://github.com/rdpeng/ExData_Plotting1)


For each plot you should

* Construct the plot and save it to a PNG file with a width of 480
pixels and a height of 480 pixels.

* Name each of the plot files as `plot1.png`, `plot2.png`, etc.

* Create a separate R code file (`plot1.R`, `plot2.R`, etc.) that
constructs the corresponding plot, i.e. code in `plot1.R` constructs
the `plot1.png` plot. Your code file **should include code for reading
the data** so that the plot can be fully reproduced. You should also
include the code that creates the PNG file.

* Add the PNG file and R code file to your git repository

When you are finished with the assignment, push your git repository to
GitHub so that the GitHub version of your repository is up to
date. There should be four PNG files and four R code files.


The four plots that you will need to construct are shown below. 


### Plot 1


![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 


### Plot 2

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3.png) 


### Plot 3

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-4.png) 


### Plot 4

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5.png) 

