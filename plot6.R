#set working directory
directory <- "C:\\Users\\Constantina\\Google Drive\\coursera\\Exploratory Data Analysis\\Project_2\\"
setwd(directory)

#read the two files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

Baltimore_NEI <- NEI[NEI$fips=="24510",]
Baltimore_NEI$city <- "Baltimore City"
LosAngeles_NEI <- NEI[NEI$fips == "06037",]
LosAngeles_NEI$city <- "Los Angeles County"
All_Data <- rbind(Baltimore_NEI, LosAngeles_NEI)

library(ggplot2)

#Open the graphic device to plot the data
png(filename='plot6.png', width=480, height=480, units='px')

#plot emission for Baltimore and Los Angeles
plot6 <- ggplot(All_Data, aes(x=factor(year), y=Emissions)) + geom_bar(aes(fill=year),stat="identity") + facet_grid(scales="free", space="free", .~city) + theme_gray() + labs(x="Year", y=expression("Total PM2.5 Emission (Tons)")) + labs(title=expression("PM2.5 Motor Vehicle Source Emissions in Baltimore and LA(1999-2008)"))

print(plot6)

#close device
dev.off()