#set working directory
directory <- "C:\\Users\\Constantina\\Google Drive\\coursera\\Exploratory Data Analysis\\Project_2\\"
setwd(directory)

#read the two files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#aggregate total emission for Baltimre
Baltimore_NEI <- NEI[NEI$fips=="24510",]
Agg_Data_Baltimore <- aggregate(Emissions ~ year, Baltimore_NEI,sum)

#Open the graphic device to plot the data
png(filename='plot2.png', width=480, height=480, units='px')

#plot Baltimore data
barplot(Agg_Data_Baltimore$Emissions, names.arg = Agg_Data_Baltimore$year, xlab = "Year", ylab = "PM2.5 Total Emmision (10^6 Tons)", main = "Emmision from all Baltimore City sources (1999-2008)")

#close device
dev.off()