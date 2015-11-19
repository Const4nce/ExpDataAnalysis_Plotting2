#set working directory
directory <- "C:\\Users\\Constantina\\Google Drive\\coursera\\Exploratory Data Analysis\\Project_2\\"
setwd(directory)

#read the two files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subset data for motor vehicles
motor_vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
motor_vehicles_SCC <- SCC[motor_vehicles,]$SCC
motor_vehicles_NEI <- NEI[NEI$SCC %in% motor_vehicles_SCC,]

#further subset for Baltimore only
Baltimore_vehicles_NEI <- motor_vehicles_NEI[motor_vehicles_NEI$fips==24510,]

library(ggplot2)

#Open the graphic device to plot the data
png(filename='plot5.png', width=480, height=480, units='px')
plot5 <- ggplot(Baltimore_vehicles_NEI,aes(factor(year),Emissions)) + geom_bar(stat="identity",fill="darkgray",width=0.75) + theme_bw() +  guides(fill=FALSE) + labs(x="Year", y=expression("Total PM2.5 Emission (10^5 Tons)")) + labs(title=expression("PM2.5 Motor Vehicle Source Emissions in Baltimore (1999-2008)"))

print(plot5)

#close device
dev.off()