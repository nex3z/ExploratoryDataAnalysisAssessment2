library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimoreData <- subset(NEI, fips =="24510")

emissions <- aggregate(Emissions ~ year + type, data=baltimoreData, sum)

qplot(year, Emissions, data = emissions, colour = type, geom=c("point", "line"),
      xlab="Year", ylab="Emissions (tons)", 
      main="Total PM2.5 Emissions of Baltimore by Type")

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
