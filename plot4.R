#set working directory
directory <- "C:\\Users\\Constantina\\Google Drive\\coursera\\Exploratory Data Analysis\\Project_2\\"
setwd(directory)

#read the two files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset coal combustion related data
combustion_data <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coal_data <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
coal_Combustion <- (combustion_data & coal_data)
combustion_SCC <- SCC[coal_Combustion,]$SCC
combustion_NEI <- NEI[NEI$SCC %in% combustion_SCC,]

library(ggplot2)

#Open the graphic device to plot the data
png(filename='plot4.png', width=480, height=480, units='px')

#plot data
plot4 <- ggplot(combustion_NEI,aes(factor(year), Emissions/10^5)) + geom_bar(stat="identity",fill="grey",width=0.75) + theme_bw() +  guides(fill=FALSE) + labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^6 Tons)")) + labs(title=expression("PM"[2.5]*" Coal Combustion Emissions across US (1999-2008)"))

print(plot4)

#close device
dev.off()