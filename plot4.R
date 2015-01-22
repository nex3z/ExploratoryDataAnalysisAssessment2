NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

mergedData <- merge(NEI, SCC, by.x="SCC", by.y="SCC")

coalDataFromSector <- mergedData[grepl("Coal", mergedData$EI.Sector, ignore.case=TRUE), ]
coalDataFromShortName <- mergedData[grepl("Coal", mergedData$Short.Name, ignore.case=TRUE), ]

emissionsByYear <- tapply(coalDataFromSector$Emissions, coalDataFromSector$year, sum)

plot(names(emissionsByYear), emissionsByYear, type="b", ann=FALSE, xaxt='n')
axis(side=1, at=names(emissionsByYear))
title("Total PM2.5 Emissions from Coal", xlab="Year", ylab="Emissions (tons)")

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
