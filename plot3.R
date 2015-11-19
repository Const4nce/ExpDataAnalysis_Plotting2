#set working directory
directory <- "C:\\Users\\Constantina\\Google Drive\\coursera\\Exploratory Data Analysis\\Project_2\\"
setwd(directory)

#read the two files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#aggregate total emission for Baltimre
Baltimore_NEI <- NEI[NEI$fips=="24510",]
Agg_Data_Baltimore_type <- aggregate(Emissions ~ year + type, Baltimore_NEI,sum)

library(ggplot2)

#Open the graphic device to plot the data
png(filename='plot3.png', width=480, height=480, units='px')

#plot data emissions in baltimore by type
plot3 <- ggplot(Agg_Data_Baltimore_type, aes(x=factor(year), y=Emissions)) + geom_bar(aes(fill = year), stat="identity") + theme_gray() + facet_grid(scales = "free",space="free", .~type) + labs(x="Year", y=expression("Total PM2.5 Emission (Tons)")) + labs(title=expression("PM2.5 Baltimore City Emissions by source Type (1999-2008)"))

print(plot3)

#close device
dev.off()