NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimoreData <- subset(NEI, fips =="24510", select=c(Emissions, year))
emissionsByYear <- tapply(baltimoreData$Emissions, baltimoreData$year, sum)

plot(names(emissionsByYear), emissionsByYear, type="b", ann=FALSE, xaxt='n')
axis(side=1, at=names(emissionsByYear))
title("Total PM2.5 Emissions in Baltimore", xlab="Year", ylab="Emissions (tons)")

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
