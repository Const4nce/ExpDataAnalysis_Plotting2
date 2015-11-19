#set working directory
directory <- "C:\\Users\\Constantina\\Google Drive\\coursera\\Exploratory Data Analysis\\Project_2\\"
setwd(directory)

#read the two files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#get sum of Emissin by year
Agg_Data <- aggregate(Emissions ~ year,NEI, sum, na.rm = TRUE)

#Open the graphic device to plot the data
png(filename='plot1.png', width=480, height=480, units='px')

#Plot aggregated data of total emissions for years of interest
barplot((Agg_Data$Emissions)/10^6, names.arg = Agg_Data$year, xlab="Year", ylab="PM2.5 Total Emmision (10^6 Tons)", main="Emmision from all sources (1999-2008)")

#close device
dev.off()